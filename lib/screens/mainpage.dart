import 'package:flutter/material.dart';
import 'package:ncov_visual/provider/apiHelper.dart';
import '../screen_size.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<GlobalResponseHelper>(context);
    //final prov2 = Provider.of<CountriesResponseHelper>(context, listen: false); 
    return (prov.bufferStatus)
        ? Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
              itemCount: prov.obj.affectedCountries,
              itemBuilder: (context, index) {
                return Card(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      children: <Widget>[
                        Text('Active ${prov.obj.active}',
                        textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: ScreenSize.safeWidth * 4.5)),
                        SizedBox(height: ScreenSize.safeHeight * 1.5),
                        Text(
                          'Total Cases ${prov.obj.cases}\n'
                          'Deaths ${prov.obj.deaths}\n'
                          'Affected Countries ${prov.obj.affectedCountries}',
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