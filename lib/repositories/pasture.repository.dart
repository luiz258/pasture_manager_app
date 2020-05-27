import 'package:dio/dio.dart';
import 'package:pasture_manager/db/DatabasePM.dart';
import 'package:pasture_manager/model/pasture.model.dart';
import 'package:pasture_manager/settings.dart';

class PastureRepository {
  var user = Settings.user;

  Future<void> createPasture(Stream<List<Pasture>> model) async {
    // print('sync');
    try {
      var url = "${Settings.apiUrl}v1/pasture/v1/create";
      Response response;

      model.forEach((element) async {
        for (var per in element) {
          print('-------per value---------');
            PastureModel js =  new PastureModel(
              area: per.area,
              descriptionText: per.descriptionText,
              farmId: per.farmId,
              grassType: per.grassType,
              id: per.id,
              pastureName: per.pastureName,
              port: per.port,
              vigor: per.vigor
            );
            print('-------per value-------$per.toJson()}');
          response = await Dio().post(url, data:js);
        }
        return Pasture.fromJson(response.data);
      });

    } catch (e) {
      print(e);
      return e;
    }

    ///print(user);
  }
}
