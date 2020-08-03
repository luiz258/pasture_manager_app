import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pasture_manager/bloc/account.bloc.dart';
import 'package:pasture_manager/main.dart';
import 'package:pasture_manager/themes/app.themes.dart';
import 'package:pasture_manager/views/pages/login-page.dart';
import 'package:pasture_manager/views/widgets/farm/farm-list.widget.dart';

import 'db/DatabasePM.dart';

class HomePage extends StatefulWidget {
  final Farm farm;
  final String  userIdA;

  HomePage({this.farm, this.userIdA});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController scrollController;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
       theme:  appTheme(),
      home:
          // DefaultTabController(
          //   length: 2,
          Scaffold(
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
                      title: Text(
                        'Sair',
                        style: TextStyle(color: Colors.red),
                      ),
                      onTap: () {
                        var blocUser = AccountBloc();
                        blocUser.lougout();

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
                iconTheme: new IconThemeData(color: primaryColor),
                // actions: <Widget>[
                //    PopupMenuButton<String>(itemBuilder: (BuildContext context) {},

                //    ),
                // ],

                // actions: <Widget>[
                //   IconButton(
                //     icon: const Icon(Icons.replay),
                //     tooltip: 'Sincroniazr dados',
                //     onPressed: () {
                //       Navigator.push(
                //         context,
                //         MaterialPageRoute(builder: (context) => SyncPage()),
                //       );

                //       //  scaffoldKey.currentState.showSnackBar(snackBar);
                //     },
                //   ),
                // ],
                //     bottom: TabBar(
                //         labelColor: Theme.of(context).primaryColor,
                //         indicatorColor: Theme.of(context).primaryColor,
                //         labelStyle: TextStyle(
                //           fontSize: 22,fontWeight: FontWeight.w700
                //           ),
                //         unselectedLabelStyle: TextStyle(fontSize: 20),
                //         unselectedLabelColor: Theme.of(context).primaryColor,
                //          indicator: BoxDecoration(
                //             borderRadius: BorderRadius.only(
                //                 topLeft: Radius.circular(10),
                //                 topRight: Radius.circular(10)),
                //             color: Theme.of(context).cardColor

                //             ),

                //     tabs: [
                //       Container(
                //         child:
                //         Tab(text: 'Pasto'),),
                //         Tab(text: 'Avaliações', )

                //     ],

                // ),//

                backgroundColor: backgroundColor,
                title: Center(
                    child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset('assets/leaf.png'),
                    Text('UCP',
                        style: TextStyle(
                            fontSize: 33,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            color: primaryColor)),
                  ],
                )),
              ),
              body: FarmList(),

              // TabBarView(
              //   children: [
              //     PastureList(),
              //     EvaluationList(),

              //   ],
              ),
      //),
      //),
    );
  }
}
