import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VoicePopUpItem extends StatefulWidget {
  const VoicePopUpItem({Key? key}) : super(key: key);

  @override
  State<VoicePopUpItem> createState() => _VoicePopUpItemState();
}

class _VoicePopUpItemState extends State<VoicePopUpItem> {
  bool checkboxvalue = false;

  @override
  void initState() {
    super.initState();
    _readData();
  }

  _saveDontShowAgain(bool userPreference) async{
    SharedPreferences pref = await SharedPreferences.getInstance();

    pref.setBool('state', userPreference);
    return pref;
  }

  _readData() async {
    final pref = await SharedPreferences.getInstance();

    setState(() {
      checkboxvalue = pref.getBool('state') ?? true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 20),
          Text('You can use the voice commands \nBACK\n and\n NEXT\n during step by step.', style: TextStyle(fontFamily: 'Inter', fontSize: 18, height: 2.0), textAlign: TextAlign.center,),
          SizedBox(height: 30),
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
              SizedBox(height: 20),
              Text("Do not show this again", style: TextStyle(fontFamily: 'Inter', fontSize: 16, color: Colors.grey[700])),
            ],
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              _saveDontShowAgain(checkboxvalue);
              Navigator.pop(context, checkboxvalue);
            },
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
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            ),
          ),
        ],
      ),
    );
  }
}