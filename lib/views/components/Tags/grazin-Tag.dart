import 'package:flutter/material.dart';

class GrazingTag extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Chip( 
        backgroundColor: Color(0xFF0F759C),    
        label: Text(
          'pastejo',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}