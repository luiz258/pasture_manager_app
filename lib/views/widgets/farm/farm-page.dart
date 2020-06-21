import 'dart:html';

import 'package:flutter/material.dart';

class FarmPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fazendas'),
      ),
    body: Container(
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Nome da fazenda',
            ),
          ),

          TextFormField(
            decoration: InputDecoration(
              labelText: 'Cnpj',
            ),
          ),

          TextFormField(
            decoration: InputDecoration(
              labelText: 'Area Da fazenda',
            ),
          ),
          
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Endereço',
            ),
          ),

          TextFormField(
            decoration: InputDecoration(
              labelText: 'Cidade',
            ),
          ),

          TextFormField(
            decoration: InputDecoration(
              labelText: 'UF',
            ),
          ),
        ],
      ),
    ),
    );
    
  }
}