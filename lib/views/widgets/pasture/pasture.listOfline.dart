import 'package:flutter/material.dart';
import 'package:pasture_manager/db/DatabasePM.dart';
import 'package:pasture_manager/themes/app.themes.dart';

class PastureListOffline extends StatefulWidget {
  final Farm farm;
  PastureListOffline({@required this.farm});

  @override
  _PastureListOfflineState createState() => _PastureListOfflineState();
}

class _PastureListOfflineState extends State<PastureListOffline> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appTheme().primaryColor,
        title: Text('Pasto Salvos Offline'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 620,
            child: StreamBuilder<List<Pasture>>(
                stream: DatabasePM.instance.pastureDAO
                    .listPasturePerFarmId(widget.farm.id),
                // ignore: missing_return
                builder: (context, snapshot) {
                  if (!snapshot.hasData) return Container();

                  List<Pasture> pasture = snapshot.data;

                  return ListView.builder(
                    itemCount: pasture.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: ListTile(
                          leading: Text('Area: ${pasture[index].area}'),
                          title: Text('${pasture[index].pastureName.toUpperCase()}', style: TextStyle(fontSize: 18),),
                          // trailing: IconButton(
                          //   icon: Icon(Icons.edit,
                          //       size: 30, color: Colors.blueGrey),
                          //   tooltip: 'Alterar data',
                          //   onPressed: () {
                          //     //_showDialog();
                          //   },
                          // ),
                        ),
                      );
                    },
                  );
                }),
          )
        ],
      ),
    );
  }
}
