part of 'boarding.dart';

class BoardingContent {
  final List<GlobalKey> keys;
  final List<BoardingWidget> items;
  final BoardingTheme theme;
  final VoidCallback? onFinish;

  const BoardingContent({
    required this.items,
    required this.keys,
    this.onFinish,
    this.theme = const BoardingTheme(),
  });
}
