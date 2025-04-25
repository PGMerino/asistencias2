import 'package:flutter/material.dart';

class Notificacion {
  final String id;
  final String titulo;
  final String mensaje;
  final DateTime fecha;
  final bool leida;

  Notificacion({
    required this.id,
    required this.titulo,
    required this.mensaje,
    required this.fecha,
    this.leida = false,
  });
}

class NotificacionesViewModel extends ChangeNotifier {
  List<Notificacion> _notificaciones = [];
  bool _isLoading = true;
  String _errorMessage = '';

  List<Notificacion> get notificaciones => _notificaciones;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;
  int get notificacionesNoLeidas => _notificaciones.where((n) => !n.leida).length;

  NotificacionesViewModel() {
    fetchNotificaciones();
  }

  Future<void> fetchNotificaciones() async {
    _isLoading = true;
    notifyListeners();

    try {
      // Simular una solicitud de red
      await Future.delayed(const Duration(seconds: 1));

      // Datos de ejemplo
      _notificaciones = [
        Notificacion(
          id: '1',
          titulo: 'Actualización de horarios',
          mensaje: 'Se ha actualizado el horario de la clase de Matemáticas.',
          fecha: DateTime.now().subtract(const Duration(hours: 2)),
        ),
        Notificacion(
          id: '2',
          titulo: 'Reunión de profesores',
          mensaje: 'Recordatorio: Reunión de profesores mañana a las 15:00.',
          fecha: DateTime.now().subtract(const Duration(days: 1)),
          leida: true,
        ),
        Notificacion(
          id: '3',
          titulo: 'Aviso de ausencia',
          mensaje: 'El alumno Luis Sánchez estará ausente durante la próxima semana.',
          fecha: DateTime.now().subtract(const Duration(days: 2)),
        ),
        Notificacion(
          id: '4',
          titulo: 'Cambio de aula',
          mensaje: 'La clase de Historia se trasladará al aula B202 temporalmente.',
          fecha: DateTime.now().subtract(const Duration(days: 3)),
          leida: true,
        ),
      ];

      _errorMessage = '';
    } catch (e) {
      _errorMessage = 'Error al cargar las notificaciones: ${e.toString()}';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void marcarComoLeida(String id) {
    final index = _notificaciones.indexWhere((n) => n.id == id);
    if (index != -1) {
      final notificacion = _notificaciones[index];
      _notificaciones[index] = Notificacion(
        id: notificacion.id,
        titulo: notificacion.titulo,
        mensaje: notificacion.mensaje,
        fecha: notificacion.fecha,
        leida: true,
      );
      notifyListeners();
    }
  }

  void marcarTodasComoLeidas() {
    _notificaciones = _notificaciones.map((n) =>
        Notificacion(
          id: n.id,
          titulo: n.titulo,
          mensaje: n.mensaje,
          fecha: n.fecha,
          leida: true,
        )
    ).toList();
    notifyListeners();
  }

  void eliminarNotificacion(String id) {
    _notificaciones.removeWhere((n) => n.id == id);
    notifyListeners();
  }
}