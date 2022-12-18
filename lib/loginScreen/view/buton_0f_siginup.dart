import 'package:flutter/material.dart';

import '../../siginupScreen/view/siginup.dart';

SizedBox butonOfSiginup(BuildContext context) {
  return SizedBox(
    width: MediaQuery.of(context).size.width - 100,
    height: MediaQuery.of(context).size.height - 740,
    child: ElevatedButton(
      onPressed: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => SiginupScreen(),
        ));
      },
      style: ElevatedButton.styleFrom(
          primary: Colors.redAccent,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          side: BorderSide(width: 3, color: Colors.black)),
      child: const Text(
        'Siginup',
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900),
      ),
    ),
  );
}
