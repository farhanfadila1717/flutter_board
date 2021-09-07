part of 'boarding.dart';

// ignore: must_be_immutable
class BoardingWidget extends StatelessWidget {
  BoardingWidget({
    Key? key,
    required this.boardingItem,
    this.theme,
    this.onTap,
    this.onClose,
    this.boardingParentData = const BoardingParentData(),
    this.buttonText = "Got it",
    this.leading = const SizedBox.shrink(),
    this.index = 0,
    this.selectedIndex = 0,
    this.childCount = 1,
  }) : super(key: key);

  final Widget leading;
  final List<Widget> boardingItem;
  BoardingParentData boardingParentData;
  int selectedIndex;
  int index;
  int childCount;
  VoidCallback? onTap;
  VoidCallback? onClose;
  String buttonText;
  BoardingTheme? theme;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final BoardingTheme _theme = theme ?? BoardingTheme();
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
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.close,
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
                      visible: _theme.withDot && childCount > 0,
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
                          if (onTap != null) {
                            onTap!();
                          }
                        },
                        child: Text(
                          buttonText,
                          style: TextStyle(
                            color: _theme.backgroundColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        style: _theme.buttonStyle ??
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
