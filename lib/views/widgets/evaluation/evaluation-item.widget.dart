import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pasture_manager/db/DatabasePM.dart';
import 'package:pasture_manager/db/dao/Evaluation/EvaluationDAO.dart';
import 'package:pasture_manager/themes/app.themes.dart';

class EvaluationItem extends StatelessWidget {


  
final EvaluationWithNamePasture model;

  final _dataFormat = new DateFormat('dd/MM/yyyy');
  EvaluationItem({@required this.model});
  final String  pastejo ="Pastejo";
  final String descanso = "Descanso";
  

 
  @override
  Widget build(BuildContext context) {
 void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Você deseja excluir essa avaliação?"),
         // content: new Text("Alert Dialog body"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            FlatButton(
              child: new Text("Excluir", style: TextStyle(color: Colors.red),),
              onPressed: () {
                DatabasePM.instance.evaluationDAO.removeEvaluation(model.evaluation1.id);
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: new Text("Cancelar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),

            
          ],
        );
      },
    );
  }


    
    return Card(
      color:backgroundColor,
      child: ListTile(
        title:Text('${model.pasture1.pastureName}'),
        subtitle: Text('Data: ${_dataFormat.format(model.evaluation1.evaluationDate)} / ${int.parse(model.evaluation1.tagPast) == 1 ? descanso : pastejo } '),

        leading: Text('nota: ${model.evaluation1.note}',),
        
         trailing:   
          IconButton(
            icon: Icon(Icons.restore_from_trash, size: 30,color: Colors.red),
            tooltip: 'Alterar data',
            onPressed: () {
            
            _showDialog();
            },
          ), 
      ),
    );
  }
}