
import 'package:moor_flutter/moor_flutter.dart';
import 'package:pasture_manager/db/DatabasePM.dart';
part 'PastureDAO.g.dart';


@UseDao(tables: [Pastures, Evaluations])
class PastureDAO extends DatabaseAccessor<DatabasePM> with _$PastureDAOMixin{
  PastureDAO(DatabasePM db): super(db);


  Future addPasture(Pasture entity){
    return into(pastures).insert(entity);
  }

  Stream<List<Pasture>> listPasture(idfarm){
    return (select(pastures)..where((tbl) => tbl.farmId.equals(idfarm))).watch();
  }

  Stream<List<Pasture>> listPasturePerFarmId(idfarm){
    return (select(pastures)..where((t) => t.farmId.equals(idfarm))).watch();
  }

  Future<List<Pasture>> syncListPasture(idfarm){
  return (select(pastures)..where((t) => t.farmId.equals(idfarm))).get();

  }
  Future updatePastureSyncData(Pasture model){
    return (update(pastures).replace(model));
  }


  Future removePasture( _id) {
    return (delete(pastures)..where((t) => t.id.equals(_id))).go();
  }
}