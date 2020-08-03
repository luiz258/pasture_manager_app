import 'package:flutter/material.dart';
import 'package:pasture_manager/db/DatabasePM.dart';
import 'package:pasture_manager/settings.dart';

class SyncBloc extends ChangeNotifier {
  bool validatebutton = true;
  int pasturelength;
  int dbpasturelength;
  var user = Settings.user;

  List<Pasture> dbPasture;

  getDbPasture(idFarm) async {
    await DatabasePM.instance.pastureDAO.syncListPasture(idFarm).then((value) {
      this.dbPasture = value;
    });
    dbpasturelength = this.dbPasture.length;
    notifyListeners();
    print(dbPasture.toString());
  }
}
