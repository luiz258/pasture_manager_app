import 'package:flutter/material.dart';
import 'package:pasture_manager/db/DatabasePM.dart';
import 'package:pasture_manager/db/dao/Evaluation/EvaluationDAO.dart';
import 'package:pasture_manager/views/components/button.widget.dart';
import 'package:pasture_manager/views/widgets/evaluation/evaluation-item.widget.dart';

class EvaluationList extends StatefulWidget {
 

  @override
  _EvaluationListState createState() => _EvaluationListState();
}

class _EvaluationListState extends State<EvaluationList> {
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 610,
          //color: Theme.of(context).cardColor,
            //margin: EdgeInsets.all(10),
            child: StreamBuilder<List<EvaluationWithNamePasture>> (
              
            stream: DatabasePM.instance.evaluationDAO.listAllEvaluationPasture(),
            builder: (context, snapshot){
              if( !snapshot.hasData ) return Container();
              
              List<EvaluationWithNamePasture> evaluation = snapshot.data;

              return ListView.builder(
                itemCount: evaluation.length,
                itemBuilder: (BuildContext context, int index){
                  return EvaluationItem(
                    model: evaluation[index],
                    );
                },
                
                
                
                
                );
            },
             
              ),
        ),

        Padding(
            padding: const EdgeInsets.all(10.0),
            child: PMButton(
              text: 'Sincronizar', 
              width: 250,
              
              callBack: (){

              },),
          )

      ],
    );
  
  }

  


}