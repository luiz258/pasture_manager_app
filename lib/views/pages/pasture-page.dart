import 'package:flutter/material.dart';
import 'package:pasture_manager/db/DatabasePM.dart';
import 'package:pasture_manager/model/pasture.model.dart';
import 'package:pasture_manager/settings.dart';
import 'package:pasture_manager/themes/app.themes.dart';
import 'package:pasture_manager/views/components/button.widget.dart';
import 'package:uuid/uuid.dart';

class PasturePage extends StatefulWidget {
  @override
  _PasturePageState createState() => _PasturePageState();
}

class _PasturePageState extends State<PasturePage> {
  ///final _formkey = GlobalKey<FormState>();
  GlobalKey<FormState> _formkey = new GlobalKey();
 ////var load = AccountBloc().loadUser()
  var _pastureForm = new PastureModel();

  var uuid = Uuid();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        iconTheme: IconThemeData(color: primaryColor),
        title: Text(
          'Fazer Avaliação',
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
                  validator: (value) {
                    if (value.isEmpty)
                      return 'O campo Nome do pasto deve ser preenchido!';
                  },
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
                  validator: (value){
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
                      child: Text('Item 1'),
                      value: '1',
                    ),
                    DropdownMenuItem<String>(
                      child: Text('Item 1'),
                      value: '2',
                    ),
                    DropdownMenuItem<String>(
                      child: Text('Item 1'),
                      value: '3',
                    ),
                  ],
                  validator: (value) =>
                      value == null ? 'Selecione o tipo do capim' : null,
                  onChanged: (val) {
                    setState(() {
                      _pastureForm.grassType =  val;
                    });
                  },
                ),
                DropdownButtonFormField(
                  hint: Text('Selecione o vigor do capim '),
                  value: _pastureForm.vigor,
                  items: [
                    DropdownMenuItem<String>(
                      child: Text('Item 1'),
                      value: '1',
                    ),
                    DropdownMenuItem<String>(
                      child: Text('Item 1'),
                      value: '2',
                    ),
                    DropdownMenuItem<String>(
                      child: Text('Item 1'),
                      value: '3',
                    ),
                  ],
                  validator: (value) =>
                      value == null ? 'Selecione o vigor do capim' : null,
                  onChanged: (val) {
                    setState(() {
                      _pastureForm.vigor = val;
                    });
                  },
                ),
                DropdownButtonFormField(
                  hint: Text('Selecione o porte do capim'),
                  value: _pastureForm.port,
                  items: [
                    DropdownMenuItem<String>(
                      child: Text('Item 1'),
                      value: '1',
                    ),
                    DropdownMenuItem<String>(
                      child: Text('Item 1'),
                      value: '2',
                    ),
                    DropdownMenuItem<String>(
                      child: Text('Item 1'),
                      value: '3',
                    ),
                  ],
                  validator: (value) =>
                      value == null ? 'Selecione o porte do capim' : null,
                  onChanged: (val) {
                    setState(() {
                      _pastureForm.port = val;
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Descrição'),
                  validator: (value) {
                    if (value.isEmpty)
                      return 'O campo Descrição deve ser preenchido!';
                  },
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
                      print('${Settings.user} ------------------');
                      if (_formkey.currentState.validate()) {
                        _formkey.currentState.save();

                        /// print(_formkey);

                        DatabasePM.instance.pastureDAO.addPasture(
                         
                          Pasture(
                          id: uuid.v4().toString(),
                          pastureName: _pastureForm.pastureName,
                          area: _pastureForm.area,
                          descriptionText: _pastureForm.descriptionText,
                          farmId: Settings.user.farmId,
                          grassType: _pastureForm.grassType,
                          port: _pastureForm.port,
                          vigor: _pastureForm.vigor

                        ));
                        Navigator.pop(context);
                        print(_pastureForm);
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
}
