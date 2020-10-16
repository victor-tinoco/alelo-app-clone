import 'package:flutter/material.dart';

class Constants {
  static const Color darkGreen = Color(0xFF008061);
  static const Color lightGreen = Color(0xFFC1E921);
  static const Color light = Color(0xFFFAFAFA);
  static const Color purple = Color(0xFF8F248A);

  static const LinearGradient lightGreenGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFFC1EA1F),
      Color(0xFFAECC30),
    ],
    stops: [0.2, 0.8],
  );

  static const LinearGradient darkGreenGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF03957C),
      Color(0xFF057361),
    ],
    stops: [0.2, 0.8],
  );
}
