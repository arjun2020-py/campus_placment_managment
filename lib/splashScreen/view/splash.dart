import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:crms/introScreen/view/intro_screen.dart';
import 'package:crms/loginScreen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

// class SplashScreen extends StatelessWidget {
//   const SplashScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xffffffff),
//       body: SafeArea(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             AnimatedTextKit(
//               animatedTexts: [
//                 TyperAnimatedText(
//                   'Campus Placment Mangement System',
//                   speed: const Duration(milliseconds: 200),
//                   textStyle: const TextStyle(
//                     fontStyle: FontStyle.italic,
//                     fontSize: 20,
//                     fontWeight: FontWeight.w900,
//                   ),
//                 )
//               ],
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             Image.asset(
//               'assets/images/pics.png',
//             ),
//             const SizedBox(
//               height: 80,
//             ),
//             SizedBox(
//               width: MediaQuery.of(context).size.width - 100,
//               height: MediaQuery.of(context).size.height - 740,
//               child: ElevatedButton(
//                 onPressed: () {
//                   Navigator.of(context).push(
//                     MaterialPageRoute(
//                       builder: (context) => LoginScreen(),
//                     ),
//                   );
//                 },
//                 // ignore: sort_child_properties_last
//                 child: const Text(
//                   "Let's Go",
//                   style: TextStyle(
//                     fontStyle: FontStyle.italic,
//                     color: Colors.black,
//                   ),
//                 ),
//                 style: ElevatedButton.styleFrom(
//                   primary: Colors.greenAccent,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                   side: const BorderSide(width: 5, color: Colors.black26),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

class LottieSplah extends StatefulWidget {
  const LottieSplah({super.key});

  @override
  State<LottieSplah> createState() => _LottieSplahState();
}

class _LottieSplahState extends State<LottieSplah> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 23), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const IntroScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
