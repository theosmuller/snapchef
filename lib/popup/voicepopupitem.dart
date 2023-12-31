import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'custom_ok_button.dart';

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
    _getDontShowAgainPreferences();
  }

  _setDontShowAgainPreferences(bool userPreference) async{
    SharedPreferences pref = await SharedPreferences.getInstance();

    return pref.setBool('state', userPreference);
  }

  _getDontShowAgainPreferences() async {
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
          Text('You can use the voice commands\nBACK\nand\nNEXT\nduring step by step.', style: TextStyle(fontFamily: 'Inter', fontSize: 18, height: 2.0), textAlign: TextAlign.center,),
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
          CustomOkButton(
            checkboxValue: checkboxvalue,
            onPressed: _setDontShowAgainPreferences,
          ),
        ],
      ),
    );
  }
}