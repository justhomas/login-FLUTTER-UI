import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/widgets.dart';
import 'package:flutter_login_template/utilities/utilities.dart';
import 'package:flutter_login_template/widgets/signin.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_login_template/widgets/signInWith.dart';
import 'package:flutter_login_template/widgets/Authentication/passwordField.dart';

class SignUpWidget extends StatefulWidget {
  @override
  _SignUpWidgetState createState() => _SignUpWidgetState();
}

class MyCustomRoute<T> extends MaterialPageRoute<T> {
  MyCustomRoute({WidgetBuilder builder, RouteSettings settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    // Fades between routes. (If you don't want any animation,
    // just return child.)
    return new FadeTransition(opacity: animation, child: child);
  }
}

class _SignUpWidgetState extends State<SignUpWidget> {
  bool checking = false;
  bool loginWithCredentials = false;
  TextEditingController _passwordController;
  @override
  void initState() {
    super.initState();
    checking = false;
    loginWithCredentials = false;
  }

  @override
  Widget build(BuildContext context) {
    var bottomInset = MediaQuery.of(context).viewInsets.bottom;
    if (bottomInset > 100) {
      loginWithCredentials = true;
      setState(() {});
    } else {
      loginWithCredentials = false;
      setState(() {});
    }

    List signInWidget = [
      Text(
        'Create Account',
        style: AuthTitleStyle,
      ),
      TextField(
        decoration: InputDecoration(
            prefixIconConstraints: BoxConstraints(minWidth: 40, maxWidth: 40),
            prefixIcon: Icon(
              FontAwesomeIcons.envelope,
              size: 20,
            ),
            prefixStyle: TextStyle(),
            hintText: 'Enter your email'),
      ),
      PasswordField(
        label: 'Enter your password',
        controller: _passwordController,
      ),
      RaisedButton(
          onPressed: () {},
          color: Color.fromRGBO(22, 160, 133, 1.0),
          child: Text(
            'Create Account',
            style: TextStyle(color: Colors.white),
          )),
    ];

    if (!loginWithCredentials) {
      signInWidget += signInWithWidget;
    }
    return Scaffold(
      body: SafeArea(
        child: ClipRect(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Expanded(
                  flex: 1,
                  child: Image(
                      image: AssetImage('assets/undraw_Login_re_4vu2.png'))),
              Expanded(
                  flex: 2,
                  child: Container(
                      margin: loginWithCredentials
                          ? EdgeInsets.fromLTRB(5, 0, 5, 20)
                          : EdgeInsets.all(0),
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          borderRadius: loginWithCredentials
                              ? BorderRadius.all(Radius.circular(20))
                              : BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 150,
                                spreadRadius: 0.2,
                                offset: Offset(0, -40))
                          ]),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [...signInWidget])))
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            border: Border(
                top: BorderSide(
                    color: Colors.grey, style: BorderStyle.solid, width: 1))),
        height: 36,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            children: [
              Container(
                height: 35,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an Account?'),
                    FlatButton(
                        onPressed: () {
                          Navigator.pop(
                              context,
                              MyCustomRoute(
                                  builder: (context) => LoginWidget()));
                        },
                        child: Text('Sign in'))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
