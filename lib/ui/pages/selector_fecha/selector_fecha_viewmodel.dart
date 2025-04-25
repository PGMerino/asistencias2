import 'package:flutter/material.dart';
import 'package:app_asistencias/entities/clase.dart';

class SelectorFechaViewModel extends ChangeNotifier {
  DateTime _fechaSeleccionada = DateTime.now();
  List<Clase> _clasesDisponibles = [];
  bool _isLoading = false;

  DateTime get fechaSeleccionada => _fechaSeleccionada;
  List<Clase> get clasesDisponibles => _clasesDisponibles;
  bool get isLoading => _isLoading;

  SelectorFechaViewModel() {
    cargarClasesParaFecha(_fechaSeleccionada);
  }

  void seleccionarFecha(DateTime fecha) {
    _fechaSeleccionada = fecha;
    cargarClasesParaFecha(fecha);
    notifyListeners();
  }

  Future<void> cargarClasesParaFecha(DateTime fecha) async {
    _isLoading = true;
    notifyListeners();

    try {
      // Simular carga de datos
      await Future.delayed(const Duration(milliseconds: 500));

      // En un escenario real, aquí filtraríamos las clases por fecha
      // Por ahora, usamos los mismos datos de ejemplo pero simulamos un filtro
      // basado en el día de la semana

      final diaSemana = fecha.weekday; // 1 = lunes, 7 = domingo

      switch (diaSemana) {
        case 1: // Lunes
          _clasesDisponibles = clasesExample.where((c) =>
              c.horario.toLowerCase().contains('lunes')).toList();
          break;
        case 2: // Martes
          _clasesDisponibles = clasesExample.where((c) =>
              c.horario.toLowerCase().contains('martes')).toList();
          break;
        case 3: // Miércoles
          _clasesDisponibles = clasesExample.where((c) =>
              c.horario.toLowerCase().contains('miércoles')).toList();
          break;
        case 4: // Jueves
          _clasesDisponibles = clasesExample.where((c) =>
              c.horario.toLowerCase().contains('jueves')).toList();
          break;
        case 5: // Viernes
          _clasesDisponibles = clasesExample.where((c) =>
              c.horario.toLowerCase().contains('viernes')).toList();
          break;
        default: // Fin de semana
          _clasesDisponibles = [];
          break;
      }
    } catch (e) {
      // Manejo de errores
      _clasesDisponibles = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}