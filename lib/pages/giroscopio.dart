import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class GiroscopioPage extends StatefulWidget{
  const GiroscopioPage({super.key});

  @override
  State<GiroscopioPage> createState() => _GiroscopioPageState();
}

class _GiroscopioPageState extends State<GiroscopioPage>{
  double dx = 100;
  double dy = 100;

  @override
  void initState(){
    super.initState();
    gyroscopeEventStream().listen((GyroscopeEvent event){
      setState(() {
        dx += event.y * 10;
        dy += event.x * 10;
      });
    });
  }

  @override
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Giroscopio'),
      ),
      body: Stack(
        children: [
          Positioned(
            left: 10,
            top: 10,
            child: Text('Valores del giroscopio en \n x: $dx \n y: $dy', style: const TextStyle(fontSize: 15)),
          ),

          Positioned(
            left: dx,
            top: dy,
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),


        ],
      ),
    );
  }
}