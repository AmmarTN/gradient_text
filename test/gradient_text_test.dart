import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:text_gradient_widget/text_gradient_widget.dart';

void main() {
  group('GradientText', () {
    testWidgets('renders text without errors', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: GradientText(
              'Hello',
              colors: [Colors.blue, Colors.red],
            ),
          ),
        ),
      );

      expect(find.text('Hello'), findsOneWidget);
    });

    testWidgets('contains a ShaderMask widget', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: GradientText(
              'Shader',
              colors: [Colors.blue, Colors.red],
            ),
          ),
        ),
      );

      expect(find.byType(ShaderMask), findsOneWidget);
    });

    testWidgets('renders with linear gradient type', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: GradientText(
              'Linear',
              colors: [Colors.blue, Colors.red],
              gradientType: GradientType.linear,
            ),
          ),
        ),
      );

      expect(find.text('Linear'), findsOneWidget);
      expect(find.byType(ShaderMask), findsOneWidget);
    });

    testWidgets('renders with radial gradient type', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: GradientText(
              'Radial',
              colors: [Colors.blue, Colors.red],
              gradientType: GradientType.radial,
              radius: 1.5,
            ),
          ),
        ),
      );

      expect(find.text('Radial'), findsOneWidget);
      expect(find.byType(ShaderMask), findsOneWidget);
    });

    testWidgets('renders with all gradient directions', (tester) async {
      for (final direction in GradientDirection.values) {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: GradientText(
                'Dir',
                colors: const [Colors.blue, Colors.red],
                gradientDirection: direction,
              ),
            ),
          ),
        );

        expect(find.text('Dir'), findsOneWidget);
      }
    });

    testWidgets('renders with custom stops', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: GradientText(
              'Stops',
              colors: [Colors.blue, Colors.green, Colors.red],
              stops: [0.0, 0.5, 1.0],
            ),
          ),
        ),
      );

      expect(find.text('Stops'), findsOneWidget);
    });

    testWidgets('applies text style', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: GradientText(
              'Styled',
              colors: [Colors.blue, Colors.red],
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text('Styled'));
      expect(textWidget.style?.fontSize, 24);
      expect(textWidget.style?.fontWeight, FontWeight.bold);
      // Color should be forced to white for ShaderMask
      expect(textWidget.style?.color, Colors.white);
    });

    testWidgets('applies maxLines and overflow', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: GradientText(
              'Overflow test with a very long text',
              colors: [Colors.blue, Colors.red],
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(
        find.text('Overflow test with a very long text'),
      );
      expect(textWidget.maxLines, 1);
      expect(textWidget.overflow, TextOverflow.ellipsis);
    });

    testWidgets('asserts when less than 2 colors are provided', (tester) async {
      final errors = <FlutterErrorDetails>[];
      FlutterError.onError = errors.add;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: GradientText(
              'Fail',
              colors: [Colors.blue],
            ),
          ),
        ),
      );

      FlutterError.onError = FlutterError.dumpErrorToConsole;
      expect(errors, isNotEmpty);
      expect(
        errors.first.exception.toString(),
        contains('Colors list must have at least two colors'),
      );
    });

    testWidgets('asserts when 0 colors are provided', (tester) async {
      final errors = <FlutterErrorDetails>[];
      FlutterError.onError = errors.add;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: GradientText(
              'Fail',
              colors: [],
            ),
          ),
        ),
      );

      FlutterError.onError = FlutterError.dumpErrorToConsole;
      expect(errors, isNotEmpty);
      expect(
        errors.first.exception.toString(),
        contains('Colors list must have at least two colors'),
      );
    });
  });
}
