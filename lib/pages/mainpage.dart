import 'package:flutter/material.dart';
import 'package:ncov_visual/provider/apiHelper.dart';
import 'package:ncov_visual/provider/coreClass.dart';
import 'package:ncov_visual/screens/highestRecv.dart';
import 'package:ncov_visual/screens/highestTests.dart';
import 'package:ncov_visual/screens/topActive.dart';
import 'package:ncov_visual/screens/topCases.dart';
import 'package:ncov_visual/screens/topDeaths.dart';
import 'package:ncov_visual/screens/topRecv.dart';
import '../screens/highestCases.dart';
import '../screens/highestDeaths.dart';
import '../screen_size.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<GlobalResponseHelper>(context);

    return (prov.bufferStatus)
        ? Center(
            child: CircularProgressIndicator(),
          )
        : SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              //Outer column, overall page
              children: [
                Card(
                  margin: EdgeInsets.only(bottom: ScreenSize.safeHeight * 2),
                  elevation: ScreenSize.safeHeight * 1,
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: DisplayGlobalData(prov: prov),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    TopListViewCases(prov: prov),
                    TopListViewDeaths(prov: prov),
                  ],
                ),
                //Top Recovered
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    TopListViewRecv(prov: prov),
                    TopListViewActive(prov: prov),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    HighListViewCases(prov: prov),
                    HighListViewDeaths(prov: prov),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    HighListViewRecoveries(prov: prov),
                    HighListViewTests(prov: prov),
                  ],
                ),
                Container(
                  height: ScreenSize.safeHeight * 10,
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

  final GlobalResponseHelper prov;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('Total Cases ${prov.globalData.cases}',
            style: TextStyle(fontSize: ScreenSize.safeWidth * 4.5)),
        SizedBox(height: ScreenSize.safeHeight * 1.5),
        Text(
          'Active ${prov.globalData.active}\n'
          'Deaths ${prov.globalData.deaths}\n'
          'Recoveries ${prov.globalData.recovered}',
          style: TextStyle(fontSize: ScreenSize.safeWidth * 4),
        ),
        SizedBox(
          height: ScreenSize.safeHeight * 1.5,
        ),
        Text(
            'Mortality Rate: ${(prov.globalData.deaths / prov.globalData.cases * 100).toStringAsFixed(2)}%\n'
            'Recovery Rate: ${(prov.globalData.recovered / prov.globalData.cases * 100).toStringAsFixed(2)}%'),
      ],
    );
  }
}

Expanded buildLeadingRow(int id, List<CountriesResponse> buildList) {
  return Expanded(
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: ScreenSize.safeHeight * 2,
          backgroundColor: Colors.black,
          child: CircleAvatar(
            radius: ScreenSize.safeHeight * 1.8,
            backgroundImage:
                NetworkImage('${buildList[id].flagURL}') ?? Colors.grey,
          ),
        ),
        SizedBox(
          width: ScreenSize.safeHeight * 1,
        ),
        Expanded(
          child: Text(
            '${buildList[id].country}',
            maxLines: 1,
            softWrap: false,
            overflow: TextOverflow.fade,
          ),
        ),
      ],
    ),
  );
}