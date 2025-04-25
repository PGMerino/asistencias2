import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_asistencias/ui/pages/selector_fecha/selector_fecha_viewmodel.dart';
import 'package:app_asistencias/ui/widgets/calendario.dart';
import 'package:app_asistencias/ui/widgets/card_clase.dart';
import 'package:app_asistencias/ui/pages/clases/clases_viewmodel.dart';
import 'package:intl/intl.dart';

class SelectorFechaPage extends StatelessWidget {
  const SelectorFechaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<SelectorFechaViewModel>(context);
    final clasesViewModel = Provider.of<ClasesViewModel>(context, listen: false);

    final formatter = DateFormat('EEEE d MMMM, yyyy', 'es');
    final fechaFormateada = formatter.format(viewModel.fechaSeleccionada);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Selecciona una fecha',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Calendario(
            fechaSeleccionada: viewModel.fechaSeleccionada,
            onFechaSeleccionada: (fecha) => viewModel.seleccionarFecha(fecha),
          ),
          const SizedBox(height: 16),
          Text(
            'Clases para el ${fechaFormateada.substring(0,1).toUpperCase()}${fechaFormateada.substring(1)}',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: viewModel.isLoading
                ? const Center(child: CircularProgressIndicator())
                : viewModel.clasesDisponibles.isEmpty
                ? const Center(
              child: Text('No hay clases programadas para esta fecha'),
            )
                : ListView.builder(
              itemCount: viewModel.clasesDisponibles.length,
              itemBuilder: (context, index) {
                final clase = viewModel.clasesDisponibles[index];
                final profesor = clasesViewModel.getProfesorById(clase.profesorId);
                final alumnos = clasesViewModel.getAlumnosByClaseId(clase.id);

                return CardClase(
                  clase: clase,
                  profesor: profesor,
                  cantidadAlumnos: alumnos.length,
                  onTap: () {
                    // Navegación al detalle de la clase
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
        ],
      ),
    );
  }
}