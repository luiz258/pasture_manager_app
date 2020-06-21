import 'package:dio/dio.dart';
import 'package:pasture_manager/db/DatabasePM.dart';
import 'package:pasture_manager/model/evaluation.model.dart';

import '../settings.dart';


class EvaluationRepository {
  Future<Evaluation> createEvaluation(Evaluation model) async {
    try {
      print(model.toJson());
      var url = "${Settings.apiUrl}v1/evaluation/v1/create";
      var response = await Dio().post(url, data: model.toJson());
     return response.data;
    } catch (e) {
      print(e);
      return null;
    }
  }

   Future<List<EvaluationModel>> getListEvaluation() async{
      try {
        var url = "${Settings.apiUrl}v1/pasture/v1/create";
        var response = await Dio().get(url);
        return (response.data as List)
          .map((data) => EvaluationModel.fromJson(data)).toList(); 
      } catch (e) {
        print(e);
       return null;
      }
    }
  }

