import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

List signInWithWidget = [
  Row(
    children: [
      Expanded(
          child: Container(
        color: Colors.grey,
        height: 1,
      )),
      Expanded(
          child: Text(
        'Or Sign in with',
        textAlign: TextAlign.center,
      )),
      Expanded(
          child: Container(
        color: Colors.grey,
        height: 1,
      )),
    ],
  ),
  Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        child: Container(
          margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
          child: RaisedButton(
            onPressed: () {},
            color: Colors.orange,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    FontAwesomeIcons.google,
                    color: Colors.white,
                    size: 15,
                  ),
                ),
                Text(
                  'Google',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
      Expanded(
        child: Container(
          margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
          child: RaisedButton(
            onPressed: () {},
            color: Colors.blue,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    FontAwesomeIcons.facebookF,
                    color: Colors.white,
                    size: 15,
                  ),
                ),
                Text(
                  'Faceboook',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      )
    ],
  ),
  RaisedButton(
    onPressed: () {},
    color: Colors.black,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            FontAwesomeIcons.github,
            color: Colors.white,
            size: 15,
          ),
        ),
        Text(
          'Github',
          style: TextStyle(color: Colors.white),
        ),
      ],
    ),
  ),
];
