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

  List<num> currentStep = [1, 2, 3, 4, 5, 6];

  List<String> images = [
    'https://media-cdn.tripadvisor.com/media/photo-s/0e/e2/cf/2e/sorry-but-this-is-not.jpg',
    // Add more image URLs here
  ];

  List<String> titles = [
    'Image Title 1',
    // Add more titles here
  ];

  List<String> subtitles = [
    'Image Subtitle 1',
    // Add more subtitles here
  ];

  List<String> descriptions = [
    'Image Description 1 goes here. This is a sample description for the image 1.',
    // Add more descriptions here
  ];

  void _navigateBack() {
    Navigator.pop(context);
  }

  void _navigateNext() {
    if (_currentIndex < images.length - 1) {
      setState(() {
        _currentIndex++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: _navigateBack,
        ),
        title: Text('Step 1'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Image.network(
              images[_currentIndex],
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 16),
          Text(
            titles[_currentIndex],
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            subtitles[_currentIndex],
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
                descriptions[_currentIndex],
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
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey, // Golden yellow color
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
                  icon: const Icon(
                    Icons.play_arrow,
                    size: 24,
                    color: Colors.white
                  ),
                  label: const Text(
                    'Steps',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green, // Golden yellow color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                )),
            ],
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
