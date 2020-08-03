import 'package:flutter/material.dart';
import 'package:load/load.dart';
import 'package:pasture_manager/bloc/account.bloc.dart';
import 'package:pasture_manager/model/create-user.model.dart';
import 'package:pasture_manager/themes/app.themes.dart';
import 'package:pasture_manager/views/pages/login-page.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {

   var _userForm = CreateUserModel();
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
                    height: 480,
                    width: 500,
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Crie uma nova conta',
                            style: TextStyle(
                              fontSize: 28,
                            ),
                          ),
                          TextFormField(
                            decoration: InputDecoration(labelText: 'Email'),
                            onSaved: (value){
                              _userForm.email = value;
                            },
                            // ignore: missing_return
                            validator: (value){
                              if(value.isEmpty) return 'O campo Email deve ser preenchido!';
                            },
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            decoration: InputDecoration(labelText: 'Senha'),
                            obscureText: true,
                            onSaved: (value){
                              _userForm.password = value;
                            },
                            // ignore: missing_return
                            validator: (value){
                              if(value.isEmpty) return 'O campo Senha deve ser preenchido!';
                            },
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            decoration: InputDecoration(labelText: 'Nome'),
                            onSaved: (value){
                              _userForm.fullName = value;
                            },
                            // ignore: missing_return
                            validator: (value){
                              if(value.isEmpty) return 'O campo Nome deve ser preenchido!';
                            },
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            decoration: InputDecoration(labelText: 'Telefone'),
                            onSaved: (value){
                              _userForm.telephone = value;
                            },
                            // ignore: missing_return
                            validator: (value){
                              if(value.isEmpty) return 'O campo Telefone deve ser preenchido!';
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(labelText: 'Seu cargo'),
                            // ignore: missing_return
                            validator: (value){
                              if(value.isEmpty) return 'O campo Cargo deve ser preenchido!';
                            },
                            onSaved: (value){
                              _userForm.office = value;
                            },
                          ),
                          SizedBox(
                            height: 20,
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
                                style:
                                    TextStyle(color: backgroundColor, fontSize: 20),
                              ),
                              onPressed: () {
                                 
                                   if(_formKey.currentState.validate()){
                                  _formKey.currentState.save();
                                  register(context);
                                
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



  register(BuildContext context) async{
    showLoadingDialog();
    var user  = await bloc.register(
      CreateUserModel(
      email: _userForm.email,
      fullName: _userForm.fullName,
      office: _userForm.office,
      password: _userForm.password,
      roleId: "Pecuarista",
      telephone: _userForm.telephone,        
    ),
  );
if (user != null ) { 
   
    //print(user)
     Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
      
    );
     hideLoadingDialog();
      return;
    }

 hideLoadingDialog();
    final snackBar = SnackBar(content: Text('Usuário ou senha invalidos'));
    _scoffoldKey.currentState.showSnackBar(snackBar);
    

  }
}
