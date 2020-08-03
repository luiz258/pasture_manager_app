
import 'package:moor_flutter/moor_flutter.dart';
import 'package:pasture_manager/db/DatabasePM.dart';
part 'FarmDAO.g.dart';

@UseDao(tables: [Farms, Pastures, Evaluations])
class FarmDAO extends DatabaseAccessor<DatabasePM> with _$FarmDAOMixin {
  FarmDAO(DatabasePM db) : super(db);

  Future addFArm(Farm entity) {
    return into(farms).insert(entity);
  }

  Future updateFarm(Farm entity){
    return (update(farms)..where((tbl) => tbl.id.equals(entity.id))).write(entity);
  }
  Stream<List<Farm>> listAll(userId) {
    return (select(farms)..where((tbl) => tbl.userId.equals(userId))).watch();
  }
  
}
