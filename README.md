# Calendario académico Monokai en Flutter

Aplicación desarrollada como laboratorio de diseño de interfaces con Flutter. Presenta un calendario académico responsive con un tema inspirado en la paleta Monokai, un día destacado y una sección de próximos eventos.

## Alcance del proyecto

Este proyecto es exclusivamente visual. Su objetivo es demostrar la composición y organización de una interfaz mediante widgets de Flutter, principalmente `Row` y `Column`.

La aplicación incluye:

- Calendario de septiembre de 2026.
- Día 26 destacado visualmente.
- Tres eventos académicos de ejemplo.
- Diseño responsive para navegadores y pantallas móviles.
- Paneles, indicadores, iconos y tarjetas con estilo Monokai.
- Código dividido en widgets pequeños y comentado por bloques.
- Prueba de widgets para verificar el contenido principal.

## Funciones no implementadas

Los controles forman parte de la propuesta visual y no realizan acciones. El proyecto no incluye:

- Cambio real entre meses.
- Creación, edición o eliminación de eventos.
- Inicio de sesión o perfiles de usuario.
- Navegación entre pantallas.
- Persistencia local o conexión a una base de datos.
- Consumo de APIs o servicios externos.
- Notificaciones reales.

## Requisitos

Antes de ejecutar el proyecto, instala:

- [Flutter SDK](https://docs.flutter.dev/get-started/install) con soporte para Web.
- Google Chrome o un navegador compatible.
- Git, si deseas clonar el repositorio.

Comprueba la instalación con:

```bash
flutter --version
flutter doctor
flutter devices
```

En la lista de dispositivos debe aparecer Chrome o un navegador web compatible.

## Instalación

Clona el repositorio y entra en la carpeta del proyecto:

```bash
git clone https://github.com/C5-PHO/AMM-S5-S6.git
cd AMM-S5-S6
```

Descarga las dependencias de Flutter:

```bash
flutter pub get
```

## Ejecución en la Web

Inicia la aplicación en Google Chrome:

```bash
flutter run -d chrome
```

Si Chrome no aparece como dispositivo, habilita el soporte web y vuelve a comprobar los dispositivos:

```bash
flutter config --enable-web
flutter devices
```

## Verificación del proyecto

Ejecuta el análisis estático para detectar problemas de código:

```bash
flutter analyze
```

Ejecuta las pruebas automatizadas:

```bash
flutter test
```

Genera una compilación optimizada para Web:

```bash
flutter build web
```

Los archivos generados se guardarán en `build/web`. Esta carpeta se crea localmente y no se versiona en Git.

## Estructura principal

```text
lib/
  main.dart            Interfaz y widgets del calendario
test/
  widget_test.dart     Prueba del contenido visual principal
web/                   Configuración de Flutter Web
android/               Configuración de Android
ios/                   Configuración de iOS
pubspec.yaml           Metadatos y dependencias del proyecto
```

## Tema visual

La interfaz utiliza una adaptación de la paleta Monokai:

- Fondo carbón para reducir el contraste agresivo.
- Superficies oscuras para agrupar el contenido.
- Texto marfil para conservar la legibilidad.
- Violeta para la fecha seleccionada y los elementos principales.
- Cian, rosa, verde y naranja para diferenciar eventos y estados.

La distribución cambia según el ancho disponible: en escritorio, el calendario y los eventos aparecen en dos columnas; en pantallas pequeñas, los paneles se organizan verticalmente.

## Consideraciones

Los eventos, fechas, porcentajes e indicadores mostrados son datos estáticos usados únicamente para representar el diseño. No deben interpretarse como información almacenada o actualizada por la aplicación.
