import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'siginup_event.dart';
part 'siginup_state.dart';

class SiginupBloc extends Bloc<SiginupEvent, SiginupState> {
  SiginupBloc() : super(SiginupInitial()) {
    on<SiginupEvent>((event, emit) async {
      if (event is SiginupAuthEvent) {
         final auth = FirebaseAuth.instance;
        final companyUserRef =
            FirebaseFirestore.instance.collection('student_users');

        try {
          await auth.createUserWithEmailAndPassword(
              email: event.email, password: event.pass);

          await companyUserRef.doc(auth.currentUser!.uid).set({
            'userId': auth.currentUser!.uid,
            'email': event.email,
            'studentName': event.name,
            'mobNo': event.mobileNo,
            'passwrod': event.pass,
            'confromPass': event.confromPass,
            'profileImage': '',
          });
          emit(SiginupAuthSucess());
        } catch (e) {
          emit(SiginupAuthFailed());
        }
      }
    });
  }
}
