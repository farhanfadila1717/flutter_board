part of 'boarding.dart';

// ignore: must_be_immutable
class BoardingWidget extends StatelessWidget {
  BoardingWidget({
    Key? key,
    this.onTap,
    this.boardingParentData = const BoardingParentData(),
    this.buttonText = "Got it",
    this.backgroundColor = const Color(0xCC000000),
    this.foregroundColor = Colors.white,
    this.leading = const SizedBox.shrink(),
    required this.boardingItem,
    this.index = 0,
    this.selectedIndex = 0,
    this.childCount = 1,
    this.withDot = true,
  }) : super(key: key);

  BoardingParentData boardingParentData;
  final Color backgroundColor;
  final Color foregroundColor;
  final Widget leading;
  final List<Widget> boardingItem;
  final bool withDot;
  int selectedIndex;
  int index;
  int childCount;
  VoidCallback? onTap;
  VoidCallback? onBack;
  String buttonText;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      key: key,
      width: size.width,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: CustomPaint(
          painter: BackgorundPainter(
            color: backgroundColor,
            layoutSize: size,
            arrowXPosition: boardingParentData.x,
            isTop: boardingParentData.isTop,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
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
                        color: foregroundColor,
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
                      visible: withDot,
                      child: Row(
                        children: List.generate(childCount, (index) {
                          int indexBetweenSelectedIndex = selectedIndex - index;
                          if (indexBetweenSelectedIndex < 0) {
                            indexBetweenSelectedIndex =
                                indexBetweenSelectedIndex * -1;
                          }

                          final double size =
                              (10 - indexBetweenSelectedIndex * 2.0);
                          return Container(
                            height: size,
                            width: size,
                            margin: const EdgeInsets.symmetric(horizontal: 3),
                            decoration: BoxDecoration(
                              color: selectedIndex == index
                                  ? Colors.white
                                  : Colors.white10,
                              shape: BoxShape.circle,
                            ),
                          );
                        }),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        if (onTap != null) {
                          onTap!();
                        }
                      },
                      child: Text(
                        buttonText,
                        style: TextStyle(
                          color: backgroundColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(foregroundColor),
                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(horizontal: 25, vertical: 16)),
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
