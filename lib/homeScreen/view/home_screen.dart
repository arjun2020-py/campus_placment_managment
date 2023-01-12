import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff46C2CB),
      appBar: AppBar(
        backgroundColor: Color(0xff6D67E4),
        automaticallyImplyLeading: false,
        title: const Center(child: Text('Dashboad')),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: SizedBox(
                width: 300.w,
                height: 100.h,
                child: Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('Yesterday Applied Jobs'),
                      Text('0'),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Center(
              child: SizedBox(
                width: 300.w,
                height: 100.h,
                child: Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('Last 7 Days Applied Jobs'),
                      Text('0'),
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: SizedBox(
                width: 300.w,
                height: 100.h,
                child: Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('Total Applied Jobs'),
                      Text('0'),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Center(
              child: SizedBox(
                width: 300.w,
                height: 100.h,
                child: Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('Total vacancy'),
                      Text('0'),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
      ),
    );
  }
}
