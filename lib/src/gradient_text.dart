import 'package:flutter/material.dart';

import 'constants.dart';

/// A widget that displays text with a gradient effect.
///
/// [GradientText] applies either a [LinearGradient] or [RadialGradient]
/// to text using Flutter's [ShaderMask] widget with [BlendMode.srcIn].
///
/// At least two [colors] must be provided to create the gradient.
///
/// {@tool snippet}
/// A simple linear gradient from blue to purple, left to right:
///
/// ```dart
/// GradientText(
///   'Hello Flutter',
///   colors: const [Colors.blue, Colors.purple],
/// )
/// ```
/// {@end-tool}
///
/// {@tool snippet}
/// A radial gradient with a custom radius:
///
/// ```dart
/// GradientText(
///   'Radial Text',
///   colors: const [Colors.red, Colors.orange],
///   gradientType: GradientType.radial,
///   radius: 1.5,
/// )
/// ```
/// {@end-tool}
class GradientText extends StatelessWidget {
  /// Creates a gradient text widget.
  ///
  /// The [text] parameter is the string to display.
  ///
  /// The [colors] list must contain at least two colors.
  /// Creates a gradient text widget.
  ///
  /// [colors] must contain at least two colors — this is validated at
  /// runtime via an assertion in [build].
  const GradientText(
    this.text, {
    required this.colors,
    this.gradientDirection = GradientDirection.ltr,
    this.gradientType = GradientType.linear,
    super.key,
    this.overflow,
    this.radius = 1.0,
    this.style,
    this.textAlign,
    this.stops,
    this.textScaleFactor,
    this.maxLines,
  });

  /// The text to display.
  final String text;

  /// Colors used to create the gradient effect.
  ///
  /// Must contain at least two colors.
  final List<Color> colors;

  /// The direction of the linear gradient.
  ///
  /// Defaults to [GradientDirection.ltr] (left to right).
  /// This property is ignored when [gradientType] is [GradientType.radial].
  final GradientDirection? gradientDirection;

  /// The type of gradient to apply.
  ///
  /// Defaults to [GradientType.linear].
  final GradientType gradientType;

  /// How visual overflow should be handled.
  final TextOverflow? overflow;

  /// The radius of the radial gradient, as a fraction of the shortest side
  /// of the paint box.
  ///
  /// Defaults to `1.0`. Only used when [gradientType] is
  /// [GradientType.radial].
  final double radius;

  /// The text style to apply.
  ///
  /// The [TextStyle.color] is overridden internally to [Colors.white]
  /// so the [ShaderMask] renders correctly.
  final TextStyle? style;

  /// How the text should be aligned horizontally.
  final TextAlign? textAlign;

  /// The number of font pixels for each logical pixel.
  ///
  /// Passed directly to the underlying [Text] widget.
  final double? textScaleFactor;

  /// An optional maximum number of lines for the text to span.
  final int? maxLines;

  /// A list of values from 0.0 to 1.0 that denote fractions along the
  /// gradient.
  ///
  /// If non-null, must have the same length as [colors].
  final List<double>? stops;

  @override
  Widget build(BuildContext context) {
    assert(
      colors.length >= 2,
      'Colors list must have at least two colors',
    );

    return ShaderMask(
      shaderCallback: (Rect bounds) {
        switch (gradientType) {
          case GradientType.linear:
            final (begin, end) = _resolveDirection(gradientDirection);
            return LinearGradient(
              begin: begin,
              end: end,
              colors: colors,
              stops: stops,
            ).createShader(bounds);
          case GradientType.radial:
            return RadialGradient(
              colors: colors,
              radius: radius,
              stops: stops,
            ).createShader(bounds);
        }
      },
      blendMode: BlendMode.srcIn,
      child: Text(
        text,
        overflow: overflow,
        style: style != null
            ? style!.copyWith(color: Colors.white)
            : const TextStyle(color: Colors.white),
        textScaler: textScaleFactor != null
            ? TextScaler.linear(textScaleFactor!)
            : null,
        textAlign: textAlign,
        maxLines: maxLines,
      ),
    );
  }

  /// Resolves a [GradientDirection] to a pair of [Alignment] values.
  static (Alignment, Alignment) _resolveDirection(
    GradientDirection? direction,
  ) {
    return switch (direction) {
      GradientDirection.rtl => (Alignment.centerRight, Alignment.centerLeft),
      GradientDirection.ttb => (Alignment.topCenter, Alignment.bottomCenter),
      GradientDirection.btt => (Alignment.bottomCenter, Alignment.topCenter),
      GradientDirection.blttr => (Alignment.bottomLeft, Alignment.topRight),
      GradientDirection.brttl => (Alignment.bottomRight, Alignment.topLeft),
      GradientDirection.tltbr => (Alignment.topLeft, Alignment.bottomRight),
      GradientDirection.trtbl => (Alignment.topRight, Alignment.bottomLeft),
      _ => (Alignment.centerLeft, Alignment.centerRight),
    };
  }
}
