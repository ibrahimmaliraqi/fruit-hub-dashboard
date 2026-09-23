import 'package:flutter/material.dart';

AppBar buildAppBar({required String text}) {
  return AppBar(
    centerTitle: true,
    backgroundColor: Colors.transparent,
    title: Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: const Color(0xFF0C0D0D) /* Grayscale-950 */,
        fontSize: 19,
        fontFamily: 'Cairo',
        fontWeight: FontWeight.w700,
      ),
    ),
  );
}
