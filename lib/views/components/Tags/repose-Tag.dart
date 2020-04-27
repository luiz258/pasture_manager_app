import 'package:flutter/material.dart';

class ReposeTag extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Chip( 
        backgroundColor: Color(0xFFE67E22),
        
        padding: EdgeInsets.only(bottom: 1),    
        label: Text(
          'Descanso',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}