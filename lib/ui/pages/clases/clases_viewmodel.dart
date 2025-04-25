import 'package:flutter/material.dart';
import 'package:app_asistencias/entities/clase.dart';
import 'package:app_asistencias/entities/profesor.dart';
import 'package:app_asistencias/entities/alumno.dart';

class ClasesViewModel extends ChangeNotifier {
  List<Clase> _clases = [];
  List<Profesor> _profesores = [];
  List<Alumno> _alumnos = [];
  bool _isLoading = true;
  String _errorMessage = '';

  List<Clase> get clases => _clases;
  List<Profesor> get profesores => _profesores;
  List<Alumno> get alumnos => _alumnos;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  ClasesViewModel() {
    fetchData();
  }

  Future<void> fetchData() async {
    _isLoading = true;
    notifyListeners();

    try {
      // Simular una solicitud de red
      await Future.delayed(const Duration(seconds: 1));

      // Cargar datos de ejemplo
      _clases = clasesExample;
      _profesores = profesoresExample;
      _alumnos = alumnosExample;

      _errorMessage = '';
    } catch (e) {
      _errorMessage = 'Error al cargar los datos: ${e.toString()}';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Obtener profesor por ID
  Profesor? getProfesorById(String id) {
    try {
      return _profesores.firstWhere((profesor) => profesor.id == id);
    } catch (e) {
      return null;
    }
  }

  // Obtener alumnos por clase ID
  List<Alumno> getAlumnosByClaseId(String claseId) {
    final clase = _clases.firstWhere((c) => c.id == claseId);
    return _alumnos.where((alumno) =>
        clase.alumnosIds.contains(alumno.id)).toList();
  }

  // Añadir una clase
  void addClass(Clase newClass) {
    _clases.add(newClass);
    notifyListeners();
  }

  // Actualizar una clase
  void updateClass(Clase updatedClass) {
    final index = _clases.indexWhere((c) => c.id == updatedClass.id);
    if (index != -1) {
      _clases[index] = updatedClass;
      notifyListeners();
    }
  }

  // Eliminar una clase
  void deleteClass(String id) {
    _clases.removeWhere((c) => c.id == id);
    notifyListeners();
  }
}