import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class FirebasePage {
  static UploadTask? uploadFiles(String destination, File file) {
    try {
      final ref = FirebaseStorage.instance.ref(destination);
      return ref.putFile(file);
    } on FirebaseException catch (e) {
      return null;
    }
  }
}
