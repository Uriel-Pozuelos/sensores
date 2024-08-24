import 'package:flutter/material.dart';
// import 'package:sensores/pages/game.dart';
import 'package:sensores2/pages/acelerometro.dart';
import 'package:sensores2/pages/giroscopio.dart';
import 'package:sensores2/pages/magnetometro.dart';
import 'package:sensores2/pages/proximidad.dart';
import 'package:sensores2/utils/router.dart';

import 'layouts/bottom_navigator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sensores',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Sensores'),
      routes: rutas,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const GiroscopioPage(),
    // const SensorPage(),
    const AcelerometroPage(),
    const ProximidadPage(),
    const MagnetometroPage(),
    // const GamePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text(
          widget.title,
          style: const TextStyle(fontSize: 25.0),
        ),
        centerTitle: true,
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigator(
        selectedIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
