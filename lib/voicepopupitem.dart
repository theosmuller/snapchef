import 'package:flutter/material.dart';

class VoicePopUpItem extends StatefulWidget {
  const VoicePopUpItem({Key? key}) : super(key: key);

  @override
  State<VoicePopUpItem> createState() => _VoicePopUpItemState();
}

class _VoicePopUpItemState extends State<VoicePopUpItem> {
  bool checkboxvalue = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('You can use the voice commands "BACK" and "NEXT" during step by step.'),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Checkbox(
                value: checkboxvalue,
                activeColor: Colors.deepOrangeAccent,
                checkColor: Colors.white,
                onChanged:(newValue) {
                  setState(() {
                    checkboxvalue = newValue!;
                    debugPrint('checkboxvalue: $checkboxvalue');
                  });
                }
            ),
            Text("Do not show this again"),
          ],
        ),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: () => Navigator.pop(context, checkboxvalue),
              //Navigator.of(context, rootNavigator: true).pop('dialog'),
          child: Text(
            'OK',
            style: TextStyle(
              fontFamily: 'CreteRound',
              fontSize: 24,
              color: Colors.white,
              shadows: [
                Shadow(
                  offset: Offset(2.0, 2.0),
                  blurRadius: 4.0,
                  color: Color.fromARGB(120, 0, 0, 0),
                ),
              ],
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepOrangeAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );
  }
}