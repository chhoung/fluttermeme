

import 'package:flutter/material.dart';
import 'package:fluttermeme/util/colors.dart';

class CommentScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
     return _CommentScreenState();
  }
  
}
class _CommentScreenState extends State{
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: darkBackgroundColor,
      appBar: AppBar(
        title: Text('Comments'),
      ),
      body: Center(
        child: new Text('Hello')
      ),
    );
  }

  
}