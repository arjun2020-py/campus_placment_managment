import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import '../../SherdPref/view/shres_pref.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      if (event is LoginStateEvent) {
        final auth = FirebaseAuth.instance;

        try {
          await auth.signInWithEmailAndPassword(
            email: event.email,
            password: event.passwrod,
          );
          //2 shred preffrces code
          await ShredPref().setUserData(event.email, auth.currentUser!.uid);
          emit(LoginSucesses());
        } catch (e) {
          emit(LoginFailed());
        }
      }
    });
  }
}
