import 'package:flutter/material.dart';

class BottomNavigator extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTap;

  const BottomNavigator({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.black54,
      elevation: 2,
      iconSize: 30,
      selectedIconTheme: const IconThemeData(size: 35, color: Colors.lightBlue),
      unselectedIconTheme: const IconThemeData(size: 30, color: Colors.black26),
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.engineering),
          label: 'Giroscopio',
        ),
        // BottomNavigationBarItem(
        //   icon: Icon(Icons.settings),
        //   label: 'Luz',
        // ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Acelerometro',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Proximidad',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Magnetometro',
        ),
        // BottomNavigationBarItem(
        //   icon: Icon(Icons.gamepad),
        //   label: 'Juego',
        // ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: Colors.lightBlue,
      unselectedItemColor: Colors.black26,
      unselectedLabelStyle: const TextStyle(color: Colors.black26),
      selectedLabelStyle: const TextStyle(color: Colors.lightBlue),
      onTap: onTap,
    );
  }
}
