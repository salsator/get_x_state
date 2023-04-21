import 'package:flutter/material.dart';

class widget extends StatelessWidget {
  widget({super.key, this.color});

   Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      color: color,
      child: Text("tohle je zkušební text", style: TextStyle( ),),
    );
  }
}
