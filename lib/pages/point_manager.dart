import 'package:flutter/material.dart';

class PointManager {
  static final ValueNotifier<int> points = ValueNotifier<int>(0); // Pontos iniciais

  static void addPoints(int pointsToAdd) {
    points.value += pointsToAdd;
  }
}