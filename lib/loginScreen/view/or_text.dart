import 'package:flutter/material.dart';

Row OR_text() {
  return Row(children: [
    Expanded(
        child: Container(
      margin: const EdgeInsets.only(left: 10.0, right: 20.0),
      child: const Divider(
        color: Colors.black,
      ),
    )),
    const Text("OR"),
    Expanded(
        child: Container(
      margin: const EdgeInsets.only(left: 20.0, right: 10.0),
      child: const Divider(
        color: Colors.black,
      ),
    )),
  ]);
}
