import 'package:crms/siginupScreen/bloc/siginup_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';

import '../../loginScreen/view/login_screen.dart';

class SiginupScreen extends StatefulWidget {
  const SiginupScreen({super.key});

  @override
  State<SiginupScreen> createState() => _SiginupScreenState();
}

class _SiginupScreenState extends State<SiginupScreen> {
  TextEditingController nameController = TextEditingController(),
      emailController = TextEditingController(),
      mobileController = TextEditingController(),
      passController = TextEditingController(),
      confromPassController = TextEditingController();
  bool passwrodEnable = true;
  final _siginupBloc = SiginupBloc();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _siginupBloc,
      child: BlocListener<SiginupBloc, SiginupState>(
        listener: (context, state) {
          if (state is SiginupState) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ));
          } else {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("Sucessfullt login")));
          }
        },
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(15),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  width: 1.sw,
                  height: 1.sh,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset('assets/images/104759-login.json',
                          height: 115),
                      SizedBox(
                        height: 12.h,
                      ),
                      const Text(
                        'Signup',
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontSize: 25,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      SizedBox(
                        height: 9.h,
                      ),
                      TextFormField(
                        controller: nameController,
                        decoration: const InputDecoration(
                          hintText: 'Enter your name',
                          filled: true,
                          fillColor: Colors.white,
                          suffixIcon: Icon(Icons.person),
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      TextFormField(
                        controller: emailController,
                        decoration: const InputDecoration(
                          hintText: 'Enter your email',
                          filled: true,
                          fillColor: Colors.white,
                          suffixIcon: Icon(Icons.email),
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      TextFormField(
                        controller: mobileController,
                        decoration: const InputDecoration(
                          hintText: 'Enter your MobNo',
                          filled: true,
                          fillColor: Colors.white,
                          suffixIcon: Icon(Icons.phone),
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      TextFormField(
                        controller: passController,
                        obscureText: passwrodEnable,
                        decoration: InputDecoration(
                          hintText: 'Enter your passwrod',
                          filled: true,
                          fillColor: Colors.white,
                          suffix: IconButton(
                            onPressed: () {
                              setState(() {
                                if (passwrodEnable) {
                                  passwrodEnable = false;
                                } else {
                                  passwrodEnable = true;
                                }
                              });
                            },
                            icon: Icon(passwrodEnable
                                ? Icons.visibility
                                : Icons.visibility_off),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        controller: confromPassController,
                        obscureText: passwrodEnable,
                        decoration: InputDecoration(
                            hintText: 'Retype your passwrod',
                            filled: true,
                            fillColor: Colors.white,
                            suffix: IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (passwrodEnable) {
                                      passwrodEnable = false;
                                    } else {
                                      passwrodEnable = true;
                                    }
                                  });
                                },
                                icon: Icon(passwrodEnable
                                    ? Icons.visibility
                                    : Icons.visibility_off))),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        width: 250,
                        child: ElevatedButton(
                          onPressed: () => _siginupBloc.add(SiginupAuthEvent(
                              name: nameController.text,
                              email: emailController.text,
                              mobileNo: mobileController.text,
                              pass: passController.text,
                              confromPass: confromPassController.text,),
                              ),
                          // onPressed: () {

                          //   // Navigator.of(context).pushReplacement(
                          //   //   MaterialPageRoute(
                          //   //     builder: (context) => LoginScreen(),
                          //   //   ),
                          //   // );
                          // },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.amber,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            side:
                                const BorderSide(width: 3, color: Colors.black),
                          ),
                          child: const Text('Signup'),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(
                                  left: 10.0, right: 20.0),
                              child: const Divider(
                                color: Colors.black,
                              ),
                            ),
                          ),
                          const Text('OR'),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(
                                  left: 20.0, right: 10.0),
                              child: const Divider(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        'Login with',
                        style: TextStyle(
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              FontAwesomeIcons.facebook,
                              color: Colors.blue,
                              size: 22.r,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              FontAwesomeIcons.google,
                              color: Colors.redAccent,
                              size: 22.r,
                            ),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              FontAwesomeIcons.github,
                              size: 22.r,
                            ),
                          )
                        ],
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     Text(
                      //       'facebook',
                      //       style: TextStyle(fontSize: 15.sp),
                      //     ),
                      //     SizedBox(
                      //       width: 10.h,
                      //     ),
                      //     Text(
                      //       'google',
                      //       style: TextStyle(fontSize: 15.sp),
                      //     ),
                      //     SizedBox(
                      //       width: 10.h,
                      //     ),
                      //     Text(
                      //       'github',
                      //       style: TextStyle(fontSize: 15.sp),
                      //     ),
                      //   ],
                      // )
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
