import 'package:flutter/material.dart';

part 'background_painter.dart';
part 'boarding_controller.dart';
part 'boarding_parent_data.dart';
part 'boarding_widget.dart';
part 'boarding_item.dart';
part 'boarding_content.dart';
part 'boarding_theme.dart';
part 'hightlight_painter.dart';

class Boarding extends StatefulWidget {
  const Boarding({Key? key, required this.content, required this.theme})
      : super(key: key);

  final BoardingContent content;
  final BoardingTheme theme;

  @override
  _BoardingState createState() => _BoardingState();
}

class _BoardingState extends State<Boarding>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<double> progressAnimation;
  Animatable opacityAnimation = CurveTween(
      curve: const Interval(0.5, 1.0, curve: Curves.linearToEaseOut));
  int currentIndex = 0;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 700));
    progressAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
        CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn));
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      controller.forward();
    });
    super.initState();
  }

  void check({bool previous = false}) {
    if (previous) {
      currentIndex--;
    } else {
      currentIndex++;
    }
    if (currentIndex < widget.content.items.length) {
      controller.reset();
      controller.forward();
      setState(() {});
    } else {
      if (widget.content.onFinish != null) {
        widget.content.onFinish!();
      }
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final BoardingWidget boardingWidget = widget.content.items[currentIndex];
    final BoardingParentData data = boardingWidget.boardingParentData;

    final Size size = MediaQuery.of(context).size;
    final _theme = widget.theme;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SizedBox.expand(
        child: Stack(
          children: [
            Positioned(
                top: data.offset.dy - 5,
                left: data.offset.dx - 5,
                child: AnimatedBuilder(
                  animation: controller,
                  builder: (context, _) {
                    return CustomPaint(
                      painter: HightlightPainter(
                        progress: progressAnimation.value,
                        color: _theme.barrierColor,
                        screenSize: size,
                        hightlightBorderRadius:
                            boardingWidget.hightlightBorderRadius,
                        hightlightMargin: boardingWidget.hightlightMargin,
                        hightlightShape: boardingWidget.hightlightShape,
                      ),
                      size: Size(data.size.width + 10, data.size.height + 10),
                    );
                  },
                )),
            Positioned(
              top: data.isTop
                  ? data.y +
                      data.size.height +
                      boardingWidget.hightlightMargin +
                      5
                  : null,
              bottom: data.isTop
                  ? null
                  : (size.height -
                      data.y +
                      boardingWidget.hightlightMargin +
                      5),
              child: AnimatedBuilder(
                animation: controller,
                builder: (context, child) {
                  return Opacity(
                    opacity: opacityAnimation.evaluate(controller),
                    child: child,
                  );
                },
                child: boardingWidget
                  ..onNext = () {
                    check();
                  }
                  ..onPrevious = () {
                    check(previous: true);
                  }
                  ..nextText = currentIndex + 1 < widget.content.items.length
                      ? _theme.nextLabel
                      : _theme.finishLabel
                  ..selectedIndex = currentIndex
                  ..theme = _theme,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
