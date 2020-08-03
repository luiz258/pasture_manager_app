import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pasture_manager/model/last-review-by-pasto.dart';
import 'package:pasture_manager/views/components/TagIndication/grazin-indication.widget.dart';
import 'package:pasture_manager/views/components/TagIndication/rest-Indication.widget.dart';
import 'package:pasture_manager/views/components/Tags/grazin-Tag.dart';

import 'package:pasture_manager/views/components/Tags/repose-Tag.dart';

class PastureItem extends StatefulWidget {
  final LastReviewByPasto model;

  PastureItem({@required this.model});

  @override
  _PastureItemState createState() => _PastureItemState();
}

class _PastureItemState extends State<PastureItem> {
  final _dataFormat = new DateFormat('dd/MM/yyyy HH:mm:ss');
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      margin: EdgeInsets.only(top: 18, left: 15, right: 15),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        boxShadow: [
          new BoxShadow(
            color: Color(0xFFD2D2D2),
            offset: new Offset(0, 3),
            blurRadius: 3,
            spreadRadius: 1,
          )
        ],
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 10),
                width: 270,
                //color: Theme.of(context).accentColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    widget.model.tagPast == "Descanco"
                        ? ReposeTag()
                        : GrazingTag(), //-TAG
                    Container(
                        width: 350,
                        height: 30,
                        child: RichText(
                          overflow: TextOverflow.ellipsis,
                          text: TextSpan(
                            text:
                                '${widget.model.pastureName.toUpperCase()} ',
                            style: TextStyle(
                                color: Colors.red[300],
                                fontSize: 26,
                                fontWeight: FontWeight.w500),
                          ),
                        )),

                    Container(
                      child: Text(
                        'Data da Avaliação: ${_dataFormat.format(widget.model.evaluationDate)}',
                        style: TextStyle(fontSize: 14),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(12),
                height: 110,
                width: 110,
                child: Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 50, width: 50,
                          child: widget.model.tagPast == 'Descanco'
                              ? RestIndication(model: widget.model)
                              : GrazinIndication(model: widget.model),
                        ),
                        Container(
                          child: Text('${widget.model.tagPastureIndicator}',
                              textAlign: TextAlign.center),
                        ),
                      ],
                    )),

                //color: Colors.amber,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
