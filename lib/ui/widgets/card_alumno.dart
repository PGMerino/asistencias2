import 'package:flutter/material.dart';
import 'package:app_asistencias/entities/alumno.dart';

class CardAlumno extends StatelessWidget {
  final Alumno alumno;
  final bool asistencia;
  final VoidCallback onTap;
  final VoidCallback onAsistenciaChanged;

  const CardAlumno({
    Key? key,
    required this.alumno,
    required this.asistencia,
    required this.onTap,
    required this.onAsistenciaChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.only(bottom: 12),
    elevation: 2,
    child: InkWell(
    onTap: onTap,
    child: Padding(
    padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: Colors.grey.shade200,
            child: const Icon(
              Icons.person,
              size: 32,
              color: Colors.blue,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  alumno.nombreCompleto,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${alumno.curso} ${alumno.grupo}',
                  style: TextStyle(
                    color: Colors.grey.shade700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  alumno.email,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(
              asistencia ? Icons.check_circle : Icons.check_circle_outline,
              color: asistencia ? Colors.green : Colors.grey,
              size: 30,
            ),
            onPressed: onAsistenciaChanged,
          ),
        ],
      ),
    ),
    ),
    );
  }
}