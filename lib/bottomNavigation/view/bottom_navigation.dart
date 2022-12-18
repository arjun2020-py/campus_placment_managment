import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNaivgation extends StatefulWidget {
  const BottomNaivgation({super.key});

  @override
  State<BottomNaivgation> createState() => _BottomNaivgationState();
}

class _BottomNaivgationState extends State<BottomNaivgation> {
  int _selectedIndex = 0;
  List<Widget> _widgetOption = [
    const Center(
      child: Text(
        'Home',
      ),
    ),
    const Center(child: Text('Search')),
    const Center(child: Text('view vacncy')),
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
      bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.search_rounded), label: 'Search'),
            BottomNavigationBarItem(
                icon: Icon(Icons.view_agenda), label: 'View vacany'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                ),
                label: 'Profile')
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          iconSize: 20,
          onTap: _onItemPressed,
          elevation: 5),
    );
  }
}
