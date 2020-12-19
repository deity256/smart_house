import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_house/colors.dart';
import 'dart:ui' as ui;
import 'dart:math' as math;

class TempCirclePainter extends CustomPainter {
  final double currentTempValueOfOne;
  final double minValue;
  final double maxValue;
  final AnimationController tempAnimationController;
  TempCirclePainter(
      {this.tempAnimationController,
      this.currentTempValueOfOne = 0,
      this.minValue,
      this.maxValue});

  @override
  void paint(Canvas canvas, Size size) {
    var squareEdge = size.width;
    var _currentPostion = Offset(
        -squareEdge / 4 * math.cos(currentTempValueOfOne * math.pi) +
            squareEdge / 2,
        -squareEdge / 4 * math.sin(currentTempValueOfOne * math.pi) +
            squareEdge / 2);
    var currentColor = Tween<Color>(
            begin: AppColors.darkPurple, end: Color.fromRGBO(177, 69, 55, 1))
        .animate(tempAnimationController);
    //blur arc
    Paint blurPaint = Paint()
      ..strokeWidth = 28
      ..style = PaintingStyle.stroke
      ..imageFilter = ui.ImageFilter.blur(sigmaX: 30, sigmaY: 30)
      ..color = AppColors.whiteColor;
    canvas.drawArc(Offset(squareEdge / 5.8, squareEdge / 5.8) & size / 1.525,
        math.pi * 0.12, 7, false, blurPaint);

    //purple arc
    Paint purplePaint = Paint()
      ..strokeWidth = 28
      ..style = PaintingStyle.stroke
      ..color = AppColors.darkPurple;
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
      ..color = AppColors.darkPurple
      ..imageFilter = ui.ImageFilter.blur(sigmaX: 25, sigmaY: 20);
    canvas.drawArc(Offset(squareEdge / 4.4, squareEdge / 4.2) & size / 1.9,
        math.pi * 0.12, 2.5, false, shadowPaint);

    Paint innerCirclePaint = Paint()..color = AppColors.whiteColor;
    canvas.drawCircle(Offset(squareEdge / 2, squareEdge / 2), squareEdge / 3.4,
        innerCirclePaint);

    Paint indecatorCirclePaint = Paint()..color = AppColors.darkPurple;
    canvas.drawCircle(_currentPostion, 5, indecatorCirclePaint);

    final tempTextStyle = TextStyle(
      color: AppColors.blackColor,
      fontWeight: FontWeight.w600,
      fontSize: squareEdge / 7,
    );
    final unitTextStyle = TextStyle(
      color: AppColors.blackColor,
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
    // textPainter.setPlaceholderDimensions([
    //   PlaceholderDimensions(
    //       alignment: ui.PlaceholderAlignment.top, size: Size(24, 24))
    // ]);
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
