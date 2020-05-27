import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pasture_manager/bloc/account.bloc.dart';
import 'package:pasture_manager/themes/app.themes.dart';
import 'package:pasture_manager/views/pages/login-page.dart';

import 'package:provider/provider.dart';

import 'home.dart';

void main(){
 /// HttpOverrides.global = new MyHttpOverrides(); 
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      
      providers: [
        ChangeNotifierProvider<AccountBloc>.value(
          value: AccountBloc(),
        ),
      ],
      child: Main(),
    );
  }
}

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}



class Main extends StatelessWidget {

  
  @override
  Widget build(BuildContext context) {

     return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: appTheme(),
      home:  Account(),
    
    );
  }
}


class Account extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      var bloc = Provider.of<AccountBloc>(context, listen: false);
    return Scaffold(
      body: bloc.loadUser() == null 
          ? HomePage()
          : LoginPage(),
    );
  }
}

