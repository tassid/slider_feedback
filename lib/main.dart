import 'package:flutter/material.dart';
import 'package:slider_feedback/UI/eyes_widget.dart';
import 'package:slider_feedback/UI/feedback_slider.dart';
import 'package:slider_feedback/UI/feedback_type.dart';
import 'package:slider_feedback/UI/mouth_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Feedback',
      home: Main(),
    );
  }
}

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  void onFeedbackChanged(FeedbackType feedbackType) {
    setState(() {
      currentFeedbackType = feedbackType;
    });
  }

  FeedbackType currentFeedbackType = FeedbackType.good;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: currentFeedbackType.backgroundColor,
      appBar: AppBar(
        title: const Text('Feedback'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          EyesWidget(
            height: currentFeedbackType.width,
            width: currentFeedbackType.height,
            color: currentFeedbackType.foregroundColor,
          ),
          AnimatedRotation(
              turns: currentFeedbackType.mouthRotation,
              duration: const Duration(milliseconds: 300),
              child: MouthWidget(color: currentFeedbackType.foregroundColor)),
          Text(
            currentFeedbackType.name,
            style: TextStyle(
              color: currentFeedbackType.foregroundColor,
              fontSize: 30,
            ),
          ),
          FeedbackSlider(
              onFeedbackChanged: onFeedbackChanged,
              initialFeedbackType: currentFeedbackType)
        ],
      ),
    );
  }
}
