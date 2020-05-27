import 'package:flutter/material.dart';
import 'package:pasture_manager/bloc/account.bloc.dart';
import 'package:provider/provider.dart';

class AuthenticateUserCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<AccountBloc>(context);
    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            Container(
              width: 200,
              height: 200,
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  fit:  BoxFit.fill, 
                  image: null,
                  ///image: new NetworkImage()
                ),
                color: Theme.of(context).primaryColor,
                border: Border.all(
                  width: 4.0,
                  color: Theme.of(context).accentColor,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(200)
                )
              ),
            ),

            SizedBox(
              height: 20,
            ),
            Text('Bem-vindo ${bloc.user}'),
            SizedBox(
              height: 20,
            ),
            FlatButton(          
              onPressed: null, 
              child: Text('sair'))
          ],),
      ),
    );
  }
}