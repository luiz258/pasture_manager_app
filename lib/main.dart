import 'dart:io';

import 'package:flutter/material.dart';
import 'package:load/load.dart';
import 'package:pasture_manager/bloc/account.bloc.dart';
import 'package:pasture_manager/bloc/farm.bloc.dart';
import 'package:pasture_manager/bloc/pasture.bloc.dart';
import 'package:pasture_manager/bloc/sync.bloc.dart';
import 'package:pasture_manager/themes/app.themes.dart';
import 'package:pasture_manager/views/pages/login-page.dart';
import 'package:pasture_manager/views/widgets/farm/farm-list.widget.dart';

import 'package:provider/provider.dart';




// Esta classe permite acesso ao LocalHost com certificados HTTPS inválidos
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    HttpClient client = super.createHttpClient(context);
    client.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    return client;
  }
}

void main() {
  HttpOverrides.global = new MyHttpOverrides();
  runApp( 
     MyApp(),
  );
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      
      providers: [
        ChangeNotifierProvider<AccountBloc>.value(
          value: AccountBloc(),
        ),
        ChangeNotifierProvider<SyncBloc>.value(value: SyncBloc(),),
        ChangeNotifierProvider<PastureBloc>.value(value: PastureBloc(),),
        ChangeNotifierProvider<FarmBloc>.value(value: FarmBloc(),)
      ],
      child: Main(),
    );
  }
}





class Main extends StatelessWidget {

  
  @override
  Widget build(BuildContext context) {

     return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: appTheme(),
      home: LoadingProvider(
      themeData: LoadingThemeData(
          // tapDismiss: false,
       
          ),
      child: Account(), ),
    
    );
  }
}


class Account extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      var bloc = Provider.of<AccountBloc>(context, listen: false);
    return Scaffold(
      body: bloc.loadUser() == null 
          ? FarmList()
          : LoginPage(),
    );
  }
}

