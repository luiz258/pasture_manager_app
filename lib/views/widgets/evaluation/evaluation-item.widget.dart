import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pasture_manager/db/dao/Evaluation/EvaluationDAO.dart';
import 'package:pasture_manager/themes/app.themes.dart';

class EvaluationItem extends StatelessWidget {
final EvaluationWithNamePasture model;
  final _dataFormat = new DateFormat('dd/MM/yyyy');
  EvaluationItem({@required this.model});
  
  
  @override
  Widget build(BuildContext context) {
    return Card(
      color:backgroundColor,
      child: ListTile(
        title:Text('${model.pasture1.pastureName}'),
        subtitle: Text('${_dataFormat.format(model.evaluation1.evaluationDate)}'),
         trailing:   
          IconButton(
            icon: Icon(Icons.restore_from_trash, size: 30,color: Colors.red),
            tooltip: 'Alterar data',
            onPressed: () {
            },
          ), 
      ),
    );
  }
}