import 'package:flutter/material.dart';

class SpecialBoldText extends Text {
  const SpecialBoldText({
    Key? key,
    required String data,
  }) : super(
          data,
          key: key,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        );
}