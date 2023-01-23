import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'user_profile_event.dart';
part 'user_profile_state.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  UserProfileBloc() : super(UserProfileInitial()) {
    on<UserProfileEvent>((event, emit) async {
      if (event is ProfileScreenEvent) {
        final _userProfile =
            FirebaseFirestore.instance.collection('student_users');
        final _auth = FirebaseAuth.instance;
        final refernce = FirebaseStorage.instance
            .ref()
            .child('profileImages')
            .child(event.image!.name);
        final file = File(event.image!.path);
        await refernce.putFile(file);

        final imageLink = await refernce.getDownloadURL();

        await _userProfile
            .doc(_auth.currentUser!.uid)
            .update({'profileImages': imageLink});
        print(imageLink);

        emit(ProfileScreenSucess());
      } else {
        emit(ProfileScreenFailed());
      }
    });
  }
}
//  Future<void> updateProfilePic(XFile image) async {
//     final refernce =
//         FirebaseStorage.instance.ref().child('profileImages').child(image.name);
//     final file = File(image.path); //assgin local path to file.
//     await refernce.putFile(file);
//     final imageLink = await refernce.getDownloadURL();

//     await _userProfile
//         .doc(_auth.currentUser!.uid)
//         .update({'profileImages': imageLink});
//     print(imageLink);
//   }