import 'package:flutter/material.dart';
import 'package:load/load.dart';
import 'package:pasture_manager/bloc/account.bloc.dart';
import 'package:pasture_manager/bloc/farm.bloc.dart';
import 'package:pasture_manager/db/DatabasePM.dart';
import 'package:pasture_manager/home.dart';
import 'package:pasture_manager/model/farm.model.dart';
import 'package:pasture_manager/settings.dart';
import 'package:pasture_manager/themes/app.themes.dart';
import 'package:pasture_manager/views/components/button.widget.dart';

import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class FarmPage extends StatefulWidget {
  final Farm farm;
  FarmPage({this.farm});

  @override
  _FarmPageState createState() => _FarmPageState();
}

class _FarmPageState extends State<FarmPage> {
  var uuid = Uuid();
  final _scoffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> _formkey = new GlobalKey();
  ////var load = AccountBloc().loadUser()
  var _farmForm = new FarmModel();
  @override
  void initState() {
    // TODO: implement initState
    widget.farm == null ? _farmForm.uf : _farmForm.uf = widget.farm.uf;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<String>> _ufItem = [
      DropdownMenuItem<String>(
        child: Text('Acre (AC)'),
        value: 'AC',
      ),
      DropdownMenuItem<String>(
        child: Text('Alagoas (AL)'),
        value: 'AL',
      ),
      DropdownMenuItem<String>(
        child: Text('Amapá (AP)'),
        value: 'AP',
      ),
      DropdownMenuItem<String>(
        child: Text('Amazonas (AM)'),
        value: 'AM',
      ),
      DropdownMenuItem<String>(
        child: Text('Bahia (BA)'),
        value: 'BA',
      ),
      DropdownMenuItem<String>(
        child: Text('Ceará (CE)'),
        value: 'CE',
      ),
      DropdownMenuItem<String>(
        child: Text('Distrito Federal (DF)'),
        value: 'DF',
      ),
      DropdownMenuItem<String>(
        child: Text('Espírito Santo (ES)'),
        value: 'ES',
      ),
      DropdownMenuItem<String>(
        child: Text('Goiás (GO)'),
        value: 'GO',
      ),
      DropdownMenuItem<String>(
        child: Text('Maranhão (MA)'),
        value: 'MA',
      ),
      DropdownMenuItem<String>(
        child: Text('Mato Grosso (MT)'),
        value: 'MT',
      ),
      DropdownMenuItem<String>(
        child: Text('Mato Grosso do Sul (MS)'),
        value: 'MS',
      ),
      DropdownMenuItem<String>(
        child: Text('Minas Gerais (MG)'),
        value: 'MG',
      ),
      DropdownMenuItem<String>(
        child: Text('Pará (PA)'),
        value: 'PA',
      ),
      DropdownMenuItem<String>(
        child: Text('Paraíba (PB)'),
        value: 'PB',
      ),
      DropdownMenuItem<String>(
        child: Text('Paraná (PR)'),
        value: 'PR',
      ),
      DropdownMenuItem<String>(
        child: Text('Pernambuco (PE)'),
        value: 'Pernambuco (PE)',
      ),
      DropdownMenuItem<String>(
        child: Text('Piauí (PI)'),
        value: 'PI',
      ),
      DropdownMenuItem<String>(
        child: Text('Rio de Janeiro (RJ)'),
        value: 'RJ',
      ),
      DropdownMenuItem<String>(
        child: Text('Rio Grande do Sul (RS)'),
        value: 'RS',
      ),
      DropdownMenuItem<String>(
        child: Text('Rio Grande do Norte (RN)'),
        value: 'RN',
      ),
      DropdownMenuItem<String>(
        child: Text('Rondônia (RO)'),
        value: 'RO',
      ),
      DropdownMenuItem<String>(
        child: Text('Roraima (RR)'),
        value: 'RR',
      ),
      DropdownMenuItem<String>(
        child: Text('Santa Catarina (SC)'),
        value: 'SC',
      ),
      DropdownMenuItem<String>(
        child: Text('São Paulo (SP)'),
        value: 'SP',
      ),
      DropdownMenuItem<String>(
        child: Text('Sergipe (SE)'),
        value: 'SE',
      ),
      DropdownMenuItem<String>(
        child: Text('Tocantins (TO)'),
        value: 'TO',
      )
    ];

    final AccountBloc bloc = Provider.of<AccountBloc>(context);
    bloc.loadUser();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text('Fazendas'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formkey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Nome da fazenda',
                  ),
                  initialValue: widget.farm?.farmName,
                  onChanged: (value) {
                    _farmForm.farmName = value;
                  },
                  // ignore: missing_return
                  validator: (value) {
                    if (value.isEmpty)
                      return 'O campo Cidade deve ser preenchido!';
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Cnpj/Cpf',
                  ),
                  initialValue: widget.farm?.document,
                  // ignore: missing_return
                  validator: (value) {
                    if (value.isEmpty)
                      return 'O campo Cnpj/Cpf deve ser preenchido!';
                  },
                  onSaved: (value) {
                    _farmForm.document = value;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Area da fazenda',
                  ),

                  // ignore: missing_return
                  validator: (value) {
                    if (value.isEmpty)
                      return 'O campo Area da fazenda deve ser preenchido!';
                  },
                  initialValue:
                    widget.farm?.area?.toString(),
                  onSaved: (value) {
                    _farmForm.area = double.parse(value);
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Endereço',
                  ),
                  initialValue: widget.farm?.farmAddress,
                  // ignore: missing_return
                  validator: (value) {
                    if (value.isEmpty)
                      return 'O campo Endereço deve ser preenchido!';
                  },
                  onSaved: (value) {
                    _farmForm.farmAddress = value;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Cidade',
                  ),
                  initialValue: widget.farm?.city,
                  // ignore: missing_return
                  validator: (value) {
                    if (value.isEmpty)
                      return 'O campo Cidade deve ser preenchido!';
                  },
                  onSaved: (value) {
                    setState(() {
                      _farmForm.city = value;
                    });
                  },
                ),
                DropdownButtonFormField(
                  hint: Text('Selecione o seu estado'),
                  value: _farmForm.uf,
                  items: _ufItem,
                  validator: (value) =>
                      value == null ? 'Selecione o seu estado' : null,
                  onChanged: (val) {
                    setState(() {
                      widget.farm == null
                          ? _farmForm.uf = val
                          : _farmForm.uf = widget.farm.uf;
                    });
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                PMButton(
                    text: 'Salvar',
                    callBack:(){
                     if (!_formkey.currentState.validate()) {
                        return;
                      }

                      _formkey.currentState.save();
                     

                      if (widget.farm == null) {
                         addFarm(context);
                      } else{
                        updateFarm(context);
                        }
                    }, 
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  addFarm(BuildContext context) async {
    var bloc = Provider.of<FarmBloc>(context, listen: false);
    var blocUser = Provider.of<AccountBloc>(context, listen: false);
    blocUser.loadUser();
    showLoadingDialog();
    var farm = await bloc.addFarm(
      FarmModel(
        id: uuid.v4().toString(),
        area: _farmForm.area,
        city: _farmForm.city,
        document: _farmForm.document,
        farmAddress: _farmForm.farmAddress,
        farmName: _farmForm.farmName,
        uf: _farmForm.uf,
        userId : Settings.user.id ,
      ),
    );

    if (farm.id != null) {
    print('aqui fazer ${farm}');

      Farm entity = new Farm(
        id: farm.id,
        area: _farmForm.area,
        city: _farmForm.city,
        document: _farmForm.document,
        farmAddress: _farmForm.farmAddress,
        farmName: _farmForm.farmName,
        uf: _farmForm.uf,
        userId: Settings.user.id,
      );
      await DatabasePM.instance.farmDAO.addFArm(entity);
      print('aqui fazer ${farm}');
      hideLoadingDialog();
 


   Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );



      return;
    }
 hideLoadingDialog();
     final snackBar = SnackBar(content: Text('Erro: ${farm}'));
    _scoffoldKey.currentState.showSnackBar(snackBar);
  }

    updateFarm(BuildContext context) async {
    var bloc = Provider.of<FarmBloc>(context, listen: false);
    var blocUser = Provider.of<AccountBloc>(context, listen: false);
    blocUser.loadUser();
    showLoadingDialog();
    var farm = await bloc.editFarm(
      FarmModel(
        id: widget.farm.id,
        area: _farmForm.area,
        city: _farmForm.city,
        document: _farmForm.document,
        farmAddress: _farmForm.farmAddress,
        farmName: _farmForm.farmName,
        uf: _farmForm.uf,
        userId: Settings.user.id,
      ),
    );

    if (farm != null) {
         Farm entity = new Farm(
        id: widget.farm.id,
        area: _farmForm.area,
        city: _farmForm.city,
        document: _farmForm.document,
        farmAddress: _farmForm.farmAddress,
        farmName: _farmForm.farmName,
        uf: _farmForm.uf,
        userId: Settings.user.id,
      );
      await DatabasePM.instance.farmDAO.updateFarm(entity);
      hideLoadingDialog();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );

      hideLoadingDialog();
      return;
    }

    hideLoadingDialog();
     final snackBar = SnackBar(content: Text('Erro: ${farm.menssagem}'));
    _scoffoldKey.currentState.showSnackBar(snackBar);
    // final snackBar = SnackBar(content: Text('Usuário ou senha invalidos'));
    // _scoffoldKey.currentState.showSnackBar(snackBar);
  }
}
