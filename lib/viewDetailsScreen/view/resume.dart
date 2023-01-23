import 'dart:async';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path/path.dart';

class UploadPdf extends StatefulWidget {
  const UploadPdf({super.key});

  @override
  State<UploadPdf> createState() => _UploadPdfState();
}

class _UploadPdfState extends State<UploadPdf> {
  UploadTask? task;
  File? file;
  var name;
  String url = '';
  @override
  Widget build(BuildContext context) {
    final fileName = file != null ? basename(file!.path) : 'No File Selected';
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(120.r),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 250.w,
                child: SingleChildScrollView(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 150.w,
                          child: ElevatedButton(
                            // onPressed: selectFile,
                            onPressed: getFile,
                            child: const Text('Pick Pdf'),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(fileName)
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 250.w,
                child: ElevatedButton(
                    onPressed: uploadFile, child: const Text('Upload Pdf')),
              ),
              // task != null ? buildUploadStatus(task!) : Container(),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> getFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc'],
    );

    if (result != null) {
      final fileName = basename(file!.path);

      var c = File(result.files.single.path.toString());
      setState(() {
        file = c;
        name = result.names.toString();
      });
      // uploadFile();
    }
  }

  // Future selectFile() async {
  //   final result = await FilePicker.platform.pickFiles();

  //   if (result == null) return;

  //   //open  file

  //   final path = result.files.toString();

  //   setState(() => file = File(path));
  // }

  // Future uploadFile() async {
  //   if (file == null) return;
  //   print(
  //     '---------------------------------------------------------------------------------',
  //   );
  //   final fileName = basename(file!.path);
  //   final destination = 'Filles/$fileName';

  //   task = FirebasePage.uploadFiles(destination, file!);
  //   setState(() {});

  //   if (task == null) return;

  //   final snapshot = await task!.whenComplete(
  //     () {},
  //   );
  //   final urlDownload = await snapshot.ref.getDownloadURL();

  //   print('Download link $urlDownload');
  // }

  Future<dynamic> uploadFile() async {
    try {
      final imagefile =
          FirebaseStorage.instance.ref().child('Users').child('/$name');
      final task = imagefile.putFile(file!);
      final snapshot = await task;
      url = await snapshot.ref.getDownloadURL();

      // print(url);
      if (file != null) {
        await Fluttertoast.showToast(
          msg: 'Done Uploaded',
          textColor: Colors.red,
        );
      } else {
        await Fluttertoast.showToast(
          msg: 'Something went wrong',
          textColor: Colors.red,
        );
      }
    } on Exception catch (e) {
      unawaited(
        Fluttertoast.showToast(
          msg: e.toString(),
          textColor: Colors.red,
        ),
      );
    }
  }

  Widget buildUploadStatus(UploadTask task) => StreamBuilder<TaskSnapshot>(
        stream: task.snapshotEvents,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final snap = snapshot.data!;
            final progress = snap.bytesTransferred / snap.totalBytes;
            final percentage = (progress * 100).toStringAsFixed(2);

            return Text(
              '$percentage %',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            );
          } else {
            return Container();
          }
        },
      );
}
