// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:pedometer/pedometer.dart';
import 'package:permission_handler/permission_handler.dart';

class ProximidadPage extends StatefulWidget {
  const ProximidadPage({super.key});

  @override
  State<ProximidadPage> createState() => _ProximidadPageState();
}

class _ProximidadPageState extends State<ProximidadPage> {
  late Stream<StepCount> _stepCountStream;
  late Stream<PedestrianStatus> _pedestrianStatusStream;
  String _status = '?', _steps = '?';
  String _statusError = '';
  String _stepCountError = '';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  void onStepCount(StepCount event) {
    print(event);
    setState(() {
      _steps = event.steps.toString();
    });
  }

  void onPedestrianStatusChanged(PedestrianStatus event) {
    print(event);
    setState(() {
      _status = event.status;
    });
  }

  void onPedestrianStatusError(error) {
    setState(() {
      _statusError = 'Error: $error';
  });
    print(_status);
  }

  void onStepCountError(error) {
    setState(() {
    _stepCountError = 'Contador de pasos error: $error';
  });
  }

  Future<bool> _checkActivityRecognitionPermission() async {
    bool granted = await Permission.activityRecognition.isGranted;

    if (!granted) {
      granted = await Permission.activityRecognition.request() == PermissionStatus.granted;
    }

    return granted;
  }

  Future<void> initPlatformState() async {
    bool granted = await _checkActivityRecognitionPermission();
    if (!granted) {
      setState(() {
        _statusError = 'Permiso de reconocimiento de actividad denegado';
      });
      return;
    }

    try{
        
      _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
      _pedestrianStatusStream.listen(onPedestrianStatusChanged).onError(onPedestrianStatusError);

      _stepCountStream = Pedometer.stepCountStream;
      _stepCountStream.listen(onStepCount).onError(onStepCountError);

      if (!mounted) return;

    }catch (e){
      setState(() {
        _statusError = 'Error al iniciar el reconocimiento de actividad: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Contador de pasos'),    
        ),

        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Pasos dados',
                style: TextStyle(fontSize: 30),
              ),
              Text(
                _steps,
                style: const TextStyle(fontSize: 60),
              ),
              Text(
                'Estatus del usuario: $_status',
                style: const TextStyle(fontSize: 24),
              ),
              const Divider(
                height: 100,
                thickness: 0,
                color: Colors.white,
              ),
              Text(
                _statusError,
                style: const TextStyle(color: Colors.red, fontSize: 18),
                textAlign: TextAlign.center,
              ),
              Text(
                _stepCountError,
                style: const TextStyle(color: Colors.red, fontSize: 18),
                textAlign: TextAlign.center,
              ),
              Icon(
                _status == 'walking'
                    ? Icons.directions_walk
                    : _status == 'stopped'
                        ? Icons.accessibility_new
                        : Icons.error,
                size: 100,
              ),
              Center(
                child: Text(
                  _status,
                  style: _status == 'walking' || _status == 'stopped'
                      ? const TextStyle(fontSize: 30)
                      : const TextStyle(fontSize: 20, color: Colors.red),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
