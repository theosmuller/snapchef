import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:snapchef/popup/voicepopupitem.dart';
import 'package:snapchef/recipe/recipe.dart';
//import 'package:speech_to_text/speech_recognition_error.dart';
//import 'package:speech_to_text/speech_recognition_result.dart';
//import 'package:speech_to_text/speech_to_text.dart';

import 'back_step_button.dart';
import 'next_step_button.dart';

class FirstStepScreen extends StatefulWidget {
  final Recipe recipe;

  const FirstStepScreen({super.key, required this.recipe});

  @override
  _FirstStepScreenState createState() => _FirstStepScreenState();
}

class _FirstStepScreenState extends State<FirstStepScreen> {
  int currentStep = 1;
  bool _showPopUp = true;

  //final SpeechToText _speechToText = SpeechToText();
  // bool _speechEnabled = false;
  // bool _speechAvailable = false;
  // String _lastWords = '';
  // String _currentWords = '';
  // final String _selectedLocaleId = 'en_US';
  //
  // printLocales() async {
  //   //var locales = await _speechToText.locales();
  //   for (var local in locales) {
  //     debugPrint(local.name);
  //     debugPrint(local.localeId);
  //   }
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   _updatePopUpPreference();
  //   _initSpeech();
  //   //_startListening();
  // }

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
      // _stopListening;
      Navigator.pop(context);
    } else {
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
      // _stopListening;
      Navigator.pop(context);
    }
  }

  Future<bool> _getPopUpPreferences() async {
    final pref = await SharedPreferences.getInstance();

    return pref.getBool('state') ?? true;
  }

  // void _updatePopUpPreference() async {
  //   //debugPrint("update ANTES  ${_showPopUp}");
  //   bool newValue = await _getPopUpPreferences();
  //   setState(() {
  //     _showPopUp = !newValue;
  //   });
  //
  //   if (_showPopUp) {
  //     Future.delayed(Duration.zero, () => showAlert(context));
  //   }
  // }

  //void errorListener(SpeechRecognitionError error) async {
  //  debugPrint(error.errorMsg.toString());
  //}

  // void statusListener(String status) async {
  //   debugPrint("status $status");
  //   if (status == "done" && _speechEnabled) {
  //     setState(() {
  //       _lastWords += " $_currentWords";
  //       _currentWords = "";
  //       _speechEnabled = false;
  //     });
  //   }
  //   else {
  //     // wait 50 mil seconds and try again
  //     await Future.delayed(Duration(milliseconds: 50));
  //   }
  //     await _startListening();
  // }

  /// This has to happen only once per app
  // void _initSpeech() async {
  //   _speechAvailable = await _speechToText.initialize(
  //       onError: errorListener,
  //       onStatus: statusListener
  //   );
  //   setState(() {});
  // }

  /// Each time to start a speech recognition session
  // Future _startListening() async {
  //   debugPrint("=================================================");
  //   debugPrint("STARTED LISTENING");
  //   //await _stopListening();
  //   await Future.delayed(const Duration(milliseconds: 50));
  //   await _speechToText.listen(
  //       onResult: _onSpeechResult,
  //       localeId: _selectedLocaleId,
  //       cancelOnError: true,
  //       partialResults: true,
  //       listenFor: const Duration(seconds: 10),
  //       pauseFor: Duration(seconds: 2),
  //   );
  //   setState(() {
  //     _speechEnabled = true;
  //   });
  // }

  /// Manually stop the active speech recognition session
  /// Note that there are also timeouts that each platform enforces
  /// and the SpeechToText plugin supports setting timeouts on the
  /// listen method.
  // Future _stopListening() async {
  //     debugPrint("--------->STOPPED LISTENING");
  //     setState(() {
  //       _speechEnabled = false;
  //     });
  //     await _speechToText.stop();
  // }

  /// This is the callback that the SpeechToText plugin calls when
  /// the platform returns recognized words.
  // void _onSpeechResult(SpeechRecognitionResult result) {
  //   setState(() {
  //     _currentWords = result.recognizedWords;
  //     //debugPrint(_currentWords);
  //   });
  //
  //     String spokenWords = result.recognizedWords.toLowerCase();
  //     debugPrint(spokenWords);
  //     if (spokenWords.contains('back')) {
  //       _navigateBack();
  //     } else if (spokenWords.contains('next')) {
  //       _navigateNext();
  //     }
  // }

  // @override
  // void dispose() {
  //   _stopListening(); // Stop listening when the screen is disposed
  //   super.dispose();
  // }

  void showAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            surfaceTintColor: Colors.white,
            content: StatefulBuilder(
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

  @override
  Widget build(BuildContext context) {
    bool isFirstStep = currentStep == 1;
    bool isLastStep = currentStep == (steps.length);

    String stepRightButtonString = isLastStep ? 'Done' : 'Next';
    IconData stepRightButtonIcon = isLastStep ? Icons.check : Icons.play_arrow;

    Color backButtonColor =
        isFirstStep ? Colors.grey[300] as Color : Colors.green;
    Color nextButtonColor =
        isLastStep ? Colors.amber[700] as Color : Colors.green;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
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
          const SizedBox(height: 16),
          Align(
            alignment: Alignment.center,
            child: Text(
              "Step ${currentStep}",
              style: const TextStyle(
                fontFamily: 'CreteRound',
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Visibility(
            visible: isFirstStep,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // Align children to the start (left)
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 16), // Add left margin to "Ingredients" text
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
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 16), // Add left margin to ingredients text
                  child: Text(
                    ingredients[currentStep - 1],
                    style: const TextStyle(fontSize: 18, fontFamily: 'Inter'),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.only(
                left: 16), // Add left margin to "Preparation" text
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
          const SizedBox(height: 16),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 0), // Add left and right horizontal padding
              child: Text(
                preparation[currentStep - 1],
                style: const TextStyle(fontSize: 18, fontFamily: 'Inter'),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BackStepButton(
                  onPressed: () {
                    isFirstStep ? null : _navigateBack();
                  },
                  label: 'Back', // Change the label text
                  iconData: Icons.fast_rewind, // Change the icon
                  backgroundColor: backButtonColor,
                ),
                const SizedBox(width: 16),
                NextStepButton(
                  onPressed: () {
                    _navigateNext();
                  },
                  label: stepRightButtonString, // Change the label text
                  backgroundColor:
                      nextButtonColor, // Customize the background color
                  iconData:
                      stepRightButtonIcon, // Change the icon to any desired IconData
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
        ],
      )),
    );
  }
}
