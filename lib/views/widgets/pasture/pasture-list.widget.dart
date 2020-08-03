import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:pasture_manager/bloc/pasture.bloc.dart';
import 'package:pasture_manager/db/DatabasePM.dart';
import 'package:pasture_manager/model/last-review-by-pasto.dart';
import 'package:pasture_manager/repositories/pasture.repository.dart';
import 'package:pasture_manager/themes/app.themes.dart';
import 'package:pasture_manager/views/pages/evaluation-page.dart';
import 'package:pasture_manager/views/pages/pasture-page.dart';
import 'package:pasture_manager/views/widgets/pasture/pasture-item.widget.dart';
import 'package:uuid/uuid.dart';

// ignore: must_be_immutable
class PastureList extends StatefulWidget {
   Farm farm;

  PastureList({@required this.farm});

  @override
  _PastureListState createState() => _PastureListState();
}

class _PastureListState extends State<PastureList> {
 
  var uuid = Uuid();
  var bloc = new PastureBloc();
  final _repository = new PastureRepository();
  @override
  Widget build(BuildContext context) {
    //  DatabasePM.instance.pastureDAO.addPasture(Pasture(id:uuid.v4().toString(), pastureName: '1', area: 220.98, descriptionText: 'teste', grassType: 'folha', port: 'grande', vigor: "dsadsa", syncData: false));

    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(height: 16,),
          Container(child: Center(child: Text('${widget.farm.farmName.toUpperCase()}', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400, ),),),),
          Container(
            height: 620,
     
            child: FutureBuilder<List<LastReviewByPasto>>(
              future: _repository.getListLastReviewByPast(widget.farm.id),
              // ignore: missing_return
              builder: (context, snapshot) {
                if (!snapshot.hasData) return Container();

                List<LastReviewByPasto> pasture = snapshot.data;

        switch(snapshot.connectionState){
          case ConnectionState.none:
            return Text('Aguardando...' , style: TextStyle(color:  Colors.blueGrey),);
          case ConnectionState.active:
           return Center(
              child: CircularProgressIndicator( backgroundColor: Colors.blueGrey,),
            );
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator( backgroundColor: Colors.blueGrey,),
            );
          case ConnectionState.done:
            if (snapshot.hasError)
              return Center(
                child: Text("Não foi possível obter o produto", style: TextStyle(color:  Colors.blueGrey,),),
              );
                return ListView.builder(
                  itemCount: pasture.length,
                  itemBuilder: (BuildContext context, int index) {
                    return PastureItem(
                      model: pasture[index],
                    );
                  },
                );
                           
      }
              },
            ),
            
          )
        ],
      ),
      
    );
  }
}
