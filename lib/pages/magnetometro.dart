import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class MagnetometroPage extends StatefulWidget {
  const MagnetometroPage({super.key});

  @override
  State<MagnetometroPage> createState() => _MagnetometroPageState();

}

class _MagnetometroPageState extends State<MagnetometroPage> {
  DateTime _dateTime = DateTime.now();
  double x = 0;
  double y = 0;
  double z = 0;


  @override
  void initState() {
    super.initState();
    magnetometerEventStream().listen((MagnetometerEvent event) {
      setState(() {
        x = event.x;
        y = event.y;
        z = event.z;
        _dateTime = DateTime.now();

      });
    });
  }

  double calcularGrados(double x, double y){
    double radianes = 0;
    double grados = 0;

    radianes = atan2(x, y);
    grados = radianes * 180 / pi;

    if(grados < 0){
      grados = 360 + grados;
    }

    return grados;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final grados = calcularGrados(x, y);
    final angulo = pi / 180 * grados;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Magnetometro', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('${grados.toStringAsFixed(0)} °', style: const TextStyle(fontSize: 30, color: Colors.white)),
            Expanded(
              child: Center(
                child: Transform.rotate(
                  angle: angulo,
                  child: Image.asset(
                    'assets/compass.png',
                    height: MediaQuery.of(context).size.height * 0.8,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}