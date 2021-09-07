part of 'boarding.dart';

class BoardingItem extends StatelessWidget {
  const BoardingItem({
    Key? key,
    required this.message,
    this.icon = const SizedBox.shrink(),
    this.foregroundColor = Colors.white,
    this.textStyle,
  }) : super(key: key);

  final Color foregroundColor;
  final TextStyle? textStyle;
  final Widget icon;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: IconTheme(
        data: IconThemeData(color: foregroundColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            icon,
            const SizedBox(width: 10),
            Flexible(
              child: Text(
                message,
                style: textStyle ??
                    TextStyle(
                      color: foregroundColor,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
