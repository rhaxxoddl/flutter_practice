import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('I Am Poor!'),
          backgroundColor: Colors.lightGreen[700],
        ),
        backgroundColor: Colors.red[700],
        body: SafeArea(
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
              Container(
                // height: 100.0,
                // width: double.infinity,
                color: Colors.white,
                child: Text('Container 1'),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                // height: 100.0,
                // width: double.infinity,
                color: Colors.blue,
                child: Text('Container 2'),
              ),
              Container(
                // height: 100.0,
                // width: double.infinity,
                color: Colors.purple,
                child: Text('Container 3'),
              ),
            ])),
      ),
    );
  }
}
