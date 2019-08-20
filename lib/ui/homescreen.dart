import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttermeme/post/postcell.dart';
import 'package:fluttermeme/app_model.dart';
import 'package:fluttermeme/authentication_bloc/bloc.dart';
import 'package:fluttermeme/util/colors.dart';

class Home extends StatefulWidget {
  final String name;

  Home(this.name);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeState(this.name);
  }
}

class HomeState extends State<Home> {
  final String name;
  HomeState( this.name);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: new Center(
        child: ListView.separated(
          itemCount: 6,
          itemBuilder: (context, i) {
              return FlatButton(
                padding: EdgeInsets.all(0.0),
                child: new PostCell(),
                onPressed: () {
                  print('Pressed!');
                },
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Divider(
                height: 1.0,
                color: Colors.white70,
              );
            },
          )
       )
    );
  }
      
}
