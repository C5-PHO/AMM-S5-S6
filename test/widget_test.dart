import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_application_1/main.dart';

// Prueba visual basica: confirma que aparecen el mes y los tres eventos.
void main() {
  testWidgets('muestra el calendario academico completo', (tester) async {
    // Construye la aplicacion en el entorno de pruebas.
    await tester.pumpWidget(const CalendarApp());

    // Verifica los textos principales del calendario.
    expect(find.text('Septiembre 2026'), findsOneWidget);
    expect(find.text('26'), findsOneWidget);

    // Verifica las tres actividades visuales requeridas por el laboratorio.
    expect(find.text('Clase de Flutter'), findsOneWidget);
    expect(find.text('Diseno de UI'), findsOneWidget);
    expect(find.text('Entrega del laboratorio'), findsOneWidget);
  });
}
