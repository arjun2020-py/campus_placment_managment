import 'package:crms/forgotScreen/view/new_passwrod.dart';
import 'package:crms/loginScreen/login_screen.dart';
import 'package:crms/siginupScreen/view/siginup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff01c4b2),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.only(bottom: 150.r),
                child: const Text(
                  'Welcome',
                  style: TextStyle(
                    fontSize: 25,
                    color: Color(0xffffffff),
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            // SizedBox(
            //   height: 10.h,
            // ),
            Padding(
              padding: EdgeInsets.only(bottom: 100.r),
              child: Image.asset(
                'assets/images/pic1.png',
              ),
            ),
            SizedBox(
              width: 300.w,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff1C315E),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  side: const BorderSide(width: 3, color: Color(0xffE6E2C3)),
                ),
                child: const Text("Let's Go"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
