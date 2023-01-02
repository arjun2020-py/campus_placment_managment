import 'package:crms/loginScreen/bloc/login_bloc.dart';
import 'package:crms/loginScreen/view/login_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../bottomNavigation/view/bottom_navigation.dart';
import '../../forgotScreen/view/forgot_screen.dart';
import 'buton_0f_siginup.dart';
import 'or_text.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController(),
      passwrodController = TextEditingController();
  bool passwrodEnable = true;

  final _loginBloc = LoginBloc();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _loginBloc,
      child: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginSucesses) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const BottomNaivgation(),
              ),
            );
          } else {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Login failed')));
          }
        },
        child: Scaffold(
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
                        controller: emailController,
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
                        controller: passwrodController,
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
                      SizedBox(
                        width: 200.w,
                        child: ElevatedButton(
                          onPressed: () => _loginBloc.add(LoginStateEvent(
                              email: emailController.text,
                              passwrod: passwrodController.text)),
                          // onPressed: () {
                          //   Navigator.of(context).push(
                          //     MaterialPageRoute(
                          //       builder: (context) => const BottomNaivgation(),
                          //     ),
                          //   );
                          // },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.amber,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            side:
                                const BorderSide(width: 3, color: Colors.black),
                          ),
                          child: const Text(
                            'Login',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
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
                              style:
                                  TextStyle(fontSize: 15, color: Colors.blue),
                            ),
                          ),
                          const SizedBox(
                            width: 80,
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Need Help?',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.blue),
                            ),
                          )
                        ],
                      ),
                      OR_text(), //------------ OR ------------------------
                      const SizedBox(
                        height: 15,
                      ),

                      butonOfSiginup(
                          context) //it is elevetor button of 'siginup'
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
