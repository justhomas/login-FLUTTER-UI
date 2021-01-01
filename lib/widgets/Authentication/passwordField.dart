import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  final String label;
  PasswordField({this.label});
  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool passwordVisible = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(context) {
    return TextField(
        obscureText: !passwordVisible,
        decoration: InputDecoration(
            prefixIconConstraints: BoxConstraints(minWidth: 40, maxWidth: 40),
            prefixIcon: Icon(
              FontAwesomeIcons.key,
              size: 20,
            ),
            hintText: widget.label,
            suffixIcon: IconButton(
              icon: Icon(
                  passwordVisible
                      ? FontAwesomeIcons.eye
                      : FontAwesomeIcons.eyeSlash,
                  size: 15),
              onPressed: () {
                passwordVisible = !passwordVisible;
                setState(() {});
              },
            )));
  }
}
