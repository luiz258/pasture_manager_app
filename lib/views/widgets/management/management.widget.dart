import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:pasture_manager/db/DatabasePM.dart';
import 'package:pasture_manager/home.dart';
import 'package:pasture_manager/themes/app.themes.dart';
import 'package:pasture_manager/views/pages/evaluation-page.dart';
import 'package:pasture_manager/views/pages/login-page.dart';
import 'package:pasture_manager/views/pages/pasture-page.dart';
import 'package:pasture_manager/views/pages/sync-page.dart';
import 'package:pasture_manager/views/widgets/evaluation/evaluation-list.widget.dart';
import 'package:pasture_manager/views/widgets/pasture/pasture-list.widget.dart';
import 'package:pasture_manager/views/widgets/pasture/pasture.listOfline.dart';

class Management extends StatefulWidget {
  final Farm farm;
 
  Management({@required this.farm}); 



  @override
  _ManagementState createState() => _ManagementState();
}



class _ManagementState extends State<Management> {
    @override
  Widget build(BuildContext context) {

     bool dialVisible = true;
    return MaterialApp(
      theme:  appTheme(),
    debugShowCheckedModeBanner: false,
    
    home: 
    
      DefaultTabController(
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
                  // ListTile(
                  //   title: Text('Configurações'),
                  //   onTap: () {
                  //     // Update the state of the app.
                  //     // ...
                  //   },
                  // ),
                  ListTile(
                    title: Text('Fazendas'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                  ),
                   ListTile(
                    title: Text('Pastos'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PastureListOffline(farm: widget.farm,)),
                      );
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
                      SystemChannels.platform.invokeMethod('SystemNavigator.pop');
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

            actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.replay),
            tooltip: 'Sincroniazr dados',
            onPressed: () {
                

               Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SyncPage(farm: widget.farm,)),
              );
               
            //  scaffoldKey.currentState.showSnackBar(snackBar);
            },
          ),
          
        ],
            bottom: TabBar(
                labelColor: primaryColor,
                indicatorColor:primaryColor,
                labelStyle: TextStyle(
                  fontSize: 22,fontWeight: FontWeight.w700
                  ),
                unselectedLabelStyle: TextStyle(fontSize: 20),
                unselectedLabelColor: primaryColor,
                 indicator: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    color: Theme.of(context).cardColor
                    
                    ),
                
                    tabs: [
                      Container(
                        child: 
                        Tab(text: 'Pastejo'),),
                        Tab(text: 'Avaliações', )
                      
                      
                    ],
              
                ),//
            
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
                    color: primaryColor)
                    ),
               ],
               )
              ),
           ),
          body:
          
          TabBarView(
            children: [
              PastureList(farm: widget.farm,),
              EvaluationList(farm: widget.farm,),
             

            ],
            ),
            
            floatingActionButton: SpeedDial(
        // both default to 16
        marginRight: 18,
        marginBottom: 20,
        animatedIcon: AnimatedIcons.menu_close,
        animatedIconTheme: IconThemeData(size: 28.0),
        // this is ignored if animatedIcon is non null
        child: Icon(Icons.add),
        visible: dialVisible,
        // If true user is forced to close dial manually
        // by tapping main button and overlay is not rendered.
        closeManually: false,
        curve: Curves.bounceIn,
        overlayColor: Colors.black,
        overlayOpacity: 0.5,

        tooltip: 'Speed Dial',
        heroTag: 'speed-dial-hero-tag',
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        // elevation: 2.0,
        shape: CircleBorder(),
        children: [
          SpeedDialChild(
              child: Icon(Icons.add_comment),
              backgroundColor: Colors.redAccent,
              label: 'Fazer nova avaliação',
              labelStyle: TextStyle(fontSize: 20.0),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EvaluationPage(farm: widget.farm,)),
                );
              }),
          SpeedDialChild(
            child: Icon(Icons.add),
            backgroundColor: Colors.blue,
            label: 'Adcionar novo pasto',
            labelStyle: TextStyle(fontSize: 20.0),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PasturePage(
                          farm: widget.farm,
                        )),
              );
            },
          ),
        ],
      ),
          ),
      ),
    );
    
  }
}