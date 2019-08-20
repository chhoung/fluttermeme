import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttermeme/post/postcell.dart';
import 'package:fluttermeme/app_model.dart';
import 'package:fluttermeme/authentication_bloc/bloc.dart';
import 'package:fluttermeme/ui/homescreen.dart';
import 'package:fluttermeme/util/colors.dart';
import 'package:fluttermeme/ui/search.dart';
import 'package:fluttermeme/ui/add.dart';
import 'package:fluttermeme/ui/notification.dart';
import 'package:fluttermeme/ui/profile.dart';

class HomeScreen extends StatefulWidget {
  final String name;
  HomeScreen({Key key, @required this.name}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeScreenState(this.name);
  }
}

class HomeScreenState extends State<HomeScreen> {
  final String uid;
  HomeScreenState(this.uid);

   int _currentPage = 0;
   final _pageOptions = [
     Home(''),
     SearchScreen(),
     AddScreen(),
     NotificationScreen(),
     ProfileScreen(),
   ];
 

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: new AppBar(
          title: Text(uid),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                print('Exit');
              },
            )
          ],
        ),
        body: _pageOptions[_currentPage],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentPage,
          type: BottomNavigationBarType.fixed,
          onTap: (int index) { 
            setState(() {
              _currentPage = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home')
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: Text('Search')
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_a_photo),
              title: Text('Add')
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              title: Text('Notification')
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('Profile')
            ),
          ],
        ),
      ),
    );
  }

  
 

}
