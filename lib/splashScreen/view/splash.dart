import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:crms/introScreen/view/intro_screen.dart';
import 'package:crms/splashScreen/bloc/splash_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class LottieSplah extends StatelessWidget {
  LottieSplah({super.key});

  @override
  final _splashBloc = SplashBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _splashBloc..add(SplashScrenEvent()),
      child: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state is SplashScreenSucesses) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const IntroScreen(),
              ),
            );
          }
        },
        child: Scaffold(
          body: Container(
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 300.w,
                  height: 300.h,
                  child: Lottie.asset('assets/images/79812-happy-student.json'),
                ),
                SizedBox(
                  height: 10.h,
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TyperAnimatedText(
                      'Campus Placement Mangement System',
                      speed: const Duration(milliseconds: 200),
                      textStyle: const TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
