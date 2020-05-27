import 'package:flutter/material.dart';
import 'package:pasture_manager/bloc/account.bloc.dart';
import 'package:pasture_manager/model/authenticate-user.model.dart';
import 'package:pasture_manager/settings.dart';
import 'package:pasture_manager/themes/app.themes.dart';
import 'package:pasture_manager/views/pages/pasture-page.dart';
import 'package:pasture_manager/views/pages/signup-page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../home.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
    var  _authForm = AuthenticateModel();
    final _scoffoldKey = GlobalKey<ScaffoldState>();
    final _formKey = GlobalKey<FormState>();
      var email = '';
      var password = '';


 
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      key: _scoffoldKey,
      body: Form(
        key: _formKey,
        child: Container(
          height: double.infinity,
          color: backgroundColor,
          child: SingleChildScrollView(
            
           
            child: Column(
              
              children: <Widget>[
                SizedBox(height: 140,),  

                Container(
                  //padding: EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                        Image.asset('assets/leaf.png'),
                         Text(
                          'UCP', 
                          style: TextStyle( 
                            fontSize: 54 ,
                            fontStyle: FontStyle.italic ,
                            fontWeight: FontWeight.bold ,
                            color: Theme.of(context).primaryColor)
                            ),
                        ],
                      ),
                      Text('Uso correto da da pastagem',
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic ,
                      )
                      ),

                    ],
                  ),
                ),      
                SizedBox(height: 70,),
               
                
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
                  child:Container(
                    child: Container(
                      margin: EdgeInsets.all(20),
                      height: 340,
                      
                      width: 500,
                      
                      child: Column(
                        children: <Widget>[
                      Text('Fazer login',
                        style: TextStyle(fontSize: 22),
                      ),  
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Email'
                        ),
                        validator: (value){
                          if(value.isEmpty) return 'O campo Email deve ser preenchido!';
                        },
                        onSaved: (value){
                          email = value;
                        },
                      ),
                      SizedBox(height: 5,),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Senha'
                        ),
                        validator: (value){
                          if(value.isEmpty) return 'O campo Senha deve ser preenchido!';
                         
                        },
                        onSaved: (value){
                          password = value;
                        },
                      ),
                      SizedBox(height: 45,),
                      Container(
                        width: 300,
                        height: 35,
                        child: RaisedButton(
                          color:  Theme.of(context).primaryColor,
                          shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(8.0)),
                          child: Text('Entrar',
                          style: TextStyle(
                            color: backgroundColor,
                            fontSize: 18       
                          ),
                          ), 
                          onPressed: () {
                            
                            if(_formKey.currentState.validate()){
                              _formKey.currentState.save();
                              authenticate(context);
                              
                            }
                         
                          },
                        ),
                      ),
                      SizedBox(height: 15,),
                      Container(
                        width: 300,
                        height: 45,
                        child: RaisedButton(
                          color:  backgroundColor,
                          shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(8.0)),
                          child: Text('Faça sua conta agora!',
                            style: TextStyle(
                              //color: backgroundColor,
                              fontSize: 18       
                            ),
                          ), 
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Signup()),
                            );
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

  authenticate(BuildContext context) async{

     
     var bloc = Provider.of<AccountBloc>(context, listen: false);

     var user = await bloc.authenticate(
       AuthenticateModel(
        email: email,
        passwordHash: password,
      ),
    );
    
    if (user != null) { 
    //print(user)
     Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
      return;
    }

    final snackBar = SnackBar(content: Text('Usuário ou senha invalidos'));
    _scoffoldKey.currentState.showSnackBar(snackBar);
    

   
  }


}