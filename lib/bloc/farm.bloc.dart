import 'package:flutter/material.dart';

import 'package:pasture_manager/model/farm.model.dart';
import 'package:pasture_manager/model/farmResponse.model.dart';
import 'package:pasture_manager/repositories/farm.repository.dart';

class FarmBloc extends ChangeNotifier {
 
 
  Future<FarmResponse> addFarm(FarmModel model) async {
    try {
      var _repFar = new FarmRepository();
      var res = await _repFar.createFarm(model);
      //print(res);
      return FarmResponse.fromJson(res);
    } catch (e) {
      print(e);
      return e;
    }
  }


   Future<dynamic> editFarm(FarmModel model) async {
    try {
      var _repFar = new FarmRepository();
      var res = await _repFar.updateFarm(model);
     
      return res;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
