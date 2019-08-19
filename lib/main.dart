import 'package:flutter/material.dart';
import 'story_bank.dart';
void main() => runApp(Dest());

class Dest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: StoryPage(),
    );
  }
}

class StoryPage extends StatefulWidget {
  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  StoryBank sb = StoryBank();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('images/background.png'), fit: BoxFit.cover),
        ),
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        child: SafeArea(child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 12,
              child: Center(
                child: Text(
                  sb.getStory().storyTitle,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: FlatButton(
                  color: Colors.redAccent,
                  onPressed:() {
                    setState(() {
                      sb.nextStory(1);
                    });
                  },
                  child: Text(
                    sb.getStory().choice1,
                    style: TextStyle(
                        fontSize: 20.0
                    ),
                  )
              )
            ),
            SizedBox(
              height: 20.0,
            ),
            Expanded(
              flex: 2,
              child: Visibility(
                visible: sb.buttonShouldBeVisible(),
                  child: FlatButton(
                      color: Colors.blue,
                      onPressed: (){
                        setState(() {
                            sb.nextStory(2);
                        });
                      },
                      child: Text(
                        sb.getStory().choice2,
                        style: TextStyle(
                            fontSize: 20.0
                        ),
                      )
                  ),
              )
            )
          ],
        ))
      ),
    );
  }
}


