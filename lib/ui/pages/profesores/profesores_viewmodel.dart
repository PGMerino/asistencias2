import 'package:flutter/material.dart';
import 'package:app_asistencias/entities/profesor.dart';
import 'package:app_asistencias/entities/clase.dart';

class ProfesoresViewModel extends ChangeNotifier {
  List<Profesor> _profesores = [];
  List<Clase> _clases = [];
  bool _isLoading = true;
  String _errorMessage = '';

  List<Profesor> get profesores => _profesores;
  List<Clase> get clases => _clases;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  ProfesoresViewModel() {
    fetchData();
  }

  Future<void> fetchData() async {
    _isLoading = true;
    notifyListeners();

    try {
      // Simular una solicitud de red
      await Future.delayed(const Duration(seconds: 1));

      // Cargar datos de ejemplo
      _profesores = profesoresExample;
      _clases = clasesExample;

      _errorMessage = '';
    } catch (e) {
      _errorMessage = 'Error al cargar los datos: ${e.toString()}';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Obtener clases por profesor ID
  List<Clase> getClasesByProfesorId(String profesorId) {
    return _clases.where((clase) => clase.profesorId == profesorId).toList();
  }

  // Añadir un profesor
  void addProfesor(Profesor newProfesor) {
    _profesores.add(newProfesor);
    notifyListeners();
  }

  // Actualizar un profesor
  void updateProfesor(Profesor updatedProfesor) {
    final index = _profesores.indexWhere((p) => p.id == updatedProfesor.id);
    if (index != -1) {
      _profesores[index] = updatedProfesor;
      notifyListeners();
    }
  }

  // Eliminar un profesor
  void deleteProfesor(String id) {
    _profesores.removeWhere((p) => p.id == id);
    notifyListeners();
  }
}