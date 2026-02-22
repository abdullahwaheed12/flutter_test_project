import 'dart:math';

import 'package:flutter/material.dart';

class MoodProvider extends ChangeNotifier {
  String moodLabel = 'Calm';
  double knobAngle = -pi / 2;

  void setAngle(double angle) {
    knobAngle = angle;
    moodLabel = _labelForAngle(angle);
    notifyListeners();
  }

  String _labelForAngle(double angle) {
    final normalized = (angle + 2 * pi) % (2 * pi);
    final sectorSize = 2 * pi / 3;
    if (normalized < sectorSize) {
      return 'Content';
    } else if (normalized < 2 * sectorSize) {
      return 'Peaceful';
    } else {
      return 'Happy';
    }
  }

  void setMood(String label) {
    moodLabel = label;
    notifyListeners();
  }
}
