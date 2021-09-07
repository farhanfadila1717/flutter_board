part of 'boarding.dart';

class BoardingController extends ValueNotifier<bool> {
  BoardingController() : super(false);

  void showBoarding(
    BuildContext context, {
    required BoardingContent content,
  }) async {
    final Size size = MediaQuery.of(context).size;
    var _content = content;
    value = true;
    notifyListeners();

    for (int i = 0; i < content.keys.length; i++) {
      if (content.keys[i].currentContext != null) {
        RenderBox renderBox =
            content.keys[i].currentContext!.findRenderObject() as RenderBox;

        Offset offset = renderBox.localToGlobal(Offset.zero);
        double x = ((offset.dx + renderBox.size.width) - 24) -
            ((renderBox.size.width - 12) / 2);

        BoardingParentData data = BoardingParentData(
          size: renderBox.size,
          isTop: offset.dy < (size.height / 2),
          x: x,
          y: offset.dy,
        );

        _content.items[i]
          ..boardingParentData = data
          ..childCount = _content.items.length;
      }
    }

    await showDialog(
      context: context,
      barrierColor: Colors.transparent,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Boarding(
          content: _content,
        );
      },
    );
    value = false;
    notifyListeners();
  }
}
