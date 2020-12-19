import 'package:flutter/material.dart';
import 'package:flutter_gifimage/flutter_gifimage.dart';
import 'package:smart_house/colors.dart';

class SmokeAnimatedBackground extends StatefulWidget {
  final double currentTempValueOfOne;

  const SmokeAnimatedBackground({Key key, this.currentTempValueOfOne})
      : super(key: key);
  @override
  _SmokeAnimatedBackgroundState createState() =>
      _SmokeAnimatedBackgroundState();
}

class _SmokeAnimatedBackgroundState extends State<SmokeAnimatedBackground>
    with SingleTickerProviderStateMixin {
  GifController _gifController;
  @override
  void initState() {
    _gifController = GifController(
      vsync: this,
    );
    _gifController.repeat(
        min: 0, max: 75, period: Duration(milliseconds: 1200));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: ShaderMask(
        shaderCallback: (rect) {
          return LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.lightPurple,
              AppColors.lerpGradient(widget.currentTempValueOfOne)
            ],
          ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
        },
        blendMode: BlendMode.screen,
        child: GifImage(
          fit: BoxFit.cover,
          alignment: Alignment.center,
          controller: _gifController,
          image: AssetImage("assets/smoke_gif.gif"),
        ),
      ),
    );
  }
}
