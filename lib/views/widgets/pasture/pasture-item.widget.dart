import 'package:flutter/material.dart';
import 'package:pasture_manager/db/DatabasePM.dart';

import 'package:pasture_manager/views/components/Tags/repose-Tag.dart';

class PastureItem extends StatefulWidget {
  final Pasture model;

  PastureItem({@required this.model});

  @override
  _PastureItemState createState() => _PastureItemState();
}

class _PastureItemState extends State<PastureItem> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      margin: EdgeInsets.only(top: 18,  left: 15, right: 15),
      
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
       
        boxShadow: [
          new BoxShadow(
            color: Color(0xFFD2D2D2),
            offset: new Offset(0,3),
            blurRadius: 3,
            spreadRadius: 1,
          )
          
        ],
       borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: Row(
        children: <Widget>[
         Column(
             children: <Widget>[ 
               Container(
                 padding: EdgeInsets.only(left: 10),
                  width:190, 
                 //color: Theme.of(context).accentColor,
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[  
                    ReposeTag(),//-TAG
                     Text('${widget.model.pastureName}', style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),),
                     Text('${widget.model.area}', style: TextStyle(fontSize: 14),)

                   ],),
                ),
               ],
          ),

           Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
             children: <Widget>[ 
               Container(
                  padding: EdgeInsets.all(12),
                  height: 90,
                  width:190,
                  child: 
                  Align(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      Icons.supervisor_account,
                      color: Colors.green,
                      size: 70.0,
                      semanticLabel: 'Text to announce in accessibility modes',
                    ),
                  ),
                  
                
                  //color: Colors.amber,
                
                
                 
               ),

           
                            
               ],
          ),
        ],
      ),
      );
      
    
  }
}