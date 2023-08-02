import 'package:flutter/material.dart';

class SnapChefLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Stack(
        children: <Widget>[
          Text(
            'SnapChef',
            style: TextStyle(
              fontFamily: 'GrandHotel',
              fontSize: 64,
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = 10
                ..color = Colors.deepOrangeAccent,
            ),
          ),
          Text(
            'SnapChef',
            style: TextStyle(
              fontFamily: 'GrandHotel',
              fontSize: 64,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
