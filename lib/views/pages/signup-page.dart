import 'package:flutter/material.dart';
import 'package:pasture_manager/themes/app.themes.dart';

class Signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        
      ),
      body: Container(
        height: double.infinity,
        color: backgroundColor,
        child: SingleChildScrollView(
          child: Column(
            
            children: <Widget>[
              SizedBox(height: 50,),  

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
              SizedBox(height: 50,),
             
              
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
                 
                
                  margin: EdgeInsets.all(20),
                  height: 390,
                  width: 500,
                  
                  child: Column(
                    children: <Widget>[
                    Text('Crie uma nova conta',
                    style: TextStyle(
                      fontSize: 28,),
                    ),
                    TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email'
                    ),
                  ),
                  SizedBox(height: 5,),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Senha'
                    ),
                  ),
                  SizedBox(height: 5,),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Nome'
                    ),
                  ),
                  SizedBox(height: 5,),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Telefone'
                    ),
                  ),
                   SizedBox(height: 50,),
                  Container(
                    width: 300,
                    height: 45,
                    child: RaisedButton(
                      color:  Theme.of(context).primaryColor,
                      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(8.0)),
                      child: Text('Salvar',
                      style: TextStyle(
                        color: backgroundColor,
                        fontSize: 20       
                      ),
                      ), 
                      onPressed: () {},
                    ),
                  ),
                 
                  // Container(
                  //   width: 300,
                  //   height: 45,
                  //   child: RaisedButton(
                  //     color:  backgroundColor,
                  //     shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(5.0)),
                  //     child: Text('Faça sua conta agora!',
                  //       style: TextStyle(
                  //         //color: backgroundColor,
                  //         fontSize: 18       
                  //       ),
                  //     ), 
                  //     onPressed: () {},
                  //   ),
                  // ),
                  ],
                  
                  ),
                ),
              )
              
            ],
          ),
        ),
      ),
    );
  }
  }
