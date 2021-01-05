import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:flutter_login_template/utilities/utilities.dart';
import 'package:flutter_login_template/utilities/formatters.dart';
import 'package:flutter_login_template/widgets/signup.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ForgotPasswordWidget extends StatefulWidget {
  @override
  _ForgotPasswordWidgetState createState() => _ForgotPasswordWidgetState();
}

class _ForgotPasswordWidgetState extends State<ForgotPasswordWidget> {
  bool otpSent = false;
  bool otpReSent = false;
  bool checking = false;
  bool loginWithCredentials = false;
  Map<String, String> error = {'otpVerifyInput': ''};

  TextEditingController _otpController;
  TextEditingController _emailController;
  @override
  void initState() {
    super.initState();
    otpSent = false;
    loginWithCredentials = false;
  }

  Timer _timer;
  int _start = 10;
  void startTimer() {
    _start = 10;
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            otpReSent = true;
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Future<bool> sendOTPDemo() async {
    bool a = await Future.delayed(Duration(seconds: 3)).then((value) {
      return true;
    });
    return a;
  }

  void sendOtp(BuildContext context) {
    checking = true;
    setState(() {});

    sendOTPDemo().then((bool s) {
      if (s) {
        otpSent = true;
        startTimer();
        setState(() {});
      } else {
        otpSent = false;
        checking = false;
        setState(() {});

        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Account not found'),
              content: Text(
                  'The details you have entered does not correspond to any account. Please check it again'),
              actions: [
                FlatButton(
                  textColor: Colors.black,
                  onPressed: () {},
                  child: Text('Try Again'),
                ),
                FlatButton(
                  textColor: Colors.black,
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MyCustomRoute(builder: (context) => SignUpWidget()));
                  },
                  child: Text('Create an Account'),
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
      Container(
        margin: EdgeInsets.only(bottom: 5),
        child: Text(
          otpSent ? 'OTP is sent to your mail' : 'Please enter your email',
          style: AuthTitleStyle,
        ),
      ),
      Container(
        child: otpSent
            ? TextField(
                key: Key('otpField'),
                controller: _emailController,
                inputFormatters: [NumberInputFormatter()],
                maxLength: 6,
                decoration: InputDecoration(
                  labelText: 'Enter your OTP',
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                ),
              )
            : TextField(
                key: Key('emailField'),
                controller: _otpController,
                inputFormatters: [EmailInputFormatter()],
                decoration: InputDecoration(
                    prefixIcon: Icon(FontAwesomeIcons.envelope),
                    prefixStyle: TextStyle(),
                    hintText: 'Enter your email'),
              ),
      ),
      otpSent
          ? RaisedButton(
              color: Colors.blueAccent,
              onPressed: () {
                setState(() {});
              },
              child: Text(
                'Verify OTP',
                style: TextStyle(color: Colors.white),
              ),
            )
          : RaisedButton(
              color: Colors.blueAccent,
              onPressed: checking
                  ? null
                  : () {
                      sendOtp(context);
                    },
              child: checking
                  ? SizedBox(
                      child: CircularProgressIndicator(
                        valueColor:
                            new AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                      height: 15,
                      width: 15,
                    )
                  : Text(
                      'Send OTP',
                      style: TextStyle(color: Colors.white),
                    ),
            ),
      otpSent
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                otpReSent
                    ? Align(
                        alignment: Alignment.centerLeft,
                        child: FlatButton(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Text('Resend OTP'),
                          onPressed: () {
                            otpReSent = false;
                            startTimer();
                            setState(() {});
                          },
                        ),
                      )
                    : Text('Resend OTP in $_start s'),
                FlatButton(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Text('Modify Email'),
                  onPressed: () {
                    otpSent = false;
                    setState(() {});
                  },
                )
              ],
            )
          : Container(),
    ];

    return Scaffold(
      body: SafeArea(
        child: ClipRect(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Expanded(
                  flex: 5,
                  child: Image(
                      image: AssetImage(
                          'assets/undraw_forgot_password_gi2d.png'))),
              Expanded(
                  flex: loginWithCredentials ? 6 : 3,
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
                          Navigator.pushReplacement(
                              context,
                              MyCustomRoute(
                                  builder: (context) => SignUpWidget()));
                        },
                        child: Text('Create Account'))
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
