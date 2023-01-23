import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../SherdPref/view/shres_pref.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<SplashEvent>((event, emit) async {
      if (event is SplashScrenEvent) {
        await Future.delayed(Duration(seconds: 10));

        //local storage code .

        final data = await ShredPref().getUserData();

        if (data["isLogin"] == true) {
          emit(SplashScreenSucesses());
        } else {
          emit(SplashScreenFailed());
        }
      }
    });
  }
}


// void initState() {
//     super.initState();

//     Future.delayed(const Duration(seconds: 10), () {
//       Navigator.of(context).pushReplacement(
//         MaterialPageRoute(
//           builder: (context) => const IntroScreen(),
//         ),
//       );
//     });
//   }