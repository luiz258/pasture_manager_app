
import 'package:moor_flutter/moor_flutter.dart';
import 'package:pasture_manager/db/DatabasePM.dart';
part 'EvaluationDAO.g.dart';


class EvaluationWithNamePasture{
  final Pasture pasture1;
  final Evaluation evaluation1;
  final Farm farm1;
  EvaluationWithNamePasture( this.pasture1, this.evaluation1, this.farm1);
}


@UseDao(tables: [Farms, Pastures, Evaluations])
class EvaluationDAO extends DatabaseAccessor<DatabasePM> with _$EvaluationDAOMixin{
  EvaluationDAO(DatabasePM db): super(db);


  Future addEvaluation(Evaluation entity){
    return into(evaluations).insert(entity);
  }

  Future<List<Evaluation>> listEvaluation(String idFarm){
    return (select(evaluations)..where((t) => t.farmId.equals(idFarm))).get();
  }

   Future removeEvaluation( _id) {
       return (delete(evaluations)..where((t) => t.id.equals(_id))).go();
    }


  Stream<List<EvaluationWithNamePasture>> listAllEvaluationPasture(String iDfarm) {
        final query = (select(evaluations)..where((tbl) => tbl.farmId.equals(iDfarm))).join([
         leftOuterJoin(farms,farms.id.equals(iDfarm)),
        //  innerJoin(farms,farms.id.equals(iDfarm)),
       
         leftOuterJoin(pastures, pastures.id.equalsExp(evaluations.pastureId)),
        
        ]);
      
        return query.watch().map((rows) {
        return rows.map((row) {
          return EvaluationWithNamePasture(
            row.readTable(pastures),
            row.readTable(evaluations),
            row.readTable(farms),
          );
        }).toList();
});

    }

}