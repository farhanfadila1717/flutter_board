part of 'boarding.dart';

class BoardingParentData {
  final Size size;
  final bool isTop;
  final double x;
  final double y;

  const BoardingParentData(
      {this.size = Size.zero, this.isTop = false, this.x = 50, this.y = 50});

  BoardingParentData copyWith(
          {Size? size, bool? isTop, double? x, double? y}) =>
      BoardingParentData(
          size: size ?? this.size,
          isTop: isTop ?? this.isTop,
          x: x ?? this.x,
          y: y ?? this.y);

  @override
  String toString() => "size: $size, isTop: $isTop, x: $x, y: $y";
}
