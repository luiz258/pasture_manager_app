
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:pasture_manager/bloc/pasture.bloc.dart';
import 'package:pasture_manager/db/DatabasePM.dart';
import 'package:pasture_manager/themes/app.themes.dart';
import 'package:pasture_manager/views/components/button.widget.dart';
import 'package:pasture_manager/views/pages/evaluation-page.dart';
import 'package:pasture_manager/views/pages/pasture-page.dart';
import 'package:pasture_manager/views/widgets/pasture/pasture-item.widget.dart';
import 'package:uuid/uuid.dart';

class PastureList extends StatefulWidget {
  @override
  _PastureListState createState() => _PastureListState();
}

class _PastureListState extends State<PastureList> {
  bool dialVisible = true;
  var uuid = Uuid();
  var bloc = new PastureBloc();
  @override
  Widget build(BuildContext context) {
    //  DatabasePM.instance.pastureDAO.addPasture(Pasture(id:uuid.v4().toString(), pastureName: '1', area: 220.98, descriptionText: 'teste', grassType: 'folha', port: 'grande', vigor: "dsadsa", syncData: false));
    var bloc = new PastureBloc();

    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: 670,
            //color: Theme.of(context).cardColor,
            //margin: EdgeInsets.all(10),

            child: StreamBuilder<List<Pasture>>(
              stream: DatabasePM.instance.pastureDAO.listPasture(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return Container();

                List<Pasture> pasture = snapshot.data;
   //print('${Settings.user.farmId} ------------------');
                return ListView.builder(
                  itemCount: pasture.length,
                  itemBuilder: (BuildContext context, int index) {
                    return PastureItem(
                      
                      model: pasture[index],
                    );
                  },
                );
              },
            ),
          ),
      ],
      ),
      floatingActionButton: SpeedDial(
        // both default to 16
        marginRight: 18,
        marginBottom: 20,
        animatedIcon: AnimatedIcons.menu_close,
        animatedIconTheme: IconThemeData(size: 28.0),
        // this is ignored if animatedIcon is non null
        child: Icon(Icons.add),
        visible: dialVisible,
        // If true user is forced to close dial manually
        // by tapping main button and overlay is not rendered.
        closeManually: false,
        curve: Curves.bounceIn,
        overlayColor: Colors.black,
        overlayOpacity: 0.5,

        tooltip: 'Speed Dial',
        heroTag: 'speed-dial-hero-tag',
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        // elevation: 2.0,
        shape: CircleBorder(),
        children: [
          SpeedDialChild(
              child: Icon(Icons.add_comment),
              backgroundColor: Colors.redAccent,
              label: 'Fazer nova avaliação',
              labelStyle: TextStyle(fontSize: 20.0),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EvaluationPage()),
                );
              }),
          SpeedDialChild(
            child: Icon(Icons.add),
            backgroundColor: Colors.blue,
            label: 'Adcionar novo pasto',
            labelStyle: TextStyle(fontSize: 20.0),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PasturePage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
