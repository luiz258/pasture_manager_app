import 'package:flutter/material.dart';
import 'package:pasture_manager/themes/app.themes.dart';

class EvaluationItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color:backgroundColor,
      child: ListTile(
        title:Text('Pasto 1'),
        subtitle: Text('12/04/2020'),
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