

import 'package:flutter/material.dart';
import 'package:pasture_manager/themes/app.themes.dart';
import 'package:pasture_manager/views/pages/login-page.dart';
import 'package:pasture_manager/views/widgets/evaluation/evaluation-list.widget.dart';
import 'package:pasture_manager/views/widgets/pasture/pasture-list.widget.dart';
import 'package:provider/provider.dart';

import 'bloc/account.bloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController scrollController;

 

  @override
  Widget build(BuildContext context) {
  

    return MaterialApp(
       debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          drawer: new Drawer(
        
           child: ListView(
             
    // Important: Remove any padding from the ListView.
                padding: EdgeInsets.zero,
                children: <Widget>[
                  DrawerHeader(
                    child: Text('Olá,'),
                    decoration: BoxDecoration(
                      color: primaryColor,
                    ),
                  ),
                  ListTile(
                    title: Text('Configurações'),
                    onTap: () {
                      // Update the state of the app.
                      // ...
                    },
                  ),
                  ListTile(
                    title: Text('Sair', style: TextStyle(color: Colors.red),),
                    onTap: () {
                     //blocUser.lougout();

                     //  Navigator.pushNamed(context, '/');
                     Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                  ),
                ],
              ),

            ),
          appBar: AppBar(
             iconTheme: new IconThemeData(color:primaryColor),
            // actions: <Widget>[
            //    PopupMenuButton<String>(itemBuilder: (BuildContext context) {},

            //    ),
            // ],
            bottom: TabBar(
                labelColor: Theme.of(context).primaryColor,
                indicatorColor: Theme.of(context).primaryColor,
                labelStyle: TextStyle(
                  fontSize: 22,fontWeight: FontWeight.w700
                  ),
                unselectedLabelStyle: TextStyle(fontSize: 20),
                unselectedLabelColor: Theme.of(context).primaryColor,
                 indicator: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    color: Theme.of(context).cardColor
                    
                    ),
                
                    tabs: [
                      Container(child: Tab(text: 'Pasto')),
                      Tab(text: 'Avaliações', ),
                    ],
              
                ),
            
            backgroundColor: backgroundColor,
           title: Center( 
             child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
               children: <Widget>[
               Image.asset('assets/leaf.png'),
                 Text(
                  'UCP', 
                  style: TextStyle( 
                    fontSize: 33 ,
                    fontStyle: FontStyle.italic ,
                    fontWeight: FontWeight.bold ,
                    color: Theme.of(context).primaryColor)
                    ),
               ],
               )
              ),
          ),
          body:TabBarView(
            children: [
              PastureList(),
              EvaluationList(),

            ],
            ),
          ),
      ),
    );
  }
}
