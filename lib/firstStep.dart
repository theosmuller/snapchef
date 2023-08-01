import 'package:flutter/material.dart';
import 'package:snapchef/recipe.dart';

class FirstStepScreen extends StatefulWidget {
  final Recipe recipe;
  const FirstStepScreen({super.key, required this.recipe});

  @override
  _FirstStepScreenState createState() => _FirstStepScreenState();
}

class _FirstStepScreenState extends State<FirstStepScreen> {
  int _currentIndex = 0;
  int currentStep = 1;

  List<num> steps = [1, 2, 3];

  List<String> images = [
    'https://media-cdn.tripadvisor.com/media/photo-s/0e/e2/cf/2e/sorry-but-this-is-not.jpg',
    'https://media-cdn.tripadvisor.com/media/photo-s/0e/e2/cf/2e/sorry-but-this-is-not.jpg',
    'https://media-cdn.tripadvisor.com/media/photo-s/0e/e2/cf/2e/sorry-but-this-is-not.jpg',
    // Add more image URLs here
  ];

  List<String> titles = [
    'Image Title 1',
    'Image Title 2',
    'Image Title 3',
    // Add more titles here
  ];

  List<String> subtitles = [
    'Image Subtitle 1',
    'Image Subtitle 2',
    'Image Subtitle 3',
    // Add more subtitles here
  ];

  List<String> descriptions = [
    'Image Description 1 goes here. This is a sample description for the image 1.',
    'Image Description 2 goes here. This is a sample description for the image 1.',
    'Image Description 3 goes here. This is a sample description for the image 1.',
    // Add more descriptions here
  ];

  void _navigateBack() {
    if (currentStep == 1)
      Navigator.pop(context);
    else {
      setState(() {
        currentStep--;
    });
    }
  }

  void _navigateNext() {
    if (currentStep < steps.length) {
      setState(() {
        //_currentIndex++;
        currentStep++;
      });}
      else if (currentStep == steps.length){
        Navigator.pop(context);
      }
  }

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
        title: Text("Step ${currentStep}"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Image.network(
              images[currentStep-1],
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 16),
          Text(
            titles[currentStep-1],
            style: TextStyle(
              fontFamily: 'CreteRound',
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            subtitles[currentStep-1],
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                descriptions[currentStep-1],
                style: TextStyle(
                  fontSize: 16,
                ),
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
                    _navigateBack();
                  },
                  icon: const Icon(
                    Icons.fast_rewind,
                    size: 24,
                    color: Colors.white
                  ),
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
                        ]),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: backButtonColor, // Golden yellow color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                )),
              SizedBox(width: 16),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {
                    _navigateNext();
                  },
                  icon: Icon(
                    Icons.play_arrow,
                    size: 24,
                    color: Colors.transparent,
                  ),
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
                            ]),
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
      ),
    );
  }
}
