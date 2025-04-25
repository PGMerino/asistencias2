import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendario extends StatelessWidget {
  final DateTime fechaSeleccionada;
  final Function(DateTime) onFechaSeleccionada;

  const Calendario({
    Key? key,
    required this.fechaSeleccionada,
    required this.onFechaSeleccionada,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.zero,
      child: TableCalendar(
        firstDay: DateTime.now().subtract(const Duration(days: 365)),
        lastDay: DateTime.now().add(const Duration(days: 365)),
        focusedDay: fechaSeleccionada,
        selectedDayPredicate: (day) {
          return isSameDay(fechaSeleccionada, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          onFechaSeleccionada(selectedDay);
        },
        headerStyle: const HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
        ),
        calendarStyle: CalendarStyle(
          selectedDecoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            shape: BoxShape.circle,
          ),
          todayDecoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withOpacity(0.3),
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}