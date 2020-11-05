import 'package:flutter/material.dart';

class PaintDemo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double voteHeight = 50;
    TextStyle style3 = TextStyle(
        color: Colors.white, fontSize: 25, fontWeight: FontWeight.w900);
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            child: CustomPaint(
              size: MediaQuery.of(context).size,
              painter: BgPainter(),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 150,
            child: Column(
              children: <Widget>[
                TouTiao(),
                Text(
                  '美国大选',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    '2020·US ELECTION',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              //默认是max撑满，mainSize必须是min
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: Vote(
                      h: voteHeight,
                    )),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    DotText(
                      color: Colors.red,
                      text: '特朗普得票',
                    ),
                    DotText(
                      color: Colors.grey,
                      text: '未开票',
                    ),
                    DotText(
                      color: Colors.blue[300],
                      text: '拜登得票',
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '数据来自福克斯新闻，更新于北京时间11月5日06：07',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 30,
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  margin: EdgeInsets.only(bottom: 50),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white54, width: 1),
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.transparent),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.refresh,
                        size: 18,
                        color: Colors.white,
                      ),
                      Text(
                        '刷新数据',
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
            child: Text(
              '214',
              style: style3,
            ),
            bottom: 205,
            left: 20,
          ),
          Positioned(
            child: Text(
              '264',
              style: style3,
            ),
            bottom: 205,
            right: 20,
          ),
          Positioned(
            child: Text(
              '270票即胜选',
              style:
                  TextStyle(color: Colors.white.withAlpha(230), fontSize: 12),
            ),
            bottom: 220,
          ),
        ],
      ),
    );
  }
}

class DotText extends StatelessWidget {
  final Color color;
  final String text;

  const DotText({Key key, this.color, this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(
          width: 4,
        ),
        Container(
          color: color,
          width: 4,
          height: 4,
        ),
        SizedBox(
          width: 4,
        ),
        Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 10),
        ),
      ],
    );
  }
}

class Vote extends StatelessWidget {
  final double h;

  const Vote({Key key, this.h}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    TextStyle style1 = TextStyle(
        color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600);
    TextStyle style2 = TextStyle(
        color: Colors.white, fontSize: 10, fontWeight: FontWeight.w600);
    return CustomPaint(
      child: Container(
        height: h,
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                child: Text.rich(
                  TextSpan(
                      text: '得票 特朗普',
                      style: style1,
                      children: <InlineSpan>[
                        TextSpan(text: ' 共和党', style: style2)
                      ]),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                child: Text.rich(
                  TextSpan(text: '得票 拜登', style: style1, children: <InlineSpan>[
                    TextSpan(text: ' 民主党', style: style2)
                  ]),
                ),
              ),
            )
          ],
        ),
      ),
      painter: Vote2Painter(),
    );
  }
}

class Vote2Painter extends CustomPainter {
  Radius _borderRadius = Radius.circular(6);
  Paint _redPaint = Paint()..color = Colors.red[300];

  Paint _bluePaint = Paint()..color = Colors.blue[300];

  @override
  void paint(Canvas canvas, Size size) {
    print('vote2 painter size is ${size.width} ${size.height}');
    Paint bgPaint = Paint();
    bgPaint.color = Colors.grey;

    RRect rRect = RRect.fromLTRBAndCorners(0, 0, size.width, size.height,
        topLeft: _borderRadius,
        bottomLeft: _borderRadius,
        topRight: _borderRadius,
        bottomRight: _borderRadius);
    canvas.drawRRect(rRect, bgPaint);

    _drawDotLine(size, canvas);
    _drawValue(size, true, size.width / 2 - 50, canvas);
    _drawValue(size, false, size.width / 2 - 10, canvas);
  }

  _drawDotLine(Size size, Canvas canvas) {
    double dashWidth = 4;
    double dashSpace = 2;
    double startY = 0;
    while (startY < size.height) {
      canvas.drawLine(
          Offset(size.width / 2, startY),
          Offset(size.width / 2, startY + dashWidth),
          Paint()
            ..color = Colors.white
            ..strokeWidth = 2);
      startY += dashWidth + dashSpace;
    }
  }

  _drawValue(Size size, bool fromLeft, double value, Canvas canvas) {
    RRect valueRect;
    if (fromLeft) {
      valueRect = RRect.fromRectAndCorners(
          Rect.fromLTRB(0, 0, value, size.height),
          topLeft: _borderRadius,
          bottomLeft: _borderRadius);
      canvas.drawRRect(valueRect, _redPaint);
    } else {
      valueRect = RRect.fromRectAndCorners(
          Rect.fromLTRB(size.width - value, 0, size.width, size.height),
          topRight: _borderRadius,
          bottomRight: _borderRadius);
      canvas.drawRRect(valueRect, _bluePaint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class TouTiao extends StatelessWidget {
  const TouTiao({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: 2.0, vertical: 1.0),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(2)),
          child: Text(
            '头条',
            style: TextStyle(
                color: Colors.red, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        Text(
          ' 热榜',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}

class BgPainter extends CustomPainter {
  Paint _bluePaint;
  Paint _redPaint;
  BgPainter() {
    _bluePaint = Paint()..color = Colors.red;
    _redPaint = Paint()..color = Colors.blue;
  }

  @override
  void paint(Canvas canvas, Size size) {
    Path bluePath = Path();
    bluePath.moveTo(0, 0);
    bluePath.lineTo(size.width, 0);
    bluePath.lineTo(0, size.height);
    canvas.drawPath(bluePath, _bluePaint);

    Path redPath = Path();
    redPath.moveTo(size.width, 0);
    redPath.lineTo(size.width, size.height);
    redPath.lineTo(0, size.height);
    canvas.drawPath(redPath, _redPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
