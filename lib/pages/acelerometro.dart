import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class AcelerometroPage extends StatefulWidget {
  const AcelerometroPage({super.key});

  @override
  State<AcelerometroPage> createState() => _AcelerometroPageState();
}

class _AcelerometroPageState extends State<AcelerometroPage> {
  double dx = 0;
  double dy = 0;
  double dz = 0;
  final double _limit = 15;
  Color _backgroundColor = Colors.lightBlue;

  @override
  void initState() {
    super.initState();
    accelerometerEventStream().listen((AccelerometerEvent event) {
      setState(() {
        dx = event.x ;
        dy = event.y ;
        dz = event.z ;

        if( dx > _limit || dy > _limit || dz > _limit){
          _backgroundColor = Colors.primaries[Random().nextInt(Colors.primaries.length)];
        }
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Acelerometro', style: TextStyle(fontWeight: FontWeight.w600),),
        backgroundColor: _backgroundColor,
      ),
      
      backgroundColor: _backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Agite el dispositivo para cambiar de color de fondo', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
            Text('dx: $dx'),
            Text('dy: $dy'),
            Text('dz: $dz'),
          ],
        ),
      ),
    );
  }
}