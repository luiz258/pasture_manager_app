import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pasture_manager/themes/app.themes.dart';
import 'package:pasture_manager/views/components/button.widget.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';


class EvaluationPage extends StatefulWidget {
  @override
  _EvaluationPageState createState() => _EvaluationPageState(
        
  );
}

class _EvaluationPageState extends State<EvaluationPage> {
  final _formKey = GlobalKey<FormState>(); //~Formulario
  final _dataFormat = new DateFormat('dd/MM/yyyy');

  DateTime date = DateTime.now();

  var controller = new MoneyMaskedTextController();
  List<DropdownMenuItem<String>> _conditionItem;
  String _condition;
  List<DropdownMenuItem<String>> _pastoItem;
  String _pasto;

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(2018),
      lastDate: DateTime(2040),
    );
    if(picked != null && picked != date){
      setState(() {
        date = picked;
      });
    }
  }

  List <DropdownMenuItem<String>> _getDropDonwContion(){
     List <DropdownMenuItem<String>> items = new List();
     items.add(new DropdownMenuItem(
       value: 'xamarin',
       child: Text("xamarim")
     ));

      items.add(new DropdownMenuItem(
       value: 'xamarin2',
       child: Text("xamarim2")
     ));
      items.add(new DropdownMenuItem(
       value: 'xamari2n',
       child: Text("xamari2m2")
     ));

     return items;
  }



List <DropdownMenuItem<String>> _getDropDonwPasto(){
     List <DropdownMenuItem<String>> itens = new List();
     itens.add(new DropdownMenuItem(
       value: '1',
       child: Text("Pasto 1")
     ));
  itens.add(new DropdownMenuItem(
       value: '3231',
       child: Text("Pasto 1")
     ));
      itens.add(new DropdownMenuItem(
       value: '3531',
       child: Text("Pasto 1")
     ));
      itens.add(new DropdownMenuItem(
       value: '351',
       child: Text("Pasto 1")
     ));
      itens.add(new DropdownMenuItem(
       value: '321',
       child: Text("Pasto 1")
     ));
      itens.add(new DropdownMenuItem(
       value: '331',
       child: Text("Pasto 1")
     ));
  itens.add(new DropdownMenuItem(
       value: '41',
       child: Text("Pasto 1")
     ));
  itens.add(new DropdownMenuItem(
       value: '51',
       child: Text("Pasto 1")
     ));
  itens.add(new DropdownMenuItem(
       value: '51',
       child: Text("Pasto 1")
     ));

      itens.add(new DropdownMenuItem(
       value: '2',
       child: Text("Pasto 2")
     ));
      itens.add(new DropdownMenuItem(
       value: '3',
       child: Text("Pasto 3")
     ));
       itens.add(new DropdownMenuItem(
       value: '130',
       child: Text("Pasto 3wwww")
     ));
      itens.add(new DropdownMenuItem(
       value: '0113',
       child: Text("Pasto 3wwww")
     ));
 itens.add(new DropdownMenuItem(
       value: '3465',
       child: Text("Pasto 3wwww")
     ));
 itens.add(new DropdownMenuItem(
       value: '37',
       child: Text("Pasto 3wwww")
     )); itens.add(new DropdownMenuItem(
       value: '386',
       child: Text("Pasto 3wwww")
     )); itens.add(new DropdownMenuItem(
       value: '380',
       child: Text("Pasto 3wwww")
     )); itens.add(new DropdownMenuItem(
       value: '38',
       child: Text("Pasto 3wwww")
     )); itens.add(new DropdownMenuItem(
       value: '93',
       child: Text("Pasto 3wwww")
     ));
     return itens;
  }

void changerDropDownPasto(String pastoItem){
   setState((){
    _pasto = pastoItem;
  });
} 

void changerDropDownItem(String selectItem){
  setState((){
    _condition =selectItem;
  });
}


@override
void initState(){
     
      _conditionItem = _getDropDonwContion();
      _condition = _conditionItem[0].value;

      _pastoItem = _getDropDonwPasto();
      _pasto = _pastoItem[0].value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        iconTheme: IconThemeData(color: primaryColor),
        title: Text('Fazer Avaliação',  style: TextStyle(color: primaryColor, fontSize: 26),),
        ),
      body: Container(
        
        margin: EdgeInsets.all(20),
        child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                      Text("Selecione a ação atual do pasto"),
                    new DropdownButton(
                      items: _conditionItem,
                      value: _condition,
                      isExpanded: true,
                      onChanged: changerDropDownItem,
                ),
                  ],
                ),

                Text("Selecione o Pasto  "),
                 new DropdownButton(
                
                items: _pastoItem,
                value: _pasto,
                isExpanded: true,
                onChanged: changerDropDownPasto,
              ),
              ],
            ),
            
             
            
             TextFormField(
                keyboardType: TextInputType.number,
               controller: controller,
                decoration: InputDecoration(
                  labelText: 'Nota'
                ),
              ),

              Container(
                margin: EdgeInsets.only(top: 30, bottom: 10),
                
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Data da avalição'),
                    Row(
                      children: <Widget>[

                        IconButton(
                            icon: Icon(Icons.date_range, size: 30,color: Theme.of(context).primaryColor,),
                            tooltip: 'Alterar data',
                            onPressed: () {
                              _selectDate(context);
                             
                            },
                        ),  
                        Text(_dataFormat.format(date),
                          style: TextStyle(
                            fontSize: 30, 
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w600
                          ),
                        ),

                          
                      ],
                    ),
                  ],
                ),
              ),

            Padding(
              padding: const EdgeInsets.all(25.0),
              child: PMButton(text: "Salvar", callBack: () {},),
            )
          ],
        ),
      ),
    );
  }
}