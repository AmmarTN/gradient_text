# Text Gradient Widget

[![pub package](https://img.shields.io/pub/v/text_gradient_widget.svg)](https://pub.dev/packages/text_gradient_widget)
[![pub points](https://img.shields.io/pub/points/text_gradient_widget)](https://pub.dev/packages/text_gradient_widget/score)
[![likes](https://img.shields.io/pub/likes/text_gradient_widget)](https://pub.dev/packages/text_gradient_widget)
[![license](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![Flutter](https://img.shields.io/badge/Platform-Flutter-02569B?logo=flutter)](https://flutter.dev)

A Flutter widget for rendering text with beautiful **linear** and **radial** gradient effects, supporting 8 gradient directions, custom color stops, and full text styling.

## Screenshots

<p>
  <img src="screenshots/example_1.png" width="300" alt="Gradient text example - light"/>
  <img src="screenshots/example_2.png" width="300" alt="Gradient text example - dark"/>
</p>

```dart
GradientText('Text Gradient Widget',
    colors: const [Colors.red, Colors.teal, Colors.yellow],
    stops: const [0.0, 0.5, 1.0],
    style: AppTextStyles(context).px28wRegular()),
```

## Features

- **Linear gradients** with 8 directional options
- **Radial gradients** with configurable radius
- Custom gradient **color stops**
- Full **TextStyle** support (font size, weight, family, etc.)
- Text **overflow**, **maxLines**, and **alignment** control
- Zero dependencies beyond Flutter SDK
- Null-safe, Dart 3+ compatible

## Installation

```sh
flutter pub add text_gradient_widget
```

Or add it to your `pubspec.yaml`:

```yaml
dependencies:
  text_gradient_widget: ^1.0.1
```

Then run:

```sh
flutter pub get
```

## Usage

Import the package:

```dart
import 'package:text_gradient_widget/text_gradient_widget.dart';
```

### Linear Gradient (Left to Right)

```dart
GradientText(
  'Hello Flutter!',
  colors: const [Colors.blue, Colors.purple],
  style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
)
```

### Radial Gradient

```dart
GradientText(
  'Radial Glow',
  colors: const [Colors.red, Colors.orange, Colors.yellow],
  gradientType: GradientType.radial,
  radius: 1.5,
  style: const TextStyle(fontSize: 36),
)
```

### Custom Stops

```dart
GradientText(
  'Custom Stops',
  colors: const [Colors.green, Colors.teal, Colors.cyan],
  stops: const [0.0, 0.5, 1.0],
  style: const TextStyle(fontSize: 32),
)
```

### Top to Bottom

```dart
GradientText(
  'Top to Bottom',
  colors: const [Colors.pink, Colors.deepPurple],
  gradientDirection: GradientDirection.ttb,
  style: const TextStyle(fontSize: 30),
)
```

### Diagonal (Bottom-Left to Top-Right)

```dart
GradientText(
  'Diagonal!',
  colors: const [Colors.amber, Colors.deepOrange],
  gradientDirection: GradientDirection.blttr,
  style: const TextStyle(fontSize: 28),
)
```

### Right to Left

```dart
GradientText(
  'Right to Left',
  colors: const [Colors.indigo, Colors.lightBlue],
  gradientDirection: GradientDirection.rtl,
  style: const TextStyle(fontSize: 28),
)
```

## API Reference

### GradientText

| Parameter | Type | Default | Description |
|---|---|---|---|
| `text` | `String` | **required** | The text to display |
| `colors` | `List<Color>` | **required** | Gradient colors (minimum 2) |
| `gradientDirection` | `GradientDirection?` | `GradientDirection.ltr` | Direction for the linear gradient |
| `gradientType` | `GradientType` | `GradientType.linear` | The type of gradient (`linear` or `radial`) |
| `overflow` | `TextOverflow?` | `null` | How visual overflow is handled |
| `radius` | `double` | `1.0` | Radial gradient radius (fraction of shortest side) |
| `style` | `TextStyle?` | `null` | Text style (color is overridden internally) |
| `textAlign` | `TextAlign?` | `null` | Horizontal text alignment |
| `textScaleFactor` | `double?` | `null` | Font pixels per logical pixel |
| `maxLines` | `int?` | `null` | Maximum number of lines |
| `stops` | `List<double>?` | `null` | Gradient stop positions (0.0 to 1.0) |

### GradientDirection

| Value | Description |
|---|---|
| `ltr` | Left to right |
| `rtl` | Right to left |
| `ttb` | Top to bottom |
| `btt` | Bottom to top |
| `blttr` | Bottom-left to top-right |
| `brttl` | Bottom-right to top-left |
| `tltbr` | Top-left to bottom-right |
| `trtbl` | Top-right to bottom-left |

### GradientType

| Value | Description |
|---|---|
| `linear` | Linear gradient along a straight line |
| `radial` | Radial gradient from center outward |

## Example

See the [example](example/lib/main.dart) directory for a complete, runnable sample app showcasing all gradient directions and types.

## Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/my-feature`)
3. Commit your changes (`git commit -am 'Add my feature'`)
4. Push to the branch (`git push origin feature/my-feature`)
5. Open a Pull Request

Please ensure all tests pass and code is formatted before submitting:

```sh
flutter test
dart format .
flutter analyze
```

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
