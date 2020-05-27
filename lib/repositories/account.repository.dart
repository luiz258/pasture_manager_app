
import 'package:dio/dio.dart';
import 'package:pasture_manager/model/authenticate-user.model.dart';
import 'package:pasture_manager/model/user.model.dart';
import 'package:pasture_manager/settings.dart';


class AccountRepository{
  // Future<UserModel> authenticate(AuthenticateModel model ) async{
  //   var url = "${Settings.apiUrl}v1/login/v1/authentication";
  //   Response response = await Dio().post(url, data: model);
  //   return UserModel.fromJson(response.data);
  // }


  //https://localhost:62504/
//https://localhost:44337/v1/pasture/v1/create
    Future<UserModel> authenticate(AuthenticateModel model) async {

// Dio dio = new Dio();
// (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
//     (HttpClient client) {
//   client.badCertificateCallback =
//       (X509Certificate cert, String host, int port) => true;
//   return client;
// };


var url = "${Settings.apiUrl}/v1/login/v1/authentication";
 
    Response response = await Dio().post(url, data: model );
    return UserModel.fromJson(response.data);
  }

  



}
