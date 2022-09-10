import 'dart:math';

import 'package:flutter/material.dart';

class TopPicksWidget extends StatelessWidget {
  const TopPicksWidget({Key? key}) : super(key: key);

  //   final String buttonText;
  // String verticalText(buttonText){
  //    List<String>verticalTextButton = buttonText.split('');
  //    final String newButtonText = verticalTextButton.join("\n");
  //    return newButtonText;
  //  }
  //  const TopPicksWidget({Key? key, required this.buttonText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(border: Border.all(color: Colors.lightGreen)),
        child: CustomPaint(
          painter: MyPainter(),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const step = 0.5;
    const start = -pi / 2;
    const finish = 2 * pi;
    final backgroundPaint = Paint();
    backgroundPaint.color = Colors.grey;
    backgroundPaint.style = PaintingStyle.fill;
    canvas.drawOval(Offset.zero & size, backgroundPaint);

    final restPaint = Paint();
    restPaint.color = Colors.white;
    restPaint.style = PaintingStyle.stroke;
    restPaint.strokeWidth = 6.0;
    canvas.drawArc(const Offset(6, 6) & Size(size.width - 12, size.height - 12),
        finish * step + start, finish * (1 - step), false, restPaint);

    final fillPaint = Paint();
    fillPaint.color = Colors.orange;
    fillPaint.style = PaintingStyle.stroke;
    fillPaint.strokeWidth = 6.0;
    fillPaint.strokeCap = StrokeCap.round;
    canvas.drawArc(const Offset(6, 6) & Size(size.width - 12, size.height - 12),
        start, finish * step, false, fillPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
