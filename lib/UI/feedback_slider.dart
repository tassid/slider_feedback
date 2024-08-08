import 'package:flutter/material.dart';
import 'package:slider_feedback/UI/feedback_type.dart';

class FeedbackSlider extends StatefulWidget {
  final ValueSetter<FeedbackType> onFeedbackChanged;
  final FeedbackType initialFeedbackType;

  const FeedbackSlider({
    super.key,
    required this.onFeedbackChanged,
    required this.initialFeedbackType,
  });

  @override
  State<FeedbackSlider> createState() => _FeedbackSliderState();
}

class _FeedbackSliderState extends State<FeedbackSlider> {
  double _sliderValue = 0.0;
  late FeedbackType _feedbackType;

  @override
  void initState() {
    super.initState();

    _feedbackType = widget.initialFeedbackType;
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        sliderTheme: const SliderThemeData(
          trackHeight: 30,
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
          overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
          showValueIndicator: ShowValueIndicator.never,
        ),
      ),
      child: Slider(
        value: _sliderValue,
        max: 3.0,
        divisions: 2,
        thumbColor: _feedbackType.foregroundColor,
        activeColor: _feedbackType.foregroundColor,
        onChanged: (value) {
          setState(() {
            _sliderValue = value;

            if (value < 1.0) {
              _feedbackType = FeedbackType.bad;
            } else if (value < 2.0) {
              _feedbackType = FeedbackType.notBad;
            } else {
              _feedbackType = FeedbackType.good;
            }

            widget.onFeedbackChanged(_feedbackType);
          });
        },
      ),
    );
  }
}
