import 'package:flutter/material.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          child: VerificationCode(
            length: 4,
            textStyle: TextStyle(fontSize: 20, color: Colors.black),
            underlineColor: Colors.black,
            keyboardType: TextInputType.number,
            underlineUnfocusedColor: Colors.black,
            onCompleted: (value) {
              setState(() {
                var _code = value;
              });
            },
            onEditing: (value) {},
          ),
        ),
      ),
    );
  }
}
