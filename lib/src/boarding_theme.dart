part of 'boarding.dart';

class BoardingTheme {
  final double borderRadius;
  final Size buttonSize;
  final Size dotSize;
  final Color color;
  final Color backgroundColor;
  final String finishLabel;
  final String nextLabel;
  final bool withDot;
  final Color? dotColor;
  final ButtonStyle? buttonStyle;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final Duration animationDuration;
  final Duration reverseAnimationDuration;
  final Curve curve;
  final Curve? reverseCurve;

  const BoardingTheme({
    this.borderRadius = 10,
    this.buttonSize = const Size(70, 35),
    this.dotSize = const Size.square(8),
    this.color = Colors.white,
    this.backgroundColor = const Color(0xCC000000),
    this.buttonStyle,
    this.dotColor = Colors.white,
    this.finishLabel = "Finish",
    this.nextLabel = "Next",
    this.withDot = true,
    this.margin = const EdgeInsets.all(20),
    this.padding = const EdgeInsets.all(16),
    this.animationDuration = const Duration(milliseconds: 300),
    this.reverseAnimationDuration = const Duration(milliseconds: 200),
    this.curve = Curves.easeIn,
    this.reverseCurve,
  });
}
