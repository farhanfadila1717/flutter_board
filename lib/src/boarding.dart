import 'package:flutter/material.dart';

part 'background_painter.dart';
part 'boarding_controller.dart';
part 'boarding_parent_data.dart';
part 'boarding_widget.dart';
part 'boarding_item.dart';
part 'boarding_content.dart';
part 'boarding_theme.dart';

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
  late AnimationController _animationController;
  late Animation<double> _animation;
  late OverlayState? _overlayState;
  late OverlayEntry _overlayEntry;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _overlayState = Overlay.of(context);
    _animationController = AnimationController(
      vsync: this,
      duration: widget.theme.animationDuration,
      reverseDuration: widget.theme.reverseAnimationDuration,
    );

    _animation = CurvedAnimation(
      parent: _animationController,
      curve: widget.theme.curve,
      reverseCurve: widget.theme.reverseCurve ?? widget.theme.curve,
    );
    Future.delayed(
      Duration(milliseconds: 10),
      () {
        showEntry();
      },
    );
  }

  void showEntry() {
    final BoardingWidget boardingWidget = widget.content.items[_currentIndex];
    final BoardingParentData data = boardingWidget.boardingParentData;

    _overlayEntry = OverlayEntry(
      builder: (BuildContext context) {
        _animationController.forward();
        return Positioned(
          top: data.isTop ? (data.y + data.size.height / 2) + 30 : null,
          bottom: data.isTop ? null : data.size.height + 30,
          child: Dialog(
            insetPadding: EdgeInsets.zero,
            backgroundColor: Colors.transparent,
            child: AnimatedBuilder(
              animation: _animationController,
              builder: (context, snapshot) {
                final BoardingTheme _theme =
                    boardingWidget.theme ?? widget.theme;
                return FadeTransition(
                  opacity: _animation,
                  child: boardingWidget
                    ..onTap = () {
                      checkEntry();
                    }
                    ..buttonText = _currentIndex < widget.content.items.length
                        ? _theme.nextLabel
                        : _theme.finishLabel
                    ..selectedIndex = _currentIndex - 1
                    ..theme = _theme,
                );
              },
            ),
          ),
        );
      },
    );

    if (_overlayState != null) {
      _overlayState!.insert(_overlayEntry);
      _currentIndex++;
    }
  }

  void checkEntry() async {
    await _animationController.reverse();
    _animationController.reset();
    if (_currentIndex < widget.content.items.length) {
      _overlayEntry.remove();
      showEntry();
    } else {
      _overlayEntry.remove();
      if (widget.content.onFinish != null) {
        widget.content.onFinish!();
      }
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.shrink();
  }
}
