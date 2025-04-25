import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_asistencias/ui/pages/notificaciones/notificaciones_viewmodel.dart';
import 'package:intl/intl.dart';

class NotificacionesPage extends StatelessWidget {
  const NotificacionesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<NotificacionesViewModel>(context);

    if (viewModel.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (viewModel.errorMessage.isNotEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Error: ${viewModel.errorMessage}',
              style: const TextStyle(color: Colors.red),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => viewModel.fetchNotificaciones(),
              child: const Text('Reintentar'),
            ),
          ],
        ),
      );
    }

    if (viewModel.notificaciones.isEmpty) {
      return const Center(
        child: Text('No hay notificaciones disponibles'),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Notificaciones',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (viewModel.notificacionesNoLeidas > 0)
                TextButton(
                  onPressed: () => viewModel.marcarTodasComoLeidas(),
                  child: const Text('Marcar todas como leídas'),
                ),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: viewModel.notificaciones.length,
              itemBuilder: (context, index) {
                final notificacion = viewModel.notificaciones[index];
                final formatter = DateFormat('dd/MM/yyyy HH:mm');

                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  color: notificacion.leida ? Colors.white : Colors.blue.shade50,
                  child: ListTile(
                    title: Text(
                      notificacion.titulo,
                      style: TextStyle(
                        fontWeight: notificacion.leida ? FontWeight.normal : FontWeight.bold,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 4),
                        Text(notificacion.mensaje),
                        const SizedBox(height: 4),
                        Text(
                          formatter.format(notificacion.fecha),
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete_outline),
                      onPressed: () => viewModel.eliminarNotificacion(notificacion.id),
                    ),
                    onTap: () => viewModel.marcarComoLeida(notificacion.id),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}