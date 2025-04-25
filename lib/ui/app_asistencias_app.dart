import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_asistencias/ui/pages/login/login_page.dart';
import 'package:app_asistencias/ui/pages/login/login_viewmodel.dart';
import 'package:app_asistencias/ui/pages/clases/clases_viewmodel.dart';
import 'package:app_asistencias/ui/pages/profesores/profesores_viewmodel.dart';
import 'package:app_asistencias/ui/pages/notificaciones/notificaciones_viewmodel.dart';
import 'package:app_asistencias/ui/pages/selector_fecha/selector_fecha_viewmodel.dart';
import 'package:app_asistencias/utils/routes/navigation_viewmodel.dart';

class AppAsistenciasApp extends StatelessWidget {
  const AppAsistenciasApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavigationViewModel()),
        ChangeNotifierProvider(create: (_) => LoginViewModel()),
        ChangeNotifierProvider(create: (_) => ClasesViewModel()),
        ChangeNotifierProvider(create: (_) => ProfesoresViewModel()),
        ChangeNotifierProvider(create: (_) => NotificacionesViewModel()),
        ChangeNotifierProvider(create: (_) => SelectorFechaViewModel()),
      ],
      child: MaterialApp(
        title: 'App Asistencias',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const LoginPage(),
      ),
    );
  }
}