import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_asistencias/ui/pages/clases/clases_page.dart';
import 'package:app_asistencias/ui/pages/profesores/profesores_page.dart';
import 'package:app_asistencias/ui/pages/notificaciones/notificaciones_page.dart';
import 'package:app_asistencias/ui/pages/selector_fecha/selector_fecha_page.dart';
import 'package:app_asistencias/ui/widgets/barra_nav.dart';
import 'package:app_asistencias/ui/widgets/encabezado.dart';
import 'package:app_asistencias/utils/routes/navigation_viewmodel.dart';
import 'package:app_asistencias/data/preferences/shared_preferences_helper.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationViewModel = Provider.of<NavigationViewModel>(context);

    // Lista de páginas para el índice de navegación
    final List<Widget> pages = [
      const ClasesPage(),
      const ProfesoresPage(),
      const SelectorFechaPage(),
      const NotificacionesPage(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: FutureBuilder<String>(
          future: SharedPreferencesHelper.getUserType(),
          builder: (context, snapshot) {
            String title = 'App Asistencias';
            if (snapshot.hasData && snapshot.data != null) {
              title = snapshot.data == 'admin' ? 'Panel de Administrador' : 'Panel de Profesor';
            }
            return Text(title);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () async {
              await SharedPreferencesHelper.clearUserData();
              if (context.mounted) {
                Navigator.of(context).pushReplacementNamed('/login');
              }
            },
          ),
        ],
      ),
      body: Column(
        children: [
          const Encabezado(),
          Expanded(
            child: pages[navigationViewModel.currentIndex],
          ),
        ],
      ),
      bottomNavigationBar: const BarraNav(),
    );
  }
}