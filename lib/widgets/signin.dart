import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_login_template/utilities/utilities.dart';
import 'package:flutter_login_template/utilities/formatters.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_login_template/widgets/signup.dart';
import 'package:flutter_login_template/widgets/forgotPassword.dart';
import 'package:flutter_login_template/widgets/Authentication/passwordField.dart';
import 'package:flutter_login_template/widgets/signInWith.dart';

class LoginWidget extends StatefulWidget {
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  bool checking = false;
  bool loginWithCredentials = false;
  bool enableSignIn = true;
  Map error = {'email': ''};
  TextEditingController _emailController;
  TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    checking = false;
    loginWithCredentials = false;
  }

  Future<AuthState> authenticationDemo() async {
    AuthState a = await Future.delayed(Duration(seconds: 3)).then((value) {
      return AuthState.isNotAuthenticated;
    });
    return a;
  }

  void authenticate(BuildContext context) {
    checking = true;
    enableSignIn = false;
    setState(() {});

    //authenticate=ion code;
    authenticationDemo().then((AuthState s) {
      if (s == AuthState.isNotAuthenticated) {
        checking = false;
        enableSignIn = true;
        setState(() {});
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Error'),
              content:
                  Text('The username of password you have entered is wrong'),
              actions: [
                FlatButton(
                  textColor: Colors.black,
                  onPressed: () {},
                  child: Text('Reset Password'),
                ),
                FlatButton(
                  textColor: Colors.black,
                  onPressed: () {},
                  child: Text('Retry'),
                ),
              ],
            );
          },
        );
      }
    });
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
        'Sign in',
        style: AuthTitleStyle,
      ),
      TextField(
          controller: _emailController,
          inputFormatters: [EmailInputFormatter()],
          decoration: InputDecoration(
              errorText: error['email'].isEmpty ? null : error['email'],
              prefixIcon: Icon(
                FontAwesomeIcons.envelope,
                size: 20,
              ),
              prefixIconConstraints: BoxConstraints(minWidth: 40, maxWidth: 40),
              hintText: 'Enter your email')),
      PasswordField(
        label: 'Enter your password',
        controller: _passwordController,
      ),
      Align(
        alignment: Alignment.centerRight,
        child: FlatButton(
            padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
            onPressed: () {
              Navigator.push(context,
                  MyCustomRoute(builder: (context) => ForgotPasswordWidget()));
            },
            child: Text('Forgot Password?')),
      ),
      RaisedButton(
        onPressed: enableSignIn
            ? () {
                authenticate(context);
              }
            : null,
        disabledColor: Color.fromRGBO(22, 160, 133, 0.35),
        color: Color.fromRGBO(22, 160, 133, 1.0),
        child: checking
            ? SizedBox(
                child: CircularProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
                ),
                height: 15,
                width: 15,
              )
            : Text(
                'Sign In',
                style: TextStyle(color: Colors.white),
              ),
      ),
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
                      image:
                          AssetImage('assets/undraw_Fingerprint_re_uf3f.png'))),
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
                    Text('Don\'t have an Account?'),
                    FlatButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MyCustomRoute(
                                  builder: (context) => SignUpWidget()));
                        },
                        child: Text('Create an Account'))
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
