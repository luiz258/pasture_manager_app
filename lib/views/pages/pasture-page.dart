import 'package:flutter/material.dart';
import 'package:pasture_manager/themes/app.themes.dart';
import 'package:pasture_manager/views/components/button.widget.dart';

class PasturePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: primaryColor),
        title: Text("Adcionar novo pasto", style: TextStyle(color: primaryColor, fontSize: 26),),
        backgroundColor: backgroundColor,
      ),
      body: Container(
        //margin: EdgeInsets.all(30),
        padding: const EdgeInsets.all(20.0),
        child: Form(
          child: Column(
            children: <Widget>[
              
             TextFormField(
                decoration: InputDecoration(
                  labelText: 'Nome do pasto'
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Tamanho da área do pasto'
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Tipo do capim'
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Descrição'
                ),
              ),
               Padding(
                 padding: const EdgeInsets.all(40.0),
                 child: Center(child: PMButton( text:'ssas', callBack: (){}, width: double.infinity, )),
               ),
            ],
          ),
        ),
      ),

    );
  }
}