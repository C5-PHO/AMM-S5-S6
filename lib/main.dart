import 'package:flutter/material.dart';

// Punto de entrada: inicia la aplicacion y muestra el widget principal.
void main() {
  runApp(const CalendarApp());
}

// Aplicacion raiz: configura el titulo, el tema general y la pantalla inicial.
class CalendarApp extends StatelessWidget {
  const CalendarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calendario academico',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF4F6FC),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF5568F6),
          brightness: Brightness.light,
        ),
        fontFamily: 'Arial',
      ),
      home: const CalendarScreen(),
    );
  }
}

// Pantalla principal: centra el calendario y adapta su ancho para movil o web.
class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 760),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CalendarHeader(),
                  SizedBox(height: 18),
                  CalendarCard(),
                  SizedBox(height: 22),
                  EventsSection(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Cabecera: presenta el mes, el anio y accesos visuales sin funcionalidad.
class CalendarHeader extends StatelessWidget {
  const CalendarHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const _RoundIcon(icon: Icons.chevron_left_rounded),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Septiembre 2026',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: const Color(0xFF17203A),
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'Mi calendario academico',
                style: TextStyle(
                  color: Color(0xFF7B849F),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        const _RoundIcon(icon: Icons.calendar_month_rounded),
        const SizedBox(width: 10),
        const _RoundIcon(icon: Icons.chevron_right_rounded),
      ],
    );
  }
}

// Boton decorativo circular: unifica los iconos usados en la cabecera.
class _RoundIcon extends StatelessWidget {
  const _RoundIcon({required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 42,
      height: 42,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [
          BoxShadow(
            color: Color(0x120F1738),
            blurRadius: 18,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Icon(icon, color: const Color(0xFF5568F6), size: 23),
    );
  }
}

// Tarjeta del calendario: agrupa los dias de la semana y cinco filas de fechas.
class CalendarCard extends StatelessWidget {
  const CalendarCard({super.key});

  static const List<String> _weekDays = [
    'LUN',
    'MAR',
    'MIE',
    'JUE',
    'VIE',
    'SAB',
    'DOM',
  ];

  static const List<CalendarDay> _days = [
    CalendarDay('31', muted: true),
    CalendarDay('1'),
    CalendarDay('2'),
    CalendarDay('3'),
    CalendarDay('4'),
    CalendarDay('5', eventColor: Color(0xFF5568F6)),
    CalendarDay('6'),
    CalendarDay('7'),
    CalendarDay('8'),
    CalendarDay('9'),
    CalendarDay('10'),
    CalendarDay('11'),
    CalendarDay('12', eventColor: Color(0xFFFF5E88)),
    CalendarDay('13'),
    CalendarDay('14'),
    CalendarDay('15'),
    CalendarDay('16'),
    CalendarDay('17'),
    CalendarDay('18'),
    CalendarDay('19'),
    CalendarDay('20'),
    CalendarDay('21', eventColor: Color(0xFF36B99A)),
    CalendarDay('22'),
    CalendarDay('23'),
    CalendarDay('24'),
    CalendarDay('25'),
    CalendarDay('26', selected: true),
    CalendarDay('27'),
    CalendarDay('28'),
    CalendarDay('29'),
    CalendarDay('30'),
    CalendarDay('1', muted: true),
    CalendarDay('2', muted: true),
    CalendarDay('3', muted: true),
    CalendarDay('4', muted: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(14, 22, 14, 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        boxShadow: const [
          BoxShadow(
            color: Color(0x140F1738),
            blurRadius: 28,
            offset: Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: _weekDays
                .map(
                  (day) => Expanded(
                    child: Center(
                      child: Text(
                        day,
                        style: const TextStyle(
                          color: Color(0xFF8B93AA),
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.6,
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 14),
          ...List.generate(
            5,
            (week) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                children: _days
                    .skip(week * 7)
                    .take(7)
                    .map((day) => Expanded(child: DayCell(day: day)))
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Modelo visual de un dia: guarda texto y estados usados para dibujar cada celda.
class CalendarDay {
  const CalendarDay(
    this.label, {
    this.muted = false,
    this.selected = false,
    this.eventColor,
  });

  final String label;
  final bool muted;
  final bool selected;
  final Color? eventColor;
}

// Celda de fecha: resalta el dia 26 y agrega puntos a los dias con eventos.
class DayCell extends StatelessWidget {
  const DayCell({super.key, required this.day});

  final CalendarDay day;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: 42,
          height: 42,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: day.selected ? const Color.fromARGB(255, 34, 35, 43) : Colors.transparent,
            shape: BoxShape.circle,
            boxShadow: day.selected
                ? const [
                    BoxShadow(
                      color: Color(0x555568F6),
                      blurRadius: 14,
                      offset: Offset(0, 6),
                    ),
                  ]
                : null,
          ),
          child: Text(
            day.label,
            style: TextStyle(
              color: day.selected
                  ? Colors.white
                  : day.muted
                  ? const Color(0xFFC2C6D3)
                  : const Color(0xFF28314D),
              fontSize: 14,
              fontWeight: day.selected ? FontWeight.w800 : FontWeight.w600,
            ),
          ),
        ),
        SizedBox(
          height: 6,
          child: day.eventColor == null
              ? null
              : Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: 5,
                    height: 5,
                    decoration: BoxDecoration(
                      color: day.eventColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
        ),
      ],
    );
  }
}

// Seccion de eventos: muestra el encabezado y las tres actividades solicitadas.
class EventsSection extends StatelessWidget {
  const EventsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                'Eventos destacados',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: const Color(0xFF17203A),
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            const Text(
              '26 SEP',
              style: TextStyle(
                color: Color(0xFF5568F6),
                fontSize: 12,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.8,
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),
        const EventTile(
          title: 'Clase de Flutter',
          subtitle: 'Laboratorio de interfaces',
          time: '10:00 AM',
          icon: Icons.code_rounded,
          color: Color(0xFF5568F6),
        ),
        const SizedBox(height: 12),
        const EventTile(
          title: 'Diseno de UI',
          subtitle: 'Revision de propuesta visual',
          time: '2:00 PM',
          icon: Icons.palette_outlined,
          color: Color(0xFFFF5E88),
        ),
        const SizedBox(height: 12),
        const EventTile(
          title: 'Entrega del laboratorio',
          subtitle: 'Presentacion en Flutter Web',
          time: '6:00 PM',
          icon: Icons.assignment_turned_in_outlined,
          color: Color(0xFF36B99A),
        ),
      ],
    );
  }
}

// Tarjeta de evento: organiza con Row el icono, la informacion y la hora.
class EventTile extends StatelessWidget {
  const EventTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.icon,
    required this.color,
  });

  final String title;
  final String subtitle;
  final String time;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE8EBF4)),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFF202943),
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Color(0xFF8991A8),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Text(
            time,
            style: TextStyle(
              color: color,
              fontSize: 12,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}
