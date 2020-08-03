import 'package:flutter/material.dart';
import 'package:pasture_manager/db/DatabasePM.dart';
import 'package:pasture_manager/repositories/pasture.repository.dart';

class PastureBloc extends ChangeNotifier {
  


  Future<List<Pasture>> sincronozarPasto(idFarm) async {
    var _repPasture = new PastureRepository();
    List<Pasture> a = await DatabasePM.instance.pastureDAO.syncListPasture(idFarm);
      a.forEach((element) async {
        await _repPasture.createPasture(element);
      });
      return <Pasture>[];
  }

}
