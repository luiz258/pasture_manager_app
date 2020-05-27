import 'package:flutter/cupertino.dart';
import 'package:pasture_manager/db/DatabasePM.dart';
import 'package:pasture_manager/repositories/pasture.repository.dart';

class PastureBloc extends ChangeNotifier {

   Future<void> sincronozarPasto() async{
    var _repPasture = new PastureRepository();
    var a = DatabasePM.instance.pastureDAO.listPasture();
  
  await _repPasture.createPasture(a);
  }
}
