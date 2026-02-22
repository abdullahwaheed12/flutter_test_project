import 'package:flutter/material.dart';

class ProfileProvider extends ChangeNotifier {
  String userName = 'John Doe';
  String email = 'john.doe@example.com';

  void updateName(String name) {
    userName = name;
    notifyListeners();
  }

  void updateEmail(String value) {
    email = value;
    notifyListeners();
  }
}
