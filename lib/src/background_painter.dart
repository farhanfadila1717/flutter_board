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
    final _arrowXPosition = arrowXPosition < 18
        ? arrowXPosition + 18
        : arrowXPosition > (width - 18)
            ? arrowXPosition - 18
            : arrowXPosition;
    const polySize = 24;

    const polyHalfSize = polySize / 2;
    var paint = Paint()..color = color;

    var arrowTop = Path()
      ..moveTo(_arrowXPosition, -polyHalfSize)
      ..lineTo(_arrowXPosition - polyHalfSize, 0)
      ..lineTo(_arrowXPosition + polyHalfSize, 0)
      ..close();
    var arrowBottom = Path()
      ..moveTo(_arrowXPosition, height + polyHalfSize)
      ..lineTo(_arrowXPosition - polyHalfSize, height)
      ..lineTo(_arrowXPosition + polyHalfSize, height)
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
