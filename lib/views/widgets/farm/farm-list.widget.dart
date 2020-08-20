import 'package:flutter/material.dart';
import 'package:pasture_manager/bloc/account.bloc.dart';
import 'package:pasture_manager/db/DatabasePM.dart';
import 'package:pasture_manager/settings.dart';
import 'package:pasture_manager/views/widgets/farm/farm-item.dart';
import 'package:pasture_manager/views/widgets/farm/farm-page.dart';
import 'package:provider/provider.dart';

class FarmList extends StatefulWidget {
  final String userId;
  @override
  _FarmListState createState() => _FarmListState();
 FarmList({ this.userId} );
}

class _FarmListState extends State<FarmList> {

  @override
  Widget build(BuildContext context) {
     var  bloc = Provider.of<AccountBloc>(context);
    bloc.loadUser();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Adcionar fazendas',
          style: TextStyle(color: Colors.blueGrey[300]),
        ),
        backgroundColor: Colors.grey[50],
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.add_circle),
              tooltip: 'Adcionar Fazenda',
              color: Colors.blueGrey[300],
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FarmPage()),
                );
              }),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: double.maxFinite,
              child: StreamBuilder<List<Farm>>(
                stream: DatabasePM.instance.farmDAO.listAll(widget.userId == null? bloc.user.id :Settings.user.id),
                builder: (context, snapshot) {
                  if (!snapshot.hasData)
                    return Container(
                      child: Center(
                        child: Text('Lista vazia'),
                      ),
                    );

                  List<Farm> farm = snapshot.data;
                print(Settings.user.id);
                  return ListView.builder(
                    itemCount: farm.length,
                    itemBuilder: (BuildContext context, int index) {
                      return FarmItem(
                        model: farm[index],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
