import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:pasture_manager/themes/app.themes.dart';
import 'package:pasture_manager/views/pages/FancyFab.dart';
import 'package:pasture_manager/views/pages/evaluation-page.dart';
import 'package:pasture_manager/views/pages/list-evaluation-page.dart';
import 'package:pasture_manager/views/pages/pasture-page.dart';

import 'package:pasture_manager/views/widgets/pasture/pasture-list.widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  ScrollController scrollController;
  bool dialVisible = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: appTheme(),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  ScrollController scrollController;
  bool dialVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: Container(
        
        child: PastureList(),
        
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
                  MaterialPageRoute(builder: (context) => EvaluationPage()),
                );
               }
            ),
            SpeedDialChild(
              child: Icon(Icons.add),
              backgroundColor: Colors.blue,
              label: 'Adcionar novo pasto',
              labelStyle: TextStyle(fontSize: 20.0),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PasturePage()),
                );
              },
            ),
            
          ],
        ),
    );
  }
}

