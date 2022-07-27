

import 'package:flutter/material.dart';

/// Common code to create a bottom border panel 
class BorderPanel extends StatelessWidget{
  final double width;
  final double padding;
  final double margin;
  final Widget child;
  const BorderPanel({Key? key, this.width = double.infinity, this.padding = 16, this.margin = 8,required this.child}) : super(key: key);
  
  @override
  Widget build(BuildContext context){
    return Container(
      width: width,
      decoration: const BoxDecoration(
        border:  Border(
          top: BorderSide(
            color: Colors.lightBlueAccent,
            width: 0.5
          ),          
          bottom: BorderSide(
            color: Colors.lightBlueAccent,
            width: 0.5
          )                            
        ),
      ),
      padding: EdgeInsets.all(padding),
      margin:  EdgeInsets.all(margin),
      child: child,            
    );
  }
}