import 'package:flutter/material.dart';
import 'package:sensores2/pages/proximidad.dart';

import '../pages/acelerometro.dart';
import '../pages/giroscopio.dart';
import '../pages/magnetometro.dart';
// import '../pages/sensor_luz.dart';

Map<String, WidgetBuilder> rutas = {
  '/giroscopio': (context) => const GiroscopioPage(),
  // '/sensor_luz': (context) => const SensorPage(),
  '/acelerometro': (context) => const AcelerometroPage(),
  '/proximidad': (context) => const ProximidadPage(),
  '/magnetometro': (context) => const MagnetometroPage(),
};