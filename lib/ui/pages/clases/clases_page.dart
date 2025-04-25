import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_asistencias/ui/pages/clases/clases_viewmodel.dart';
import 'package:app_asistencias/ui/widgets/card_clase.dart';

class ClasesPage extends StatelessWidget {
  const ClasesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ClasesViewModel>(context);

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

    if (viewModel.clases.isEmpty) {
      return const Center(
        child: Text('No hay clases disponibles'),
      );
    }

    return Padding(
        padding: const EdgeInsets.all(16.0),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    const Text(
    'Clases Disponibles',
    style: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    ),
    ),
    const SizedBox(height: 16),
    Expanded(
    child: ListView.builder(
    itemCount: viewModel.clases.length,
    itemBuilder: (context, index) {
    final clase = viewModel.clases[index];
    final profesor = viewModel.getProfesorById(clase.profesorId);
    final alumnos = viewModel.getAlumnosByClaseId(clase.id);

    return CardClase(
    clase: clase,
    profesor: profesor,
    cantidadAlumnos: alumnos.length,
    onTap: () {
      // Navegar a detalle de clase
      // Implementar navegación según tu esquema de rutas
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Has seleccionado la clase: ${clase.nombre}'),
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
              // Aquí iría la lógica para añadir una nueva clase
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Funcionalidad de agregar clase pendiente'),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
            ),
            child: const Text('Agregar Clase'),
          ),
        ),
      ),
    ],
    ),
    );
  }
}