import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_asistencias/ui/pages/profesores/profesores_viewmodel.dart';
import 'package:app_asistencias/ui/widgets/card_profesor.dart';

class ProfesoresPage extends StatelessWidget {
  const ProfesoresPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ProfesoresViewModel>(context);

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
              onPressed: () => viewModel.fetchData(),
              child: const Text('Reintentar'),
            ),
          ],
        ),
      );
    }

    if (viewModel.profesores.isEmpty) {
      return const Center(
        child: Text('No hay profesores disponibles'),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Listado de Profesores',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: viewModel.profesores.length,
              itemBuilder: (context, index) {
                final profesor = viewModel.profesores[index];
                final clases = viewModel.getClasesByProfesorId(profesor.id);

                return CardProfesor(
                  profesor: profesor,
                  cantidadClases: clases.length,
                  onTap: () {
                    // Navegar a detalle de profesor
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Has seleccionado al profesor: ${profesor.nombreCompleto}'),
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Aquí iría la lógica para añadir un nuevo profesor
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Funcionalidad de agregar profesor pendiente'),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                ),
                child: const Text('Agregar Profesor'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}