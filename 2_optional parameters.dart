//2_optional parameters.dart

class Point {
  final int x;
  final int y;
  
  const Point(this.x, this.y);
}

class Rectangle {
  final Point origin;
  final int width;
  final int height;
  
  Rectangle({this.origin = const Point(0, 0), this.width = 0, this.height = 0});

  String toString() =>
    'Origin: (${origin.x}, ${origin.y}), width: $width, height: $height';
}

void main() {
  print(Rectangle(origin: const Point(10, 20), width: 100, height: 200));
  print(Rectangle(origin: const Point(10, 10)));
  print(Rectangle(width: 200));
  print(Rectangle());
}
