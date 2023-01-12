import 'package:crms/loginScreen/bloc/login_bloc.dart';
import 'package:crms/loginScreen/view/textfromFiled.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../bottomNavigation/view/bottom_navigation.dart';
import '../../forgotScreen/view/forgot_screen.dart';
import '../../siginupScreen/view/siginup.dart';

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
          backgroundColor: const Color(0xffEAE7B1),
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(200.r),
            child: AppBar(
              automaticallyImplyLeading: false,
              title: Padding(
                padding: EdgeInsets.only(top: 20.r),
                child: Center(
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 30.sp),
                  ),
                ),
              ),
              backgroundColor: const Color(0xff3C6255),
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(140.r)),
              ),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.only(top: 20.r, bottom: 10.r),
            child: SingleChildScrollView(
              child: Padding(
                padding: MediaQuery.of(context).viewInsets,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 30.h,
                    ),
                    TextfromfiledScreen(
                      emailController: emailController,
                      passwrodConroller: passwrodController,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const ForgotPass(),
                          ),
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.only(left: 180.r),
                        child: Text(
                          'Forogt passwrod ?',
                          style: TextStyle(fontSize: 15.sp),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    SizedBox(
                      width: 200.w,
                      child: ElevatedButton(
                        onPressed: () => _loginBloc.add(LoginStateEvent(
                            email: emailController.text,
                            passwrod: passwrodController.text)),
                        // onPressed: () {
                        //   Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (context) => BottomScreen(),
                        //   ));
                        // },
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xff86C8BC),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                        ),
                        child: const Text('Login'),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(left: 10, right: 20),
                            child: const Divider(
                              color: Colors.black45,
                              thickness: 0.8,
                            ),
                          ),
                        ),
                        const Text('OR'),
                        Expanded(
                          child: Container(
                            margin:
                                const EdgeInsets.only(left: 20.0, right: 10.0),
                            child: const Divider(
                              color: Colors.black45,
                              thickness: 0.8,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    SizedBox(
                      width: 200.w,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => SiginupScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xffFFD4B2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                        ),
                        child: const Text('Siginup'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
