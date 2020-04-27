import 'package:flutter/material.dart';
import 'package:pasture_manager/views/widgets/pasture/pasture-item.widget.dart';

class PastureList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Theme.of(context).cardColor,
        //margin: EdgeInsets.all(10),
        child: ListView(
        
          children: <Widget>[
            PastureItem(),
            PastureItem(),
          ],
          ),
    );
  }
}