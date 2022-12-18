import 'package:crms/loginScreen/view/login_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../forgotScreen/view/forgot_screen.dart';
import 'buton_0f_siginup.dart';
import 'or_text.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool passwrodEnable = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: SizedBox(
              width: 1.sw,
              height: 1.sh,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  const Text(
                    'STUDENT',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  Lottie.asset(
                    'assets/images/55964-college-student-jumping.json',
                    height: 250,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Login',
                    style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      //  border: OutlineInputBorder(),
                      hintText: 'username',
                      suffixIcon: Icon(
                        Icons.email,
                        color: Colors.greenAccent,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    obscureText: passwrodEnable,
                    decoration: InputDecoration(
                      //  border: OutlineInputBorder(),
                      hintText: 'passwrod',

                      suffix: IconButton(
                        onPressed: () {
                          setState(() {
                            if (passwrodEnable) {
                              //f passenable == flase, make it true
                              passwrodEnable = false;
                            } else {
                              passwrodEnable = true;
                            }
                          });
                        },
                        icon: Icon(
                          passwrodEnable
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.greenAccent,
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  elevatorbttn(context),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    // mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const ForgotPass(),
                            ),
                          );
                        },
                        child: const Text(
                          'Forgot Passwrod',
                          style: TextStyle(fontSize: 15, color: Colors.blue),
                        ),
                      ),
                      const SizedBox(
                        width: 80,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Need Help?',
                          style: TextStyle(fontSize: 15, color: Colors.blue),
                        ),
                      )
                    ],
                  ),
                  OR_text(), //------------ OR ------------------------
                  const SizedBox(
                    height: 15,
                  ),

                  butonOfSiginup(context) //it is elevetor button of 'siginup'
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
