
import 'package:moor_flutter/moor_flutter.dart';
import 'package:pasture_manager/db/DatabasePM.dart';
part 'EvaluationDAO.g.dart';


class EvaluationWithNamePasture{
  final Pasture pasture1;
  final Evaluation evaluation1;

  EvaluationWithNamePasture( this.pasture1, this.evaluation1);
}


@UseDao(tables: [Pastures, Evaluations])
class EvaluationDAO extends DatabaseAccessor<DatabasePM> with _$EvaluationDAOMixin{
  EvaluationDAO(DatabasePM db): super(db);


  Future addEvaluation(Evaluation entity){
    return into(evaluations).insert(entity);
  }

  Future<List<Evaluation>> listEvaluation(){
    return (select(evaluations)).get();
  }

   Future removeEvaluation( _id) {
       return (delete(evaluations)..where((t) => t.id.equals(_id))).go();
    }


  Stream<List<EvaluationWithNamePasture>> listAllEvaluationPasture() {
     
        final query = select(evaluations).join([
          leftOuterJoin(pastures, pastures.id.equalsExp(evaluations.idPasture)
          
          )
        ]);

        return query.watch().map((rows) {
        return rows.map((row) {
          return EvaluationWithNamePasture(
            row.readTable(pastures),
            row.readTable(evaluations),
          );
        }).toList();
});

    }

}