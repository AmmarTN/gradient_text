/// The type of gradient to apply to the text.
enum GradientType {
  /// A linear gradient that transitions colors along a straight line.
  linear,

  /// A radial gradient that transitions colors outward from a center point.
  radial,
}

/// The direction in which a linear gradient is applied.
///
/// Each value maps to a pair of [Alignment] values representing the
/// `begin` and `end` of the gradient.
enum GradientDirection {
  /// Left to right.
  ltr,

  /// Right to left.
  rtl,

  /// Top to bottom.
  ttb,

  /// Bottom to top.
  btt,

  /// Bottom-left to top-right.
  blttr,

  /// Bottom-right to top-left.
  brttl,

  /// Top-left to bottom-right.
  tltbr,

  /// Top-right to bottom-left.
  trtbl,
}
