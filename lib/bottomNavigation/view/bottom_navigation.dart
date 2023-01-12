import 'package:crms/FillApplication/view/fill_application.dart';
import 'package:crms/FillApplication/view/fill_form.dart';
import 'package:crms/homeScreen/view/home_screen.dart';
import 'package:crms/myJob/view/my_job.dart';
import 'package:crms/profileScreen/profile_screen.dart';
import 'package:crms/viewVacany/view/view_vacany.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNaivgation extends StatefulWidget {
  const BottomNaivgation({super.key});

  @override
  State<BottomNaivgation> createState() => _BottomNaivgationState();
}

class _BottomNaivgationState extends State<BottomNaivgation> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOption = [
    const HomeScreen(),
    FillFormScreen(),
    ViewJob(),
    MyJobScreen(),
    ProfileScreen()
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
            label: 'View Vacancy',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.add_card), label: 'My jobs'),
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
        iconSize: 20.sp,
        onTap: _onItemPressed,
        elevation: 5,
        selectedLabelStyle: TextStyle(fontSize: 10.sp),
      ),
    );
  }
}
