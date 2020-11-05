import 'package:flutter/material.dart';

class PaintDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: Colors.yellow.withAlpha(100),
        child: CustomPaint(
          size: MediaQuery.of(context).size,
          painter: MyPaint(),
        ),
      ),
    );
  }
}

class MyPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    print('canvas size is ${size.width}, ${size.height}');

    Paint paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 5.0;
    //Offset是圆心相对于屏幕左上角的偏移量
    canvas.drawCircle(Offset(100, 100), 20.0, paint);

    Paint paint2 = Paint()
      ..color = Colors.blue
      ..strokeWidth = 5.0;
    Rect rect = Rect.fromLTRB(100, 100, 200, 200);
    canvas.drawRect(rect, paint2);

    Paint paint3 = Paint()
      ..color = Colors.grey
      ..strokeWidth = 1.0;

    Offset start = Offset(0, 100);
    Offset end = Offset(100, 100);
    canvas.drawLine(start, end, paint3);

    Paint paint4 = Paint()
      ..color = Colors.grey
      ..isAntiAlias = true
      ..strokeWidth = 1.0;
    var path = Path();
    path.moveTo(size.width / 2, size.height / 2);
    path.lineTo(size.width / 2 + 100, size.height / 2);
    path.lineTo(size.width / 2, size.height / 2 + 50);
    canvas.drawPath(path, paint4);
    path.close();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
