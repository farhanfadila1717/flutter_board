part of 'boarding.dart';

class BackgorundPainter extends CustomPainter {
  final Color color;
  final bool isTop;
  final double arrowXPosition;
  final Size layoutSize;
  final double borderRadius;

  const BackgorundPainter({
    required this.layoutSize,
    this.color = Colors.black54,
    this.isTop = false,
    this.arrowXPosition = 50,
    this.borderRadius = 5,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width;
    final height = size.height;
    final polySize = 24;
    final polyHalfSize = polySize / 2;
    var paint = Paint()..color = color;
    var arrowTop = Path()
      ..moveTo(arrowXPosition, -polyHalfSize)
      ..lineTo(arrowXPosition - polyHalfSize, 0)
      ..lineTo(arrowXPosition + polyHalfSize, 0)
      ..close();
    var arrowBottom = Path()
      ..moveTo(arrowXPosition, height + polyHalfSize)
      ..lineTo(arrowXPosition - polyHalfSize, height)
      ..lineTo(arrowXPosition + polyHalfSize, height)
      ..close();

    RRect fullRect = RRect.fromRectAndRadius(
      Rect.fromCenter(
          center: Offset(width / 2, height / 2), width: width, height: height),
      Radius.circular(borderRadius),
    );

    canvas.drawRRect(fullRect, paint);
    canvas.drawPath(isTop ? arrowTop : arrowBottom, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
