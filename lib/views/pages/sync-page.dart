import 'package:flutter/material.dart';
import 'package:pasture_manager/bloc/evaluation.bloc.dart';
import 'package:pasture_manager/bloc/pasture.bloc.dart';
import 'package:pasture_manager/bloc/sync.bloc.dart';
import 'package:pasture_manager/db/DatabasePM.dart';
import 'package:pasture_manager/views/components/button.widget.dart';
import 'package:provider/provider.dart';

class SyncPage extends StatefulWidget {
  bool pastureDataSync = false;
  @override
  _SyncPageState createState() => _SyncPageState();
}



class _SyncPageState extends State<SyncPage> {
  @override
  Widget build(BuildContext context) {
    final SyncBloc bloc = Provider.of<SyncBloc>(context);
      final PastureBloc blocPas = Provider.of<PastureBloc>(context);
       final  blocEva = EvaluationBloc();
    return Scaffold(
      appBar: AppBar(title: Text('Sincronização de Dados'),),
      body: Container(
        child: Column(
          children: <Widget>[
            
        bloc.pasturelength == null || bloc.pasturelength > bloc.dbpasturelength ? Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: PMButton(
                  text: 'Sincronizar dados do pasto',
                  width: 400,
                  color: Colors.blue,
                  callBack: () {
                    blocPas.sincronozarPasto();
                  },
                ),  
              ),
            ) : Container(child: Padding(
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
                    blocEva.syncEvaluation();
                  },
                ),
              ),
            ),
             Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: PMButton(
                  color: Colors.green,
                  text: 'Baixar dados do Pasto',
                  width: 400,
                  callBack: () {
                    // bloc.sincronozarPasto();
                  },
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
  

}

