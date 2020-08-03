

import 'package:moor_flutter/moor_flutter.dart';
import 'package:pasture_manager/db/dao/Evaluation/EvaluationDAO.dart';
import 'package:pasture_manager/db/dao/Farm/FarmDAO.dart';
import 'package:uuid/uuid.dart';

import 'dao/Pasture/PastureDAO.dart';
part 'DatabasePM.g.dart';



var _uuid = Uuid();


class Farms extends Table{
  TextColumn get id => text().clientDefault(() => _uuid.v4())();
  TextColumn get userId => text()();
  TextColumn get farmName => text()();
  TextColumn get document => text()();
  RealColumn get area => real()();
  TextColumn get farmAddress => text()();
  TextColumn get city => text()();
  TextColumn get uf => text()();
}

class Pastures extends Table{
  TextColumn get id => text().clientDefault(() => _uuid.v4())();
  TextColumn get farmId => text()();
  TextColumn get pastureName => text().withLength(min:1, max:30)();
  RealColumn get area => real()();
  IntColumn get grassType => integer()();
  IntColumn get vigor => integer()();
  IntColumn get port => integer()();
  TextColumn get descriptionText => text()();

}

class Evaluations extends Table{
  
  TextColumn get id => text().clientDefault(() => _uuid.v4())();
  TextColumn get userId => text()();
  TextColumn get farmId => text()();
  TextColumn get pastureId => text()();
  IntColumn get tagPast => integer()();
  RealColumn get note => real()();
  DateTimeColumn get evaluationDate => dateTime()();

}



@UseMoor(tables: [Farms, Pastures, Evaluations])
class DatabasePM extends _$DatabasePM{
  static DatabasePM  instance = DatabasePM._internal();

  PastureDAO pastureDAO;
  EvaluationDAO evaluationDAO;
  FarmDAO farmDAO;
  DatabasePM._internal(): super(FlutterQueryExecutor.inDatabaseFolder(path: "db.sqlite")){
    pastureDAO = PastureDAO(this);
    evaluationDAO =EvaluationDAO(this);
    farmDAO =FarmDAO(this);
    ///EvaluationDAO = EvaluationDAO(this);
  }




  @override
  int get schemaVersion => 1;
}