import 'package:flutter/material.dart';

class IndiaPage extends StatefulWidget {
  IndiaPage({Key key}) : super(key: key); 

  @override
  IndiaPageState createState() => IndiaPageState();
}

class IndiaPageState extends State<IndiaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        title: Text('India (Detailed)'),
      ),
      body: Center(
        child: Text('IndiaPage index 2'),
      ),
    );
  }
}