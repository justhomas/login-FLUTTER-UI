import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_login_template/utilities/utilities.dart';
import 'package:flutter_login_template/services/UserServices.dart';
import 'package:flutter_login_template/widgets/signin.dart';
import 'package:flutter_login_template/widgets/home.dart';

class Root extends StatefulWidget {
  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
  AuthState au;

  @override
  void initState() {
    super.initState();
    getAuthState();
  }

  Future<void> getAuthState() async {
    au = await UserServices().getAuthState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Widget w;
    switch (au) {
      case AuthState.isAuthenticated:
        w = HomeWidget();
        break;
      case AuthState.isNotAuthenticated:
        w = LoginWidget();
        break;
      default:
        w = Center(
          child: CircularProgressIndicator(),
        );
        break;
    }
    return w;
  }
}
