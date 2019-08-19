import 'package:flutter/material.dart';
import 'package:fluttermeme/comment.dart';
import 'package:fluttermeme/util/colors.dart';

String imgUrl =
    'https://upload.wikimedia.org/wikipedia/commons/f/ff/Vertical_velocity.jpg';





class PostCell extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PostCellState();
  }
  
}

class _PostCellState extends State{
  bool liked = false;
  bool disliked = false;
  _likePressed() {
    setState(() {
      if(liked){
        liked = false;
        return;
      }
       disliked = false;
       liked = true;
    });
  }
  _dislikePressed() {
    setState(() {
      if(disliked){ 
        disliked = false;
        return;
       }
      liked = false;
      disliked = true;
    });

  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Container(
          // color: darkPrimaryColor,
          padding: new EdgeInsets.fromLTRB(16, 12, 16, 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new RichText(
                  text: TextSpan(
                      text:
                          'This is a meme post, please stand by for further notice!! this should be in 2nd line',
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                    TextSpan(
                        text: ' by chuanlul - Aug, 08',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[500],
                            fontSize: 10.0)),
                  ])),
              new SizedBox(
                height: 5.0,
              ),
              //  new Image.network('https://i.imgur.com/3aLLShp.png')
              new Image.network(imgUrl),
              new Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                    IconButton(
                    iconSize: 20,
                    icon: Icon(Icons.thumb_up, color: liked? Colors.blueAccent: Colors.grey,),
                    tooltip: 'Like Button',
                    onPressed: () {
                      _likePressed();
                    },
                  ),
                  Text('5.3k'),
                  IconButton(
                    
                    iconSize: 20,
                    icon: Icon(Icons.thumb_down, color: disliked? Colors.blueAccent: Colors.grey ,),
                    tooltip: 'Dislike Button',
                    onPressed: () {
                      _dislikePressed();
                    },
                  ),
                  Text('200'),
                  IconButton(
                    iconSize: 20,
                    icon: Icon(Icons.comment),
                    tooltip: 'Comment Button',
                    onPressed: () {
                      print('Comment Button Pressed!');
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) {
                          return CommentScreen();
                        }),
                      );
                    },
                  ),
                  Text('69'),
                  IconButton(
                    iconSize: 20,
                    icon: Icon(Icons.share),
                    tooltip: 'Share Button',
                    onPressed: () {
                      print('Share Button Pressed!');
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
