import 'package:flutter/material.dart';
import 'package:pasture_manager/db/DatabasePM.dart';
import 'package:pasture_manager/model/pasturelist.model.dart';
import 'package:pasture_manager/repositories/pasture.repository.dart';
import 'package:pasture_manager/settings.dart';

class SyncBloc extends ChangeNotifier {
  bool validatebutton = true;
  int pasturelength;
  int dbpasturelength;
  var user = Settings.user;
  var _repPasture = new PastureRepository();
  List<PastureListModel> pastures;
  List<Pasture> dbPasture;
SyncBloc(){
getPastures();
getDbPasture();
print(pasturelength);
print(dbpasturelength);

}


  getPastures() async{
 
   await _repPasture.getlistPasture(user.id).then((value)  async{
     //print(value);
      this.pastures = value;
      notifyListeners();
    });
    pasturelength = this.pastures.length;
    
  }

  getDbPasture() async {
    await DatabasePM.instance.pastureDAO.syncListPasture().then((value) {
      this.dbPasture = value;
      notifyListeners();
    });
 dbpasturelength =  this.dbPasture.length;
  }


}
