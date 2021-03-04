import 'package:flutter/material.dart';
import '../screen_size.dart';

class IndiaPage extends StatefulWidget {

  @override
  IndiaPageState createState() => IndiaPageState();
}

class IndiaPageState extends State<IndiaPage> {
  @override
  void initState() {
    print("India Page Initialized\n"); 
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 160,
      itemBuilder: (context, index) {
        return Card(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Text('India Aircraft listing: ${index + 1}',
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
    );
  }
}
