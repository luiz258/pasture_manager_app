import 'package:dio/dio.dart';
import 'package:pasture_manager/model/farm.model.dart';

import '../settings.dart';

class FarmRepository {
  Future<dynamic> createFarm(FarmModel model) async {
    var url = "${Settings.apiUrl}v1/farm/v1/create";
    var response = await Dio().post(url, data: model.toJson());
    return response.data;
  }

  Future<dynamic> updateFarm(FarmModel model) async {
    var url = "${Settings.apiUrl}v1/farm/v1/edit";
    var response = await Dio().put(url, data: model.toJson());
    print(response.data);
    return response.data;
  }
}
