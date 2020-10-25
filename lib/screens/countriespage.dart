import 'package:flutter/material.dart';
import 'package:ncov_visual/screen_size.dart';

class CountriesPage extends StatefulWidget {
  CountriesPage({Key key}) : super(key: key);

  @override
  CountriesPageState createState() => CountriesPageState();
}

class CountriesPageState extends State<CountriesPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.orange[700],
        title: Text('List Of Countries'),
      ),
      body: ListView.builder(
        itemCount: 160,
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Text('Aircraft listing: ${index + 1}',
                      style: TextStyle(fontSize: ScreenSize.safeWidth * 4.5)),
                  SizedBox(height: ScreenSize.safeHeight * 1.5),
                  Text(
                    'Airbus A320 with FADEC, ELAC, SEC and FlyByWire systems in place',
                    style: TextStyle(fontSize: ScreenSize.safeWidth * 4),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
