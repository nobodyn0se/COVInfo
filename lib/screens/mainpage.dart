import 'package:flutter/material.dart';
import 'package:ncov_visual/provider/apiHelper.dart';
import '../screen_size.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<GlobalResponseHelper>(context);
    //final prov2 = Provider.of<CountriesResponseHelper>(context);
    return (prov.bufferStatus)
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Container(
            child: Column(
              children: [
                Card(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: DisplayGlobalData(prov: prov),
                  ),
                ),
                GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  children: [
                    Container(
                      margin: EdgeInsets.all(ScreenSize.safeWidth * 1.5),
                      child: ListView.separated(
                          itemBuilder: (context, id) {
                            return Card(
                              child: Text(
                                  '${prov.obj[1][id].country}\t+${prov.obj[1][id].todayCases}'),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return Divider(
                              height: 2.0,
                              color: Colors.black,
                            );
                          },
                          itemCount: prov.obj[1].length),
                      //padding: EdgeInsets.all(30.0),
                    ),
                    ListView.separated(
                        itemBuilder: (context, id) {
                          return Card(
                            child: Text(
                                '${prov.obj[2][id].country}\t+${prov.obj[2][id].todayDeaths}'),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Divider(
                            height: 2.0,
                            color: Colors.black,
                          );
                        },
                        itemCount: prov.obj[2].length),
                  ],
                ),
              ],
            ),
          );
  }
}

class DisplayGlobalData extends StatelessWidget {
  const DisplayGlobalData({
    Key key,
    @required this.prov,
  }) : super(key: key);

  final dynamic prov;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('Active ${prov.obj[0].active}',
            style: TextStyle(fontSize: ScreenSize.safeWidth * 4.5)),
        SizedBox(height: ScreenSize.safeHeight * 1.5),
        Text(
          'Total Cases ${prov.obj[0].cases}\n'
          'Deaths ${prov.obj[0].deaths}\n'
          'Recoveries ${prov.obj[0].recovered}',
          style: TextStyle(fontSize: ScreenSize.safeWidth * 4),
        ),
        SizedBox(
          height: ScreenSize.safeHeight * 1.5,
        ), 
        Text(
          'Mortality Rate: ${(prov.obj[0].deaths/prov.obj[0].cases*100).toStringAsFixed(2)}%\n'
          'Recovery Rate: ${(prov.obj[0].recovered/prov.obj[0].cases*100).toStringAsFixed(2)}%'
        ),
      ],
    );
  }
}
