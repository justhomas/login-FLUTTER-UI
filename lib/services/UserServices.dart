import 'dart:math';

import 'package:flutter_login_template/utilities/utilities.dart';

class UserServices {
  UserServices._privateConstructor();
  static final UserServices _instance = UserServices._privateConstructor();

  factory UserServices() {
    return _instance;
  }

  Future<AuthState> getAuthState() async {
    //TODO: this implementation is for demonstration purpose only
    var au = Future.delayed(Duration(seconds: 3)).then((value) {
      /* if (Random().nextInt(3) == 2)
        return AuthState.isAuthenticated;
      else*/
      return AuthState.isNotAuthenticated;
    });

    return au;
  }
}
