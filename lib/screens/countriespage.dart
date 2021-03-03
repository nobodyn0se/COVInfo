import 'package:flutter/material.dart';
import 'package:ncov_visual/provider/apiHelper.dart';
import 'package:ncov_visual/screen_size.dart';
import 'package:provider/provider.dart';

class CountriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<CountriesResponseHelper>(context);
    //print(prov.obj.length); 
    return (prov.bufferStatus)
        ? Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            itemCount: prov.obj.length,
            itemBuilder: (context, index) {
              var uid = prov.obj[index];
              return Card(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[
                      Text('Country: ${uid.country}',
                          style:
                              TextStyle(fontSize: ScreenSize.safeWidth * 4.5)),
                      SizedBox(height: ScreenSize.safeHeight * 1.5),
                      Text(
                        'Active ${uid.active}'
                        '\nTotal ${uid.cases}'
                        '\nDeaths ${uid.deaths}',
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
