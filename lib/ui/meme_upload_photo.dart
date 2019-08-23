
import 'dart:io';

import 'package:flutter/material.dart';

class MemeUploadPhotoScreen extends StatefulWidget{
  final File imageFile;

  MemeUploadPhotoScreen({this.imageFile});
  @override
  State<StatefulWidget> createState() {
    return _MemeUploadPhotoState();
  }
  
}

class _MemeUploadPhotoState extends State<MemeUploadPhotoScreen>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Text(widget.imageFile.path.toString()),
      ),
    );
  }
  
}