import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'fill_application_event.dart';
part 'fill_application_state.dart';

class FillApplicationBloc
    extends Bloc<FillApplicationEvent, FillApplicationState> {
  FillApplicationBloc() : super(FillApplicationInitial()) {
    on<FillApplicationEvent>((event, emit) async {
      if (event is ApplicationFillEvent) {
        final _auth = FirebaseAuth.instance;

        final applicationRef =
            FirebaseFirestore.instance.collection('Fill_Application');

        final ApplicationId = _auth.currentUser!.uid;

        try {
          await applicationRef.doc(ApplicationId).set({
            'firstName': event.firstName,
            'lastName': event.lastName,
            'email': event.email,
            'mobileNo': event.mobNo,
            'country': event.country,
            'city': event.city,
            'jobTitle': event.jobTitle,
            'jobType': event.jobType,
            'educationLevel': event.educationLevel,
            'skills': event.skills,
            'certficates': event.Certificates
          });
          emit(FillApplicationSucess());
        } catch (e) {
          emit(FillApplicationFailed());
        }
      }
    });
  }
}
