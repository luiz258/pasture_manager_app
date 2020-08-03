import 'package:dio/dio.dart';
import 'package:pasture_manager/model/authenticate-user.model.dart';
import 'package:pasture_manager/model/create-user.model.dart';
import 'package:pasture_manager/model/recover-user.model.dart';
import 'package:pasture_manager/model/user.model.dart';
import 'package:pasture_manager/settings.dart';

class AccountRepository {
  Future<UserModel> authenticate(AuthenticateModel model) async {
    var url = "${Settings.apiUrl}v1/login/v1/authentication";
    //var url = "https://192.168.0.1:44337/v1/login/v1/authentication";
    Response response = await Dio().post(url, data: model);
    return UserModel.fromJson(response.data);
  }

  Future<CreateUserModel> registerUser(CreateUserModel model) async {
    try {
      var url = "${Settings.apiUrl}v1/user/v1/create";
      Response response = await Dio().post(url, data: model.toJson());
      return CreateUserModel.fromJson(response.data);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<UserModel> editUser(UserModel model) async {
  
      var url = "${Settings.apiUrl}v1/user/v1/edit";
      Response response = await Dio().post(url, data: model);
      return UserModel.fromJson(response.data);
    
  }

  Future<RecoverPasswordModel> recoveryEmailUser(RecoverPasswordModel model) async {
    try {
      var url = "${Settings.apiUrl}v1/user/v1/recoveryEmail";
      Response response = await Dio().post(url, data: model.toJson());
      return RecoverPasswordModel.fromJson(response.data);
    } catch (e) {
      print(e);
       return null;
    }
  }

  Future<UserModel> editPassword(UserModel model) async {
    try {
      var url = "${Settings.apiUrl}v1/user/v1/EditPassword";
      Response response = await Dio().post(url, data: model);
      return UserModel.fromJson(response.data);
    } catch (e) {
      print(e);
       return null;
    }
  }
}
