// ignore_for_file: avoid_print

// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:light/light.dart';
// // import 'package:sensors_plus/sensors_plus.dart';

// class SensorPage extends StatefulWidget {
//   const SensorPage({super.key});
//   @override
//   State<SensorPage> createState() => _SensorPageState();
// }

// class _SensorPageState extends State<SensorPage> {
//   String _luxString = 'Unknown';
//   Light? _light;
//   StreamSubscription? _subscription;

//   void onData(int luxValue) async {
//     print("Lux value: $luxValue");
//     setState(() {
//       _luxString = "$luxValue";
//     });
//   }

//   void stopListening() {
//     _subscription?.cancel();
//   }

//   void startListening() {
//     _light = Light();
//     try {
//       _subscription = _light?.lightSensorStream.listen(onData);
//     } on LightException catch (exception) {
//       print(exception);
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     startListening();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Sensor de Luz'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text('Luz: $_luxString ', style: const TextStyle(fontSize: 30), textAlign: TextAlign.center,),

//           ],
//         ),
//       ),
//     );
//   }
// }


