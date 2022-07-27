

import 'package:flutter/material.dart';

/// Simply pops the current navigator context
class PopPage extends StatefulWidget{
  final List <bool> results;
  const PopPage({Key? key, required this.results}) : super(key: key);
  
  @override
  State<StatefulWidget> createState() => _PopPageState();
  
}

class _PopPageState extends State<PopPage>{

  @override
  void initState(){
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => Navigator.pop(context, widget.results));
  }
  @override
  Widget build(BuildContext context){
    return Container( 
    );
  }
}