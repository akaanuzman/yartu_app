import 'package:flutter/material.dart';

class NormalText extends Text {
  const NormalText({
    Key? key,
    required String data,
  }) : super(
          data,
          key: key,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
        );
}
