part of 'boarding.dart';

// ignore: must_be_immutable
class BoardingWidget extends StatelessWidget {
  BoardingWidget({
    Key? key,
    required this.boardingItem,
    this.theme,
    this.onPrevious,
    this.onNext,
    this.onClose,
    this.boardingParentData = const BoardingParentData(),
    this.previousText = "Back",
    this.nextText = "Got it",
    this.leading = const SizedBox.shrink(),
    this.index = 0,
    this.selectedIndex = 0,
    this.childCount = 1,
    this.hightlightBorderRadius = 5,
    this.hightlightMargin = 5,
    this.hightlightShape = BoxShape.rectangle,
    this.withHightlight = true,
  }) : super(key: key);

  final Widget leading;
  final List<Widget> boardingItem;
  final bool withHightlight;
  final double hightlightMargin;
  final double hightlightBorderRadius;
  final BoxShape hightlightShape;
  BoardingParentData boardingParentData;
  int selectedIndex;
  int index;
  int childCount;
  VoidCallback? onPrevious;
  VoidCallback? onNext;
  VoidCallback? onClose;
  String previousText;
  String nextText;
  BoardingTheme? theme;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final BoardingTheme _theme = theme ?? const BoardingTheme();
    return SizedBox(
      key: key,
      width: size.width,
      child: Padding(
        padding: _theme.margin,
        child: CustomPaint(
          painter: BackgorundPainter(
            color: _theme.backgroundColor,
            layoutSize: size,
            arrowXPosition: boardingParentData.x,
            isTop: boardingParentData.isTop,
            borderRadius: _theme.borderRadius,
          ),
          child: Padding(
            padding: _theme.padding,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    leading,
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        onClose?.call();
                        Navigator.pop(context);
                      },
                      child: _theme.closeIcon ??
                          Icon(
                            Icons.close_rounded,
                            color: _theme.color,
                            size: 20,
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                ...boardingItem,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Visibility(
                      visible: childCount > 1,
                      child: IgnorePointer(
                        ignoring: selectedIndex == 0,
                        child: SizedBox.fromSize(
                          size: _theme.buttonSize,
                          child: TextButton(
                            onPressed: () {
                              if (onPrevious != null) {
                                onPrevious!();
                              }
                            },
                            child: Text(
                              previousText,
                              style: TextStyle(
                                color: selectedIndex == 0
                                    ? _theme.color.withOpacity(.2)
                                    : _theme.color,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            style: _theme.previousButtonStyle ??
                                const ButtonStyle(),
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: _theme.withDot && childCount > 1,
                      child: Row(
                        children: List.generate(
                          childCount,
                          (index) {
                            int indexBetweenSelectedIndex =
                                selectedIndex - index;
                            if (indexBetweenSelectedIndex < 0) {
                              indexBetweenSelectedIndex =
                                  indexBetweenSelectedIndex * -1;
                            }

                            final double size =
                                (10 - indexBetweenSelectedIndex * 2.0);
                            return Visibility(
                              visible: size > 0,
                              child: Container(
                                height: size,
                                width: size,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 3),
                                decoration: BoxDecoration(
                                  color: selectedIndex == index
                                      ? Colors.white
                                      : Colors.white10,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox.fromSize(
                      size: _theme.buttonSize,
                      child: TextButton(
                        onPressed: () {
                          if (onNext != null) {
                            onNext!();
                          }
                        },
                        child: Text(
                          nextText,
                          style: TextStyle(
                            color: _theme.backgroundColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        style: _theme.nextButtonStyle ??
                            ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(_theme.color),
                            ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
