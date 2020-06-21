import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pasture_manager/model/authenticate-user.model.dart';
import 'package:pasture_manager/model/create-user.model.dart';
import 'package:pasture_manager/model/user.model.dart';
import 'package:pasture_manager/repositories/account.repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../settings.dart';

class AccountBloc extends ChangeNotifier {
  var user = Settings.user;
  bool bisy;
  AccountBloc() {
    //print(Settings.user);
    bisy = false;
    //  user = null;
    loadUser();
  }

  showLoad() {
    print('aqui');
    bisy = true;
    notifyListeners();
  }

  offLoad() {
    print('aqui2');
    bisy = false;
    notifyListeners();
  }

  Future<UserModel> authenticate(AuthenticateModel model) async {
    try {
      var prefs = await SharedPreferences.getInstance();
      var repository = new AccountRepository();

      var res = await repository.authenticate(model);

      user = res;
      await prefs.setString('user', jsonEncode(res));

      return res;
    } catch (ex) {
      print(ex);

      user = null;
      return null;
    }
  }

  lougout() async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString('user', null);
    user = null;
    prefs.clear();
    notifyListeners();
  }

  Future loadUser() async {
    var prefs = await SharedPreferences.getInstance();
    var userData = prefs.getString('user');
    if (userData != null) {
      var res = UserModel.fromJson(jsonDecode(userData));
      Settings.user = res;
      user = res;
      return res;
    }
  }

  Future<CreateUserModel> register(CreateUserModel model) async {
    var _repUser = new AccountRepository();
    try {
      var res = await _repUser.registerUser(model);
      return res;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
