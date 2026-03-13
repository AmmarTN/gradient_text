import 'package:flutter/material.dart';
import 'package:text_gradient_widget/text_gradient_widget.dart';

void main() => runApp(const GradientTextExampleApp());

class GradientTextExampleApp extends StatelessWidget {
  const GradientTextExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gradient Text Example',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const GradientTextExampleScreen(),
    );
  }
}

class GradientTextExampleScreen extends StatelessWidget {
  const GradientTextExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gradient Text Examples')),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- Linear Gradients ---
            _SectionTitle('Linear Gradients'),
            SizedBox(height: 12),

            _Label('Left to Right (default)'),
            GradientText(
              'Hello Flutter!',
              colors: [Colors.blue, Colors.purple],
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),

            _Label('Right to Left'),
            GradientText(
              'Right to Left',
              colors: [Colors.orange, Colors.pink],
              gradientDirection: GradientDirection.rtl,
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),

            _Label('Top to Bottom'),
            GradientText(
              'Top to Bottom',
              colors: [Colors.green, Colors.teal],
              gradientDirection: GradientDirection.ttb,
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),

            _Label('Bottom to Top'),
            GradientText(
              'Bottom to Top',
              colors: [Colors.red, Colors.amber],
              gradientDirection: GradientDirection.btt,
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),

            _Label('Bottom-Left to Top-Right'),
            GradientText(
              'Diagonal BL → TR',
              colors: [Colors.indigo, Colors.cyan],
              gradientDirection: GradientDirection.blttr,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),

            _Label('Bottom-Right to Top-Left'),
            GradientText(
              'Diagonal BR → TL',
              colors: [Colors.deepPurple, Colors.pinkAccent],
              gradientDirection: GradientDirection.brttl,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),

            _Label('Top-Left to Bottom-Right'),
            GradientText(
              'Diagonal TL → BR',
              colors: [Colors.lime, Colors.lightBlue],
              gradientDirection: GradientDirection.tltbr,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),

            _Label('Top-Right to Bottom-Left'),
            GradientText(
              'Diagonal TR → BL',
              colors: [Colors.amber, Colors.deepOrange],
              gradientDirection: GradientDirection.trtbl,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 32),

            // --- Radial Gradient ---
            _SectionTitle('Radial Gradient'),
            SizedBox(height: 12),

            GradientText(
              'Radial Glow',
              colors: [Colors.red, Colors.orange, Colors.yellow],
              gradientType: GradientType.radial,
              radius: 1.5,
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 32),

            // --- Custom Stops ---
            _SectionTitle('Custom Stops'),
            SizedBox(height: 12),

            GradientText(
              'Custom Color Stops',
              colors: [Colors.green, Colors.teal, Colors.cyan],
              stops: [0.0, 0.3, 1.0],
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 32),

            // --- Overflow & MaxLines ---
            _SectionTitle('Overflow & MaxLines'),
            SizedBox(height: 12),

            GradientText(
              'This is a long gradient text that should be truncated with an '
              'ellipsis when it overflows past the maximum number of lines.',
              colors: [Colors.blue, Colors.purple],
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.title);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headlineSmall,
    );
  }
}

class _Label extends StatelessWidget {
  const _Label(this.label);
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Text(label, style: Theme.of(context).textTheme.bodySmall),
    );
  }
}
