import 'package:crms/FillApplication/view/fill_application.dart';
import 'package:crms/homeScreen/view/home_screen.dart';
import 'package:crms/viewVacany/view/view_vacany.dart';
import 'package:flutter/material.dart';

class BottomNaivgation extends StatefulWidget {
  const BottomNaivgation({super.key});

  @override
  State<BottomNaivgation> createState() => _BottomNaivgationState();
}

class _BottomNaivgationState extends State<BottomNaivgation> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOption = [
    const HomeScreen(),
    const FillApplication(),
     ViewJob(),
    const Center(child: Text('profile'))
  ];

  void _onItemPressed(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOption[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cast_for_education),
            label: 'Fill Apllication',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.view_agenda),
            label: 'View vacany',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: 'Profile',
          )
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        unselectedItemColor: const Color(0xff393E46),
        iconSize: 20,
        onTap: _onItemPressed,
        elevation: 5,
      ),
    );
  }
}
