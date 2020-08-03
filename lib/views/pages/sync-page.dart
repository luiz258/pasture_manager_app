import 'package:flutter/material.dart';
import 'package:load/load.dart';
import 'package:pasture_manager/bloc/evaluation.bloc.dart';
import 'package:pasture_manager/bloc/pasture.bloc.dart';
import 'package:pasture_manager/bloc/sync.bloc.dart';
import 'package:pasture_manager/db/DatabasePM.dart';
import 'package:pasture_manager/model/pasturelist.model.dart';
import 'package:pasture_manager/repositories/pasture.repository.dart';
import 'package:pasture_manager/views/components/button.widget.dart';
import 'package:provider/provider.dart';


// ignore: must_be_immutable
class SyncPage extends StatefulWidget {
  final Farm farm;
  bool pastureDataSync = false;
  SyncPage({@required this.farm});

  @override
  _SyncPageState createState() => _SyncPageState();
}

class _SyncPageState extends State<SyncPage> {

  
    int pastureLength = 0;

@override
  void setState(fn) {
   showLoadingDialog();
    getData();
    hideLoadingDialog();
     super.setState(fn);
  }
  
  @override
  Widget build(BuildContext context) {
    
   final SyncBloc bloc = Provider.of<SyncBloc>(context);
   bloc.getDbPasture(widget.farm.id);
    final PastureBloc blocPas = Provider.of<PastureBloc>(context);
    final blocEva = EvaluationBloc();
    return Scaffold(
      appBar: AppBar(
        title: Text('Sincronização de Dados'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
             bloc.dbpasturelength > pastureLength 
                ? Container(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: PMButton(
                        text: 'Sincronizar dados do pasto',
                        width: 400,
                        color: Colors.blue,
                        callBack: () {
                          blocPas.sincronozarPasto(widget.farm.id);
                            Navigator.pop(context);
                        },
                      ),
                    ),
                  )
                : Container(
                    child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text('Dados sincronizados'),
                  )),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: PMButton(
                  text: 'Sincronizar dados da Avaliação',
                  width: 400,
                  color: Colors.blue,
                  callBack: () {
                    blocEva.syncEvaluation(widget.farm.id);
                      Navigator.pop(context);
                  },
                ),
              ),
            ),
            // Container(
            //   child: Padding(
            //     padding: const EdgeInsets.all(20.0),
            //     child: PMButton(
            //       color: Colors.green,
            //       text: 'Baixar dados do Pasto',
            //       width: 400,
            //       callBack: () {
            //         // bloc.sincronozarPasto();
            //           Navigator.pop(context);
            //       },
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  getData() async{

  var _repP = new PastureRepository();
   List<PastureListModel> pastures =
     await _repP.getlistPasture(widget.farm.id);
     this.pastureLength = pastures.length;
     print( this.pastureLength);
}

}
