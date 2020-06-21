import 'package:dio/dio.dart';
import 'package:pasture_manager/db/DatabasePM.dart';
import 'package:pasture_manager/model/pasture.model.dart';
import 'package:pasture_manager/model/pasturelist.model.dart';
import 'package:pasture_manager/settings.dart';


class PastureRepository {
  var user = Settings.user;

  Future<Pasture> createPasture(Pasture model) async {
    var url = "${Settings.apiUrl}v1/pasture/v1/create";
   /// print({'id':model.id,  'farmId': model.farmId,  'pastureName': model.pastureName,  'area': model.area, 'grassType': model.grassType,'port': model.port,'vigor': model.vigor,'descriptionText': model.descriptionText});
    try {
      print('Entrou');
      var response = await Dio().post(url, data:model.toJson());
      print(response);
      return response.data;
    } catch (e) {
      print(e);
      return null;
    }


  }

  
    Future<List<PastureListModel>> getlistPasture(String idUser) async{
      try {
        var url = "${Settings.apiUrl}v1/pasture/v1/listPasture/${idUser}";
        var response = await Dio().get(url);
        //print(response);
        return (response.data as List)
          .map((data) => PastureListModel.fromJson(data)).toList(); 
      } catch (e) {
        print(e);
       
      }
    }


}
