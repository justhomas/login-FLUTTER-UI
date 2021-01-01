import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EmailInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.startsWith('@') || newValue.text.startsWith('.')) {
      return oldValue;
    }
    return newValue;
  }
}

class NumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isNotEmpty) {
      try {
        var n = int.parse(newValue.text);
      } on FormatException {
        return oldValue;
      }
    }

    return newValue;
  }
}
