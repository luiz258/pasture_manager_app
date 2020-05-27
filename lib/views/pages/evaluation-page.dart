import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pasture_manager/db/DatabasePM.dart';
import 'package:pasture_manager/model/evaluation.model.dart';
import 'package:pasture_manager/settings.dart';
import 'package:pasture_manager/themes/app.themes.dart';
import 'package:pasture_manager/views/components/button.widget.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:uuid/uuid.dart';


class EvaluationPage extends StatefulWidget {
  @override
  _EvaluationPageState createState() => _EvaluationPageState(
        
  );
}

class _EvaluationPageState extends State<EvaluationPage> {
  final _formKey = GlobalKey<FormState>(); //~Formulario
  final _dataFormat = new DateFormat('dd/MM/yyyy');
  var uuid = Uuid();
  var  _evaluationForm = EvaluationModel();

  DateTime date = DateTime.now();

  var controller =new MaskedTextController(mask: '00.00');
 
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
       
        _evaluationForm.evaluationDate = picked;
      
      });
    }
  }
@override
void initState()=> _evaluationForm.evaluationDate = date;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        iconTheme: IconThemeData(color: primaryColor),
        title: Text('Fazer Avaliação',  style: TextStyle(color: primaryColor, fontSize: 26),),
        ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                         
                       DropdownButtonFormField(
                    hint:  Text("Selecione a ação atual do pasto"),
                    value: _evaluationForm.tagPast,
                    items: [
                        DropdownMenuItem<String>(
                          child: Text('Descanso'),
                          value: '1',
                        ),
                        DropdownMenuItem<String>(
                          child: Text('Pastejo'),
                          value: '2',
                        ),
                        DropdownMenuItem<String>(
                          child: Text('Livre'),
                          value: '3',
                        ),
                    ] ,
                   validator: (value) => value == null ? 'Selecione a ação atual do pasto capim' : null,
                     onChanged: (val) {
                      setState(() {
                        _evaluationForm.tagPast= val.toString() ;
                      });
                    },
                
                  ),
                      ],
                    ),
                   
                     StreamBuilder<List<Pasture>>(
                        stream: DatabasePM.instance.pastureDAO.listPasture(),
                        builder: (context, snapshot) {
                        
                          if(!snapshot.hasData) return Container();
                          var list = snapshot.data;
                          return DropdownButtonFormField(
                            hint: Text("Selecione o Pasto  "),
                            value: _evaluationForm.idPasture,
                            items: list.map(
                              (c)=> DropdownMenuItem(
                                child: Text(c.id),
                                value: c.id,
                                )).toList(),
                            validator: (value) => value == null ? 'Selecione o Pasto para avaliar.' : null,
                            onChanged: (v) {
                              setState(() {
                                _evaluationForm.idPasture = v;
                              });
                            },
                            );
                        }
                      ),

                  ],
                ),
                
                 
                
                 TextFormField(
                    keyboardType: TextInputType.number,
                   controller: controller,
                    decoration: InputDecoration(
                      labelText: 'Nota'
                    ),
                    validator: (value) => value == null ? 'O campo nota deve Ser preenchido' : null,
                    onSaved: (value){
                      setState(() {
                        _evaluationForm.note = double.parse(value);
                      });
                    },
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
                  child: PMButton(text: "Salvar", callBack: () {
                     if(_formKey.currentState.validate()){
                        _formKey.currentState.save();

                         var eva = new Evaluation(
                              id: uuid.v4().toString(),
                              idPasture: _evaluationForm.idPasture,
                              tagPast: _evaluationForm.tagPast,
                              note: _evaluationForm.note,
                              evaluationDate:_evaluationForm.evaluationDate,
                              farmId: Settings.user.farmId,
                              userId: Settings.user.id

                            );


                          DatabasePM.instance.evaluationDAO.addEvaluation(eva);
                          Navigator.pop(context);
                        }

                  },),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}