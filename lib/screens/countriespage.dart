import 'package:flutter/material.dart';
import '../screen_size.dart';

class CountriesPage extends StatefulWidget {
  static const routeName = '/countries_page';
  CountriesPage({Key key}) : super(key: key);

  @override
  CountriesPageState createState() => CountriesPageState();
}

class CountriesPageState extends State<CountriesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.orange[700],
        title: Text('List Of Countries'),
      ),
      body: Column(
        children: [
          Container(height: 20.0),
          Container(
            width: 400.0,
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      ScreenSize.screenWidth*0.2,
                    ),
                  ),
                  labelText: 'Search any Country'),
            ),
          ),
          Container(height: 20.0),
          Expanded(
            flex: 8,
            child: ListView.builder(
              itemCount: 100,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: null,
                  child: Card(
                    child: Row(
                      children: [
                        Icon(Icons.ac_unit),
                        Text('Country name'),
                        Text('Index'),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}