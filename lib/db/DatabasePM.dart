
import 'package:moor_flutter/moor_flutter.dart';
import 'package:pasture_manager/db/dao/Evaluation/EvaluationDAO.dart';
import 'package:uuid/uuid.dart';

import 'dao/Pasture/PastureDAO.dart';
part 'DatabasePM.g.dart';



var _uuid = Uuid();

class Pastures extends Table{
  TextColumn get id => text().clientDefault(() => _uuid.v4())();
  TextColumn get farmId => text().clientDefault(() => _uuid.v4())();
  TextColumn get pastureName => text().withLength(min:1, max:30)();
  RealColumn get area => real()();
  TextColumn get grassType => text()();
  TextColumn get vigor => text()();
  TextColumn get port => text()();
  TextColumn get descriptionText => text()();

}

class Evaluations extends Table{
  
  TextColumn get id => text().clientDefault(() => _uuid.v4())();
  TextColumn get userId => text()();
  TextColumn get farmId => text()();
  TextColumn get idPasture => text()();
  TextColumn get tagPast => text()();
  RealColumn get note => real()();
  DateTimeColumn get evaluationDate => dateTime()();

}



@UseMoor(tables: [Pastures, Evaluations])
class DatabasePM extends _$DatabasePM{
  static DatabasePM  instance = DatabasePM._internal();

  PastureDAO pastureDAO;
  EvaluationDAO evaluationDAO;
  DatabasePM._internal(): super(FlutterQueryExecutor.inDatabaseFolder(path: "db.sqlite")){
    pastureDAO = PastureDAO(this);
    evaluationDAO =EvaluationDAO(this);
    ///EvaluationDAO = EvaluationDAO(this);
  }




  @override
  // ////TODO: implement schemaVersion
  int get schemaVersion => 2;
}