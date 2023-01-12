import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextfromfiledScreen extends StatelessWidget {
  TextfromfiledScreen(
      {Key? key,
      required this.emailController,
      required this.passwrodConroller})
      : super(key: key);

  TextEditingController emailController = TextEditingController(),
      passwrodConroller = TextEditingController();

  final fromkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: fromkey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: emailController,
              autofocus: true,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'email id',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.r))),
              validator: (value) {
                if (value!.isEmpty ||
                    !RegExp(r'^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$')
                        .hasMatch(value)) {
                  return 'Please Enter vaild email address';
                }
              },
            ),
            SizedBox(
              height: 10.h,
            ),
            TextFormField(
              controller: passwrodConroller,
              autofocus: true,
              obscureText: true,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'passwrod',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.r))),
            ),
          ],
        ),
      ),
    );
  }
}