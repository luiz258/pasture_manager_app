import 'package:dio/dio.dart';
import 'package:pasture_manager/db/DatabasePM.dart';
import 'package:pasture_manager/model/last-review-by-pasto.dart';
import 'package:pasture_manager/model/pasturelist.model.dart';
import 'package:pasture_manager/settings.dart';


class PastureRepository {
  var user = Settings.user;

  Future<Pasture> createPasture(Pasture model) async {
    var url = "${Settings.apiUrl}v1/pasture/v1/create";
   /// print({'id':model.id,  'farmId': model.farmId,  'pastureName': model.pastureName,  'area': model.area, 'grassType': model.grassType,'port': model.port,'vigor': model.vigor,'descriptionText': model.descriptionText});
    try {
      var response = await Dio().post(url, data:model.toJson());
  
      return response.data;
    } catch (e) {
      print(e);
      return null;
    }


  }

  
    Future<List<PastureListModel>> getlistPasture( String idfarm) async{
      try {
        print('$idfarm------------334');
        ///v1/pasture/list/{idFarm}
        var url = "https://ucpapi.azurewebsites.net/v1/pasture/list/$idfarm";
        var response = await Dio().get(url);
        //return response.data;
         return (response.data as List)
          .map((data) => PastureListModel.fromJson(data)).toList(); 
      } catch (e) {
        print(e);
       return null;
      }
    }


      
    Future<List<LastReviewByPasto>> getListLastReviewByPast( String idfarm) async{
      try {
        print('$idfarm------------334');
        
        var url = "https://ucpapi.azurewebsites.net/v1/pasture/v1/listPasture/$idfarm";
        var response = await Dio().get(url);
        //return response.data;
        print(response.data);
         return (response.data as List)
          .map((data) => LastReviewByPasto.fromJson(data)).toList(); 
      } catch (e) {
        print(e);
       return null;
      }
    }



}
