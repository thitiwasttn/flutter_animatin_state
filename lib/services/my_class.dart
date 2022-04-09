import 'dart:math';

import 'package:flutter/material.dart';

class MyClass extends ChangeNotifier {
  int firstProp = 0;
  int first = 0;
  int second = 100;

  void changeAllProperties() {
    first = Random().nextInt(10);
    second = Random().nextInt(1000);
    notifyListeners();
  }

  void change() {
    firstProp = 10;
    notifyListeners(); // บอก widget ปลายทางว่ามีการเปลี่ยนแปลง
  }
}