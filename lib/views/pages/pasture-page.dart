import 'package:flutter/material.dart';
import 'package:load/load.dart';
import 'package:pasture_manager/db/DatabasePM.dart';
import 'package:pasture_manager/home.dart';
import 'package:pasture_manager/model/pasture.model.dart';
import 'package:pasture_manager/themes/app.themes.dart';
import 'package:pasture_manager/views/components/button.widget.dart';
import 'package:pasture_manager/views/widgets/management/management.widget.dart';
import 'package:uuid/uuid.dart';

import '../../settings.dart';

class PasturePage extends StatefulWidget {
  final Farm farm;
 
  PasturePage({@required this.farm});
  @override
  _PasturePageState createState() => _PasturePageState();
}

class _PasturePageState extends State<PasturePage> {
  
  GlobalKey<FormState> _formkey = new GlobalKey();
 final _scoffoldKey = GlobalKey<ScaffoldState>();
  var _pastureForm = new PastureModel();


  String grassType;
  String vigor;
  String port;
  var uuid = Uuid();

  @override
  Widget build(BuildContext context) {
    // ignore: missing_return
    var x = (value) {
      if (value.isEmpty) return 'O campo Nome do pasto deve ser preenchido!';
    };
    var validator2 = x;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        iconTheme: IconThemeData(color: primaryColor),
        title: Text(
          'Cadastrar Pasto',
          style: TextStyle(color: primaryColor, fontSize: 26),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          //margin: EdgeInsets.all(30),
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formkey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: 'Nome do pasto'),
                  validator: validator2,
                  onSaved: (val) {
                    setState(() {
                      _pastureForm.pastureName = val;
                    });
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Tamanho da área do pasto',
                  ),
                  // ignore: missing_return
                  validator: (value) {
                    if (value.isEmpty)
                      return 'O campo área do pasto deve ser preenchido!';
                  },
                  onSaved: (String val) {
                    setState(() {
                      _pastureForm.area = double.parse(val);
                    });
                  },
                ),
                DropdownButtonFormField(
                  hint: Text('Selecione o tipo do capim'),
                  value: _pastureForm.grassType,
                  items: [
                    DropdownMenuItem<String>(
                      child: Text('Brachiaria'),
                      value: '1',
                    ),
                    DropdownMenuItem<String>(
                      child: Text('Xaraés'),
                      value: '2',
                    ),
                    DropdownMenuItem<String>(
                      child: Text('Piatã'),
                      value: '3',
                    ),
                    DropdownMenuItem<String>(
                      child: Text('Mavuno'),
                      value: '4',
                    ),
                    DropdownMenuItem<String>(
                      child: Text('Convert'),
                      value: '5',
                    ),
                    DropdownMenuItem<String>(
                      child: Text('Marandu'),
                      value: '6',
                    ),
                    DropdownMenuItem<String>(
                      child: Text('Decumbens'),
                      value: '7',
                    ),
                    DropdownMenuItem<String>(
                      child: Text('Massai'),
                      value: '8',
                    ),
                    DropdownMenuItem<String>(
                      child: Text('Tamani'),
                      value: '9',
                    ),
                    DropdownMenuItem<String>(
                      child: Text('Mombaça'),
                      value: '10',
                    ),
                    DropdownMenuItem<String>(
                      child: Text('Tanzânia'),
                      value: '11',
                    ),
                    DropdownMenuItem<String>(
                      child: Text('Zuri'),
                      value: '12',
                    ),
                    DropdownMenuItem<String>(
                      child: Text('Paredão'),
                      value: '13',
                    ),
                    DropdownMenuItem<String>(
                      child: Text('Miage'),
                      value: '14',
                    ),
                  ],
                  validator: (value) =>
                      value == null ? 'Selecione o tipo do capim' : null,
                  onChanged: (val) {
                    setState(() {
                      grassType = val;
                    });
                  },
                ),
                DropdownButtonFormField(
                  hint: Text('Selecione o vigor do capim '),
                  value: _pastureForm.vigor,
                  items: [
                    DropdownMenuItem<String>(
                      child: Text('Baixo'),
                      value: '1',
                    ),
                    DropdownMenuItem<String>(
                      child: Text('Médio'),
                      value: '2',
                    ),
                    DropdownMenuItem<String>(
                      child: Text('Alto'),
                      value: '3',
                    ),
                  ],
                  validator: (value) =>
                      value == null ? 'Selecione o vigor do capim' : null,
                  onChanged: (val) {
                    setState(() {
                      vigor = val;
                    });
                  },
                ),
                DropdownButtonFormField(
                  hint: Text('Selecione o porte do capim'),
                  value: _pastureForm.port,
                  items: [
                    DropdownMenuItem<String>(
                      child: Text('Médio'),
                      value: '1',
                    ),
                    DropdownMenuItem<String>(
                      child: Text('Grande'),
                      value: '2',
                    ),
                  ],
                  validator: (value) =>
                      value == null ? 'Selecione o porte do capim' : null,
                  onChanged: (val) {
                    setState(() {
                      port = val;
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Descrição'),
                  onSaved: (String val) {
                    setState(() {
                      _pastureForm.descriptionText = val;
                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Center(
                      child: PMButton(
                    text: 'Cadastrar Pasto',
                    callBack: () {
                      showLoadingDialog();
                      if (_formkey.currentState.validate()) {
                        _formkey.currentState.save();

                        DatabasePM.instance.pastureDAO.addPasture(Pasture(
                          id: uuid.v4().toString(),
                          pastureName: _pastureForm.pastureName,
                          area: _pastureForm.area,
                          descriptionText: _pastureForm.descriptionText,
                          farmId: widget.farm.id,
                          grassType: int.parse(grassType),
                          port: int.parse(port),
                          vigor: int.parse(vigor),
                        ));
                        //hideLoadingDialog();
                        //Navigator.pop(context);
                       _showDialog(context);
                       
                      }

                      ///Pasture(id:uuid.v4().toString(), pastureName: '1', area: 220.98, descriptionText: 'teste', grassType: 'folha', port: 'grande', vigor: "dsadsa", syncData: false)
                    },
                    width: double.infinity,
                  )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
void _showDialog(BuildContext context) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Pasto salvo com sucesso!"),
         // content: new Text("Alert Dialog body"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            FlatButton(
              child: new Text("OK", style: TextStyle(color: Colors.red),),
              onPressed: () {
                 Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Management(farm: widget.farm)),
                );
              },
            ),
                        
          ],
        );
      },
    );
  }
  
}

