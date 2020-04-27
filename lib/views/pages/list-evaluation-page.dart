import 'package:flutter/material.dart';
import 'package:pasture_manager/themes/app.themes.dart';
import 'package:pasture_manager/views/components/button.widget.dart';
import 'package:pasture_manager/views/widgets/evaluation/evaluation-item.widget.dart';

class ListEvaluationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
        backgroundColor: backgroundColor,
        iconTheme: IconThemeData(color: primaryColor),
        title: Text('Avaliações',  style: TextStyle(color: primaryColor, fontSize: 26),),
        ),
    body: Container(
      
      child: ListView(
        
        children: <Widget>[
          EvaluationItem(),
          EvaluationItem(),
          EvaluationItem(),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: PMButton(text: 'Sincronizar', callBack: ()
            {},),
          )
        ],
        
        ),
        
    ),
  );
  }
}