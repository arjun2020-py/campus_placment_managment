// import 'dart:async';
// import 'dart:io';
// import 'package:file_picker/file_picker.dart';
// import 'package:path/path.dart';
// import 'package:flutter/services.dart';

// class PdfOperation {
//   static Future<File?> pickFile() async {
//     final result = await FilePicker.platform.pickFiles(
//       type: FileType.custom,
//       allowedExtensions: ['pdf'],
//     );

//     if (result != null) return  null;
//     // return File(result.paths);
//   }

//   static Future<File> _storeFile(String url, List<int> bytes) async {
//     final filename = basename(url);
//     final dir = await getApplicationDocumentsDirectory();

//     final file = File('${dir.path}/$filename');
//     await file.writeAsBytes(bytes, flush: true);
//     return file;
//   }
// }

























// // import 'package:flutter/material.dart';
// // import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;  
// // class LoadPdf extends StatefulWidget {
// //   const LoadPdf({super.key});

// //   @override
// //   State<LoadPdf> createState() => _LoadPdfState();
// // }

// // class _LoadPdfState extends State<LoadPdf> {
// //   firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;
// //   @override
// //   Widget build(BuildContext context) {
// //     return Container();
// //   }
// // }