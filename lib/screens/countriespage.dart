import 'package:flutter/material.dart';

class CountriesPage extends StatefulWidget {
  CountriesPage({Key key}) : super(key: key); 

  @override
  CountriesPageState createState() => CountriesPageState();
}

class CountriesPageState extends State<CountriesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Of Countries'),
      ),
      body: Center(
        child: Text('CountriesPage index 0'),
      ),
    );
  }
}
