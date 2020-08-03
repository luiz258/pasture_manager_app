import 'package:flutter/widgets.dart';
import 'package:pasture_manager/model/last-review-by-pasto.dart';

class GrazinIndication extends StatefulWidget {
  final LastReviewByPasto model;

  GrazinIndication({@required this.model});
  @override
  _GrazinIndicationState createState() => _GrazinIndicationState();
}

class _GrazinIndicationState extends State<GrazinIndication> {
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
        return Container(child: Image.asset('assets/pasture/Grupo_107.png'));
      case "3":
        return Container(child: Image.asset('assets/pasture/Grupo_110.png'));
        break;
    }
    
  }
}
