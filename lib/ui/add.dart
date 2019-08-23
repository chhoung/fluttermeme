
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttermeme/util/colors.dart';
import 'package:image_picker/image_picker.dart';


import 'meme_upload_photo.dart';

class AddPhotoScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return AddPhotoScreenState();
  }
}

class AddPhotoScreenState extends State<AddPhotoScreen>
{
  File _imageFile;

  Future<void> _pickImage(ImageSource source) async{
     File selected = await ImagePicker.pickImage(source: source);
     setState(() {
       _imageFile = selected;
     });
  }

  void _clear(){
    setState(() {
     _imageFile = null; 
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
     bottomNavigationBar: BottomAppBar(
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.photo_camera),
              onPressed: () => _pickImage(ImageSource.camera),
            ),
            IconButton(
              icon: Icon(Icons.photo_library),
              onPressed: () => _pickImage(ImageSource.gallery),
            ),
          ],
        ),
      ),
      body: Center(
      child : ListView(
        children: <Widget>[

          if(_imageFile != null) ...[
            Image.file(_imageFile),
            Row(
              children: <Widget>[    
                FlatButton(
                  child: Icon(Icons.refresh),
                  onPressed: () => _clear(),
                )
                 
              ],
            )
          ]
        ],
      ),
      )
    );

  }
  

}