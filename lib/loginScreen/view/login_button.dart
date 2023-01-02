import 'package:crms/bottomNavigation/bottom_navigation.dart';
import 'package:flutter/material.dart';

SizedBox elevatorbttn(BuildContext context) {
  return SizedBox(
    width: MediaQuery.of(context).size.height - 100,
    height: MediaQuery.of(context).size.height - 740,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: SizedBox(
        child: ElevatedButton(
          onPressed: () {},
          // onPressed: () {
          //   Navigator.of(context).push(
          //     MaterialPageRoute(
          //       builder: (context) => const BottomNaivgation(),
          //     ),
          //   );
          // },
          style: ElevatedButton.styleFrom(
            primary: Colors.amber,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            side: const BorderSide(width: 3, color: Colors.black),
          ),
          child: const Text(
            'Login',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    ),
  );
}
