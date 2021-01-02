import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_house/colors.dart';
import 'dart:ui' as ui;
import 'dart:math' as math;

class TempCirclePainter extends CustomPainter {
  final double currentTempValueOfOne;
  final double minValue;
  final double maxValue;

  TempCirclePainter(
      {this.currentTempValueOfOne = 0, this.minValue, this.maxValue});

  @override
  void paint(Canvas canvas, Size size) {
    var squareEdge = size.width;
    var _currentPostion = Offset(
        -squareEdge / 4 * math.cos(currentTempValueOfOne * math.pi) +
            squareEdge / 2,
        -squareEdge / 4 * math.sin(currentTempValueOfOne * math.pi) +
            squareEdge / 2);
    var currentColor = AppColors.lerpGradient(currentTempValueOfOne);

    //purple arc
    Paint purplePaint = Paint()
      ..strokeWidth = 28
      ..style = PaintingStyle.stroke
      ..color = currentColor;
    canvas.drawArc(
        Offset(squareEdge / 5.8, squareEdge / 5.8) & size / 1.525,
        math.pi,
        currentTempValueOfOne < 0.03 ? 0.03 : currentTempValueOfOne * math.pi,
        false,
        purplePaint);

    //the shadow of the white circle
    Paint shadowPaint = Paint()
      ..strokeWidth = 32
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..color = currentColor
      ..imageFilter = ui.ImageFilter.blur(sigmaX: 22, sigmaY: 33);
    canvas.drawArc(Offset(squareEdge / 4.7, squareEdge / 4.2) & size / 1.7,
        math.pi * 0.12, 2.5, false, shadowPaint);

    //blur arc
    Paint blurPaint = Paint()
      ..strokeWidth = 28
      ..style = PaintingStyle.stroke
      ..maskFilter = MaskFilter.blur(BlurStyle.inner, 22)
      ..color = AppColors.white.withOpacity(0.5);
    canvas.drawArc(Offset(squareEdge / 5.8, squareEdge / 5.8) & size / 1.525,
        math.pi * 0.12, 7, false, blurPaint);

    Paint innerCirclePaint = Paint()..color = AppColors.white;
    canvas.drawCircle(Offset(squareEdge / 2, squareEdge / 2), squareEdge / 3.4,
        innerCirclePaint);

    Paint indecatorCirclePaint = Paint()..color = currentColor;
    canvas.drawCircle(_currentPostion, 5, indecatorCirclePaint);

    //temperature text
    final tempTextStyle = TextStyle(
      color: AppColors.black,
      fontWeight: FontWeight.bold,
      fontSize: squareEdge / 7,
    );
    final unitTextStyle = TextStyle(
      color: AppColors.black,
      fontSize: squareEdge / 16,
    );
    final textSpan = TextSpan(
      children: [
        TextSpan(
          text: tempTextCalculation(),
          style: tempTextStyle,
        ),
        TextSpan(text: '°C', style: unitTextStyle),
      ],
    );
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );

    textPainter.layout(
      minWidth: 0,
      maxWidth: size.width,
    );

    final offset = Offset(squareEdge / 2.4, squareEdge / 2.4);
    textPainter.paint(canvas, offset);
  }

  String tempTextCalculation() =>
      (minValue + ((maxValue - minValue) * currentTempValueOfOne))
          .toInt()
          .toString();

  @override
  bool shouldRepaint(covariant TempCirclePainter oldDelegate) {
    return oldDelegate.currentTempValueOfOne != currentTempValueOfOne;
  }
}
