import 'package:crms/loginScreen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewpasswrodScreen extends StatelessWidget {
  const NewpasswrodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Padding(
            padding: EdgeInsets.only(top: 25),
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
            ),
          ),
        ),
        title: const Center(
          child: Padding(
            padding: EdgeInsets.only(top: 35),
            child: Text(
              'New Passwrod',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        actions: const [Icon(Icons.search)],
      ),
      body: Padding(
        padding: EdgeInsets.all(10.r),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 180.r, top: 80.r),
              child: const Text(
                'Enter New Passwrod',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(width: 3, color: Colors.redAccent)),
                hintText: '8 symbols at least',
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 180.r, top: 20.r),
              child: const Text(
                'Confrom Passwrod',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(width: 3, color: Colors.redAccent)),
                hintText: '. . . . . . . .',
                hintStyle: TextStyle(fontWeight: FontWeight.w800),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 250.w,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: const BorderSide(width: 3, color: Colors.black),
                  ),
                ),
                child: const Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
