import 'package:flutter/material.dart';

class NavigationViewModel extends ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void setCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

// Otros métodos relacionados con la navegación podrían agregarse aquí
// como navegación a rutas específicas, manejo de historial, etc.
}