part of 'boarding.dart';

class HightlightPainter extends CustomPainter {
  HightlightPainter({
    required this.color,
    required this.screenSize,
    required this.hightlightMargin,
    required this.hightlightBorderRadius,
    required this.hightlightShape,
    required this.progress,
  });

  final Color color;
  final Size screenSize;
  final double hightlightMargin;
  final double hightlightBorderRadius;
  final BoxShape hightlightShape;
  final double progress;

  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;
    final center = size.center(Offset.zero);
    final Path path = Path();
    final Paint paint = Paint()..color = color;
    final progressSize = progress * (screenSize.width / 1.5);
    path.fillType = PathFillType.evenOdd;
    path.addRect(
      Rect.fromLTRB(
        -screenSize.width * 2,
        -screenSize.height * 2,
        screenSize.width * 2,
        screenSize.height * 2,
      ),
    );
    if (hightlightShape == BoxShape.rectangle) {
      path.addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTRB(
            -hightlightMargin + -(progressSize),
            -hightlightMargin + -(progressSize),
            width + hightlightMargin + (progressSize),
            height + hightlightMargin + (progressSize),
          ),
          Radius.circular(hightlightBorderRadius),
        ),
      );
    } else {
      path.addOval(
        Rect.fromCenter(
          center: center,
          width: width + hightlightMargin + (progressSize),
          height: height + hightlightMargin + (progressSize),
        ),
      );
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant HightlightPainter oldDelegate) {
    return color != oldDelegate.color || progress != oldDelegate.progress;
  }
}
