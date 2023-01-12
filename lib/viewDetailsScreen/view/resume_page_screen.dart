import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_document_picker/flutter_document_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class UploadPdf extends StatelessWidget {
  const UploadPdf({super.key});

  Future<firebase_storage.UploadTask> uploadFile(File file) async {
    // if (file == null) {

    // }

    firebase_storage.UploadTask uploadTask;

    // Create a Reference to the file
    final ref = firebase_storage.FirebaseStorage.instance.ref().child('Files');
    // .child('/some-file.pdf');

    final metadata = firebase_storage.SettableMetadata(
      contentType: 'file/pdf',
      customMetadata: {'picked-file-path': file.path},
    );
    //content type is show chypakn.
    // print("Uploading..!");

    uploadTask = ref.putData(await file.readAsBytes(), metadata);

    print("done..!");
    return Future.value(uploadTask);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                final path = await FlutterDocumentPicker.openDocument();

                final file = File(path!);

                firebase_storage.UploadTask task = await uploadFile(file);
                print('============================');

                print(firebase_storage.UploadTask);
              },
              child: Text('Upload Resume'),
            ),
            //  ElevatedButton(onPressed: () {}, child: Text('View Resume'))
          ],
        ),
      ),
    );
  }
}
