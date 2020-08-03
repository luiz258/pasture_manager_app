import 'package:flutter/material.dart';
import 'package:pasture_manager/db/DatabasePM.dart';
import 'package:pasture_manager/repositories/evaluation.repository.dart';

class EvaluationBloc extends ChangeNotifier {
  Future<List<Evaluation>> syncEvaluation(String farmId) async {
    var _repEva = new EvaluationRepository();
    List<Evaluation> eva =
        await DatabasePM.instance.evaluationDAO.listEvaluation(farmId);
    eva.forEach((element) async {
      await _repEva.createEvaluation(element);
    });
    return <Evaluation>[];
  }

  
}
