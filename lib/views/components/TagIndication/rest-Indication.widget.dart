import 'package:flutter/material.dart';
import 'package:pasture_manager/model/last-review-by-pasto.dart';

class RestIndication extends StatefulWidget {
  final LastReviewByPasto model;
  RestIndication({@required this.model});

  @override
  _RestIndicationState createState() => _RestIndicationState();
}

class _RestIndicationState extends State<RestIndication> {
  @override
  Widget build(BuildContext context) {
    return onChanger(widget.model.officialClassification);
  }

  // ignore: missing_return
  Widget onChanger(indication) {
    switch (indication) {
      case "0":
        return Container(child: Image.asset('assets/pasture/Grupo_110.png'));
      case "1":
        return Container(child: Image.asset('assets/pasture/Grupo_107.png'));
      case "2":
        return Container(child: Image.asset('assets/pasture/Grupo_110.png'));
      case "3":
        return Container(child: Image.asset('assets/pasture/Grupo_106.png'));
      case "4":
        return Container(child: Image.asset('assets/pasture/Grupo_110.png'));
        break;
    }
  }
}
