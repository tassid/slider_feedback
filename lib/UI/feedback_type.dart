import 'dart:ui';

enum FeedbackType {
  good,
  notBad,
  bad;

  String get name {
    switch (this) {
      case FeedbackType.good:
        return 'Boa';
      case FeedbackType.notBad:
        return 'Mais ou Menos';
      case FeedbackType.bad:
        return 'Ruim';
    }
  }

  Color get backgroundColor {
    switch (this) {
      case FeedbackType.good:
        return const Color.fromARGB(255, 204, 237, 106);
      case FeedbackType.notBad:
        return const Color.fromARGB(255, 255, 192, 89);
      case FeedbackType.bad:
        return const Color.fromARGB(255, 255, 183, 184);
    }
  }

  Color get foregroundColor {
    switch (this) {
      case FeedbackType.good:
        return const Color.fromARGB(255, 31, 35, 40);
      case FeedbackType.notBad:
        return const Color.fromARGB(255, 210, 103, 52);
      case FeedbackType.bad:
        return const Color.fromARGB(255, 93, 1, 6);
    }
  }

  double get width {
    switch (this) {
      case FeedbackType.good:
        return 150;
      case FeedbackType.notBad:
        return 50;
      case FeedbackType.bad:
        return 110;
    }
  }

  double get height {
    switch (this) {
      case FeedbackType.good:
        return 150;
      case FeedbackType.notBad:
        return 130;
      case FeedbackType.bad:
        return 110;
    }
  }

  double get mouthRotation {
    switch (this) {
      case FeedbackType.good:
        return 0.5;
      case FeedbackType.notBad:
      case FeedbackType.bad:
        return 0;
    }
  }
}
