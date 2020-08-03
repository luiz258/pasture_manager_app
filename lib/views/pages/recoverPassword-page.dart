import 'package:flutter/material.dart';
import 'package:load/load.dart';
import 'package:pasture_manager/bloc/account.bloc.dart';
import 'package:pasture_manager/model/recover-user.model.dart';
import 'package:pasture_manager/themes/app.themes.dart';
import 'package:pasture_manager/views/pages/login-page.dart';



class RecoverPassword extends StatefulWidget {
  @override
  _RecoverPasswordState createState() => _RecoverPasswordState();
}

class _RecoverPasswordState extends State<RecoverPassword> {
  var _userForm = new RecoverPasswordModel();
  final _scoffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  var bloc = new AccountBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scoffoldKey,
      appBar: AppBar(),
      body: Form(
        key: _formKey,
        child: Container(
          height: double.infinity,
          color: backgroundColor,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 30,
                ),
                Container(
                  //padding: EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset('assets/leaf.png'),
                          Text('UCP',
                              style: TextStyle(
                                  fontSize: 54,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).primaryColor)),
                        ],
                      ),
                      Text('Uso correto da da pastagem',
                          style: TextStyle(
                            color: primaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.italic,
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    //border:  Border.all(width: 1.0, color:primaryColor),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[400].withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  margin: EdgeInsets.only(left: 45, right: 45),
                  child: Container(
                    margin: EdgeInsets.all(20),
                    height: 200,
                    width: 500,
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Recupera email',
                            style: TextStyle(
                              fontSize: 28,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            decoration: InputDecoration(labelText: 'Email'),
                            onSaved: (value) {
                              _userForm.email = value;
                            },
                            // ignore: missing_return
                            validator: (value) {
                              if (value.isEmpty)
                                return 'O campo Email deve ser preenchido!';
                            },
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Container(
                            width: 300,
                            height: 45,
                            child: RaisedButton(
                              color: Theme.of(context).primaryColor,
                              shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(8.0)),
                              child: Text(
                                'Salvar',
                                style: TextStyle(
                                    color: backgroundColor, fontSize: 20),
                              ),
                              onPressed: () {
                                if (_formKey.currentState.validate()) {
                                  _formKey.currentState.save();
                                  recover(context);
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  recover(BuildContext context) async {
    showLoadingDialog();
    var user = await bloc.recoverAccount(
      RecoverPasswordModel(
        email: _userForm.email,
   
      ),
    );
    if (user != null) {
      //print(user)
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );

      hideLoadingDialog();

      final snackBar =
          SnackBar(content: Text('Sua nova senha foi enviado no seu email!'));
      _scoffoldKey.currentState.showSnackBar(snackBar);
      return;
    }

    hideLoadingDialog();
    final snackBar = SnackBar(content: Text('Email invalidos'));
    _scoffoldKey.currentState.showSnackBar(snackBar);
  }
}
