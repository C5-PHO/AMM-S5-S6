import 'package:flutter/material.dart';

// Punto de entrada: inicia la aplicacion con el widget principal.
void main() {
  runApp(const CalendarApp());
}

// Aplicacion raiz: define el tema global y la pantalla inicial.
class CalendarApp extends StatelessWidget {
  const CalendarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Agenda academica',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Arial',
        scaffoldBackgroundColor: const Color(0xFF1E1F1C),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFAE81FF),
          brightness: Brightness.dark,
        ),
      ),
      home: const CalendarScreen(),
    );
  }
}

// Pantalla principal: crea el lienzo responsive del calendario profesional.
class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Positioned.fill(child: _BackgroundDecoration()),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 36),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1180),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TopNavigation(),
                      SizedBox(height: 28),
                      HeroHeader(),
                      SizedBox(height: 24),
                      CalendarWorkspace(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Fondo decorativo: combina un degradado claro con luces ambientales discretas.
class _BackgroundDecoration extends StatelessWidget {
  const _BackgroundDecoration();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF272822), Color(0xFF1E1F1C)],
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: -140,
            right: -100,
            child: Container(
              width: 360,
              height: 360,
              decoration: const BoxDecoration(
                color: Color(0x1AAE81FF),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            bottom: -170,
            left: -100,
            child: Container(
              width: 340,
              height: 340,
              decoration: const BoxDecoration(
                color: Color(0x14A6E22E),
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Barra superior: muestra la identidad del producto y el perfil del estudiante.
class TopNavigation extends StatelessWidget {
  const TopNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: const Color(0xFF141511),
            borderRadius: BorderRadius.circular(14),
          ),
          child: const Icon(
            Icons.calendar_month_rounded,
            color: Color(0xFFF8F8F2),
            size: 23,
          ),
        ),
        const SizedBox(width: 12),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'NOVA',
              style: TextStyle(
                color: Color(0xFFF8F8F2),
                fontSize: 15,
                fontWeight: FontWeight.w900,
                letterSpacing: 1.6,
              ),
            ),
            Text(
              'Agenda academica',
              style: TextStyle(
                color: Color(0xFF9D9A8B),
                fontSize: 11,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const Spacer(),
        const _TopAction(icon: Icons.search_rounded),
        const SizedBox(width: 10),
        const _TopAction(icon: Icons.notifications_none_rounded, showDot: true),
        const SizedBox(width: 12),
        Container(
          padding: const EdgeInsets.fromLTRB(6, 6, 12, 6),
          decoration: BoxDecoration(
            color: const Color(0xFF30312C),
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: const Color(0xFF49483E)),
          ),
          child: const Row(
            children: [
              CircleAvatar(
                radius: 16,
                backgroundColor: Color(0xFF49483E),
                child: Text(
                  'PE',
                  style: TextStyle(
                    color: Color(0xFFAE81FF),
                    fontSize: 10,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              SizedBox(width: 8),
              Text(
                'Estudiante',
                style: TextStyle(
                  color: Color(0xFFF8F8F2),
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// Accion superior: reutiliza el estilo de los botones de busqueda y avisos.
class _TopAction extends StatelessWidget {
  const _TopAction({required this.icon, this.showDot = false});

  final IconData icon;
  final bool showDot;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: const Color(0xFF30312C),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: const Color(0xFF49483E)),
          ),
          child: Icon(icon, color: const Color(0xFFF8F8F2), size: 21),
        ),
        if (showDot)
          Positioned(
            top: 8,
            right: 8,
            child: Container(
              width: 7,
              height: 7,
              decoration: BoxDecoration(
                color: const Color(0xFFF92672),
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 1.5),
              ),
            ),
          ),
      ],
    );
  }
}

// Cabecera destacada: presenta el periodo y un resumen de productividad.
class HeroHeader extends StatelessWidget {
  const HeroHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(26),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF141511), Color(0xFF3E3D32)],
        ),
        borderRadius: BorderRadius.circular(28),
        boxShadow: const [
          BoxShadow(
            color: Color(0x66000000),
            blurRadius: 32,
            offset: Offset(0, 16),
          ),
        ],
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final compact = constraints.maxWidth < 650;

          final title = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'SEPTIEMBRE 2026',
                style: TextStyle(
                  color: Color(0xFFAE81FF),
                  fontSize: 11,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.8,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Organiza tu mejor semana',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: compact ? 25 : 32,
                  height: 1.1,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 9),
              const Text(
                'Tus clases, entregas y proyectos en un solo lugar.',
                style: TextStyle(
                  color: Color(0xFFD6D6CA),
                  fontSize: 13,
                  height: 1.45,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          );

          const progress = _ProgressSummary();

          return compact
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [title, const SizedBox(height: 22), progress],
                )
              : Row(
                  children: [
                    Expanded(child: title),
                    const SizedBox(width: 30),
                    progress,
                  ],
                );
        },
      ),
    );
  }
}

// Resumen de progreso: comunica visualmente las tareas completadas del mes.
class _ProgressSummary extends StatelessWidget {
  const _ProgressSummary();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 235,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0x18FFFFFF),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0x22FFFFFF)),
      ),
      child: const Row(
        children: [
          SizedBox(
            width: 50,
            height: 50,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircularProgressIndicator(
                  value: 0.75,
                  strokeWidth: 5,
                  backgroundColor: Color(0x22FFFFFF),
                  color: Color(0xFFA6E22E),
                ),
                Text(
                  '75%',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 13),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Buen progreso',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  '6 de 8 tareas completadas',
                  style: TextStyle(
                    color: Color(0xFFC9C9BC),
                    fontSize: 10,
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Area de trabajo: distribuye calendario y eventos segun el ancho disponible.
class CalendarWorkspace extends StatelessWidget {
  const CalendarWorkspace({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final desktop = constraints.maxWidth >= 860;

        if (desktop) {
          return const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(flex: 7, child: CalendarPanel()),
              SizedBox(width: 22),
              Expanded(flex: 4, child: EventsPanel()),
            ],
          );
        }

        return const Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [CalendarPanel(), SizedBox(height: 22), EventsPanel()],
        );
      },
    );
  }
}

// Panel de calendario: contiene navegacion mensual, semana y cuadricula de dias.
class CalendarPanel extends StatelessWidget {
  const CalendarPanel({super.key});

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
    CalendarDay('5', eventColor: Color(0xFF66D9EF)),
    CalendarDay('6'),
    CalendarDay('7'),
    CalendarDay('8'),
    CalendarDay('9'),
    CalendarDay('10'),
    CalendarDay('11'),
    CalendarDay('12', eventColor: Color(0xFFF92672)),
    CalendarDay('13'),
    CalendarDay('14'),
    CalendarDay('15'),
    CalendarDay('16'),
    CalendarDay('17'),
    CalendarDay('18'),
    CalendarDay('19'),
    CalendarDay('20'),
    CalendarDay('21', eventColor: Color(0xFFA6E22E)),
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
    return _SurfaceCard(
      child: Column(
        children: [
          Row(
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Calendario',
                    style: TextStyle(
                      color: Color(0xFFF8F8F2),
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(height: 3),
                  Text(
                    'Septiembre de 2026',
                    style: TextStyle(
                      color: Color(0xFF9D9A8B),
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              const _CalendarControl(icon: Icons.chevron_left_rounded),
              const SizedBox(width: 8),
              const _CalendarControl(icon: Icons.chevron_right_rounded),
            ],
          ),
          const SizedBox(height: 28),
          Row(
            children: _weekDays
                .map(
                  (day) => Expanded(
                    child: Center(
                      child: Text(
                        day,
                        style: const TextStyle(
                          color: Color(0xFF75715E),
                          fontSize: 10,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0.7,
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 12),
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
          const SizedBox(height: 18),
          const Divider(color: Color(0xFF49483E), height: 1),
          const SizedBox(height: 16),
          const Row(
            children: [
              _LegendDot(color: Color(0xFF66D9EF), label: 'Clase'),
              SizedBox(width: 20),
              _LegendDot(color: Color(0xFFF92672), label: 'Revision'),
              SizedBox(width: 20),
              _LegendDot(color: Color(0xFFA6E22E), label: 'Entrega'),
            ],
          ),
        ],
      ),
    );
  }
}

// Control del calendario: representa las flechas de cambio de mes.
class _CalendarControl extends StatelessWidget {
  const _CalendarControl({required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 38,
      height: 38,
      decoration: BoxDecoration(
        color: const Color(0xFF3E3D32),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(icon, color: const Color(0xFFF8F8F2), size: 21),
    );
  }
}

// Leyenda: relaciona cada color con un tipo de actividad.
class _LegendDot extends StatelessWidget {
  const _LegendDot({required this.color, required this.label});

  final Color color;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 7,
          height: 7,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 6),
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFF9D9A8B),
            fontSize: 10,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

// Modelo visual: guarda el numero y los estados de cada fecha.
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

// Celda de fecha: destaca el dia 26 y marca las fechas con eventos.
class DayCell extends StatelessWidget {
  const DayCell({super.key, required this.day});

  final CalendarDay day;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 43,
          height: 43,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: day.selected
                ? const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFFAE81FF), Color(0xFF8B5FD3)],
                  )
                : null,
            shape: BoxShape.circle,
            boxShadow: day.selected
                ? const [
                    BoxShadow(
                      color: Color(0x55AE81FF),
                      blurRadius: 16,
                      offset: Offset(0, 7),
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
                  ? const Color(0xFF75715E)
                  : const Color(0xFFF8F8F2),
              fontSize: 13,
              fontWeight: day.selected ? FontWeight.w900 : FontWeight.w700,
            ),
          ),
        ),
        SizedBox(
          height: 7,
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

// Panel lateral: resume el dia elegido y presenta los tres eventos requeridos.
class EventsPanel extends StatelessWidget {
  const EventsPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return _SurfaceCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 52,
                height: 58,
                decoration: BoxDecoration(
                  color: const Color(0xFF49483E),
                  borderRadius: BorderRadius.circular(17),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '26',
                      style: TextStyle(
                        color: Color(0xFFAE81FF),
                        fontSize: 20,
                        height: 1,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'SEP',
                      style: TextStyle(
                        color: Color(0xFFAE81FF),
                        fontSize: 9,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 0.7,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 13),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sabado',
                      style: TextStyle(
                        color: Color(0xFFF8F8F2),
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      '3 actividades programadas',
                      style: TextStyle(
                        color: Color(0xFF9D9A8B),
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Text(
            'PROXIMOS EVENTOS',
            style: TextStyle(
              color: Color(0xFF75715E),
              fontSize: 10,
              fontWeight: FontWeight.w900,
              letterSpacing: 1.1,
            ),
          ),
          const SizedBox(height: 13),
          const EventTile(
            title: 'Clase de Flutter',
            subtitle: 'Laboratorio de interfaces',
            time: '10:00 AM',
            icon: Icons.code_rounded,
            color: Color(0xFF66D9EF),
          ),
          const SizedBox(height: 11),
          const EventTile(
            title: 'Diseno de UI',
            subtitle: 'Revision de propuesta',
            time: '2:00 PM',
            icon: Icons.palette_outlined,
            color: Color(0xFFF92672),
          ),
          const SizedBox(height: 11),
          const EventTile(
            title: 'Entrega del laboratorio',
            subtitle: 'Presentacion Flutter Web',
            time: '6:00 PM',
            icon: Icons.assignment_turned_in_outlined,
            color: Color(0xFFA6E22E),
          ),
          const SizedBox(height: 19),
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: const Color(0xFF3E3D32),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Row(
              children: [
                Icon(
                  Icons.auto_awesome_rounded,
                  color: Color(0xFFFD971F),
                  size: 20,
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Tienes 90 minutos libres entre actividades.',
                    style: TextStyle(
                      color: Color(0xFFD6D6CA),
                      fontSize: 10,
                      height: 1.4,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Tarjeta de evento: organiza icono, descripcion y hora con Row y Column.
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
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: const Color(0xFF272822),
        borderRadius: BorderRadius.circular(17),
        border: Border.all(color: const Color(0xFF49483E)),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(13),
            ),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(width: 11),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Color(0xFFF8F8F2),
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  subtitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Color(0xFF9D9A8B),
                    fontSize: 9,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Text(
            time,
            style: TextStyle(
              color: color,
              fontSize: 9,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }
}

// Superficie reutilizable: aplica el mismo acabado a los paneles principales.
class _SurfaceCard extends StatelessWidget {
  const _SurfaceCard({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF30312C),
        borderRadius: BorderRadius.circular(26),
        border: Border.all(color: const Color(0xFF49483E)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x66000000),
            blurRadius: 28,
            offset: Offset(0, 12),
          ),
        ],
      ),
      child: child,
    );
  }
}
