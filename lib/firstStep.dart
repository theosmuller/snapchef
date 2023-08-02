import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:snapchef/recipe.dart';
import 'package:snapchef/voicepopupitem.dart';


class FirstStepScreen extends StatefulWidget {
  final Recipe recipe;

  const FirstStepScreen({super.key, required this.recipe});

  @override
  _FirstStepScreenState createState() => _FirstStepScreenState();
}


class _FirstStepScreenState extends State<FirstStepScreen> {
  int currentStep = 1;
  bool _showPopUp = true;

  @override
  void initState() {
    super.initState();
    _readData();
    Future.delayed(Duration.zero, () => showAlert(context));

    //_checkFirstTime();
  }

  List<num> steps = [1, 2, 3];

  List<String> images = [
    'https://static.vecteezy.com/system/resources/previews/021/217/663/non_2x/lemon-pie-food-png.png',
    'https://del.h-cdn.co/assets/17/16/2048x2048/square-1492693946-108-sein-9781101967140-art-r1-1.jpg',
    'https://static.vecteezy.com/system/resources/previews/021/217/663/non_2x/lemon-pie-food-png.png',
    // Add more image URLs here
  ];

  List<String> titles = [
    '1',
    '2',
    '3',
    // Add more titles here
  ];

  List<String> ingredients = [
    'Dough for single-crust pie',
    '',
    '',
    // Add more subtitles here
  ];

  List<String> preparation = [
    'On a lightly floured surface, roll dough to a 1/8-in.-thick circle; transfer to a 9-in. pie plate. Trim to 1/2 in. beyond rim of plate; flute edge. Refrigerate 30 minutes. Preheat oven to 425°.',
    'Image Description 2 goes here. This is a sample description for the image 2.',
    'Image Description 3 goes here. This is a sample description for the image 3.',
    // Add more descriptions here
  ];

  void _navigateBack() {
    if (currentStep == 1) {
      Navigator.pop(context);
    }
    else {
      setState(() {
        currentStep--;
      });
    }
  }

  void _navigateNext() {
    if (currentStep < steps.length) {
      setState(() {
        currentStep++;
      });
    } else if (currentStep == steps.length) {
      Navigator.pop(context);
    }
  }

  // void _checkFirstTime() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   bool isFirstTime = prefs.getBool('isFirstTime') ?? true;
  //
  //   setState(() {
  //     _showPopUp = isFirstTime;
  //     debugPrint('isFirstTime: $isFirstTime');
  //     debugPrint('prefs.getBool(isFirstTime): ${prefs.getBool('isFirstTime')}');
  //   });
  //
  //   if (isFirstTime) {
  //     prefs.setBool('isFirstTime', false);
  //   }
  // }

  void _onToggleChanged(bool? newValue){
    setState(() {
      _showPopUp = newValue ?? true;

      //if else
    });
    debugPrint('_showPopUp: $_showPopUp');
    debugPrint('newValue: $newValue');
  }

  _saveDontShowAgain(bool userPreference) async{
    SharedPreferences pref = await SharedPreferences.getInstance();

    pref.setBool('state', userPreference);
    return pref;
  }

  _readData() async {
    final pref = await SharedPreferences.getInstance();

    setState(() {
      _showPopUp = pref.getBool('state') ?? true;
    });
  }

  void showAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
        return AlertDialog(
            title: Text(""),
            surfaceTintColor: Colors.white,
            content:
            StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
                  return const VoicePopUpItem();
                }));
        },
    ).then((value) {
      if (value != null) {
        setState(() {
          _showPopUp = value;
        });
      }
    });
  }
    //   //content: Text('You can use the voice commands "BACK" and "NEXT" during step by step.'),
    //   surfaceTintColor: Colors.white,
    //   actions: [
    //     Row(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         StatefulBuilder(
    //           builder: (context, setState) {
    //           return
    //             Checkbox(
    //             value: _showPopUp,
    //             onChanged:
    //             _onToggleChanged
    //             // _saveDontShowAgain(newValue);
    //                 );
    //           }
    //         ),
    //             Text("Do not show this again"),
    //           ],
    //         ),
    //     TextButton(
    //       child: Text("OK"),
    //       onPressed: () => Navigator.of(context, rootNavigator: true).pop('dialog'),
    //     ),
    //   ],
    // ));
  //}

  @override
  Widget build(BuildContext context) {
    bool isFirstStep = currentStep == 1;
    bool isLastStep = currentStep == (steps.length);

    String stepRightButtonString = isLastStep ? 'Done' : 'Next';
    IconData stepRightButtonIcon = isLastStep ? Icons.check : Icons.play_arrow;

    Color backButtonColor = isFirstStep ? Colors.grey : Colors.green;
    Color? nextButtonColor = isLastStep ? Colors.amber[700] : Colors.green;



    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: _navigateBack,
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.25,
                child: Image.network(
                  images[currentStep - 1],
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 16),
            Align(
              alignment: Alignment.center,
              child:
              Text(
                "Step ${currentStep}",
                style: TextStyle(
                  fontFamily: 'CreteRound',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 16),
            Visibility(
              visible: isFirstStep,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // Align children to the start (left)
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 16), // Add left margin to "Ingredients" text
                    child: Text(
                      'Ingredients',
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Inter',
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Padding(
                    padding: EdgeInsets.only(left: 16), // Add left margin to ingredients text
                    child: Text(
                      ingredients[currentStep - 1],
                      style: TextStyle(fontSize: 18, fontFamily: 'Inter'),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.only(left: 16), // Add left margin to "Preparation" text
              child: Text(
                'Preparation',
                style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Inter',
                ),
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0), // Add left and right horizontal padding
                child: Text(
                  preparation[currentStep - 1],
                  style: TextStyle(fontSize: 18, fontFamily: 'Inter'),
                ),
              ),
            ),

            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      isFirstStep ? _navigateBack() : _navigateBack();
                    },
                    icon: const Icon(Icons.fast_rewind,
                        size: 24, color: Colors.white),
                    label: const Text(
                      'Back',
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
                      backgroundColor: backButtonColor, // Golden yellow color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      _navigateNext();
                    },
                    icon: Icon(Icons.play_arrow,
                        size: 24, color: Colors.transparent),
                    label: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          stepRightButtonString,
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
                        Icon(
                          stepRightButtonIcon,
                          size: 24,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: nextButtonColor, // Golden yellow color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
          ],
        )
      ),
    );
  }

}