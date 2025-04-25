import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_asistencias/utils/routes/navigation_viewmodel.dart';
import 'package:app_asistencias/ui/pages/notificaciones/notificaciones_viewmodel.dart';

class BarraNav extends StatelessWidget {
  const BarraNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationViewModel = Provider.of<NavigationViewModel>(context);
    final notificacionesViewModel = Provider.of<NotificacionesViewModel>(context);

    return BottomNavigationBar(
      currentIndex: navigationViewModel.currentIndex,
      onTap: (index) => navigationViewModel.setCurrentIndex(index),
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      items: [
        const BottomNavigationBarItem(
          icon: Icon(Icons.class_),
          label: 'Clases',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profesores',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today),
          label: 'Calendario',
        ),
        BottomNavigationBarItem(
          icon: Stack(
            clipBehavior: Clip.none,
            children: [
              const Icon(Icons.notifications),
              if (notificacionesViewModel.notificacionesNoLeidas > 0)
                Positioned(
                  top: -5,
                  right: -5,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 12,
                      minHeight: 12,
                    ),
                    child: Text(
                      notificacionesViewModel.notificacionesNoLeidas.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
          label: 'Notificaciones',
        ),
      ],
    );
  }
}