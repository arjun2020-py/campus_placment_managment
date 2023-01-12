import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;  
class LoadPdf extends StatefulWidget {
  const LoadPdf({super.key});

  @override
  State<LoadPdf> createState() => _LoadPdfState();
}

class _LoadPdfState extends State<LoadPdf> {
  firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}