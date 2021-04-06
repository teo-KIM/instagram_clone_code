import 'package:flutter/material.dart';
import 'package:instagram_clone_code/constants/common_size.dart';

InputDecoration textInputDecor(String hint) {
  return InputDecoration(
    hintText: hint,
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey[300],
      ),
      borderRadius: BorderRadius.circular(common_s_gap),
    ),
    errorBorder: errorInputBorder(),
    focusedBorder: activeInputBorder(),
    focusedErrorBorder: errorInputBorder(),
    filled: true,
    fillColor: Colors.grey[100],
  );
}

OutlineInputBorder activeInputBorder() {
  return OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.blue[300],
    ),
    borderRadius: BorderRadius.circular(common_s_gap),
  );
}

OutlineInputBorder errorInputBorder() {
  return OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.red[300],
    ),
    borderRadius: BorderRadius.circular(common_s_gap),
  );
}