import 'package:flutter/material.dart';
import 'package:smart_house/air_conditioner/air_condtioner_widgets/mode_button.dart';

class ModesButtons extends StatefulWidget {
  @override
  _ModesButtonsState createState() => _ModesButtonsState();
}

class _ModesButtonsState extends State<ModesButtons> {
  int _activeCard = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width / 22),
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: ModeButton(
              onTap: () {
                setState(() {
                  _activeCard = 0;
                });
              },
              active: _activeCard == 0,
              svgPath: 'assets/time.svg',
            ),
          ),
          Spacer(),
          Expanded(
            flex: 5,
            child: ModeButton(
              onTap: () {
                setState(() {
                  _activeCard = 1;
                });
              },
              active: _activeCard == 1,
              svgPath: 'assets/snow.svg',
            ),
          ),
          Spacer(),
          Expanded(
            flex: 5,
            child: ModeButton(
              onTap: () {
                setState(() {
                  _activeCard = 2;
                });
              },
              active: _activeCard == 2,
              svgPath: 'assets/sun.svg',
            ),
          ),
          Spacer(),
          Expanded(
            flex: 5,
            child: ModeButton(
              onTap: () {
                setState(() {
                  _activeCard = 3;
                });
              },
              active: _activeCard == 3,
              svgPath: 'assets/water.svg',
            ),
          ),
        ],
      ),
    );
  }
}
