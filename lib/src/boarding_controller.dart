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
        final RenderBox renderBox =
            content.keys[i].currentContext!.findRenderObject() as RenderBox;

        final Offset offset = renderBox.localToGlobal(Offset.zero);
        final double x = ((offset.dx + renderBox.size.width) - 24) -
            ((renderBox.size.width - 12) / 2);
        final double y = offset.dy;

        final BoardingParentData data = BoardingParentData(
          size: renderBox.size,
          isTop: y < (size.height / 2),
          x: x,
          y: y,
          offset: offset,
        );

        _content.items[i]
          ..boardingParentData = data
          ..childCount = _content.items.length;
      }
    }

    Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        pageBuilder: (context, _, __) {
          return Boarding(
            content: _content,
            theme: _content.theme,
          );
        },
      ),
    );
    value = false;
    notifyListeners();
  }
}
