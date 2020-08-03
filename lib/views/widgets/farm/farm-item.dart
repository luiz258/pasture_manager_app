import 'package:flutter/material.dart';
import 'package:pasture_manager/db/DatabasePM.dart';
import 'package:pasture_manager/themes/app.themes.dart';
import 'package:pasture_manager/views/widgets/farm/farm-page.dart';
import 'package:pasture_manager/views/widgets/management/management.widget.dart';

class FarmItem extends StatefulWidget {
  final Farm model;

  FarmItem({@required this.model});
  @override
  _FarmItemState createState() => _FarmItemState();
}

class _FarmItemState extends State<FarmItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Management(
                farm: widget.model,
              ),
            ),
          );
        },
        title: Text('${widget.model.farmName} '),
       

        leading: Icon(Icons.panorama, size: 50.0, color: Colors.green),

        trailing: IconButton(
          icon: Icon(Icons.mode_edit, size: 30, color: Colors.blueGrey),
          tooltip: 'Alterar data',
          onPressed: () {
            //_showDialog();
            Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FarmPage(
                farm: widget.model,
              ),
            ),
          ); 
          },
        ),
      ),
    );
  }
}
