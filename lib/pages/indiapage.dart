import 'package:flutter/material.dart';
import 'package:ncov_visual/provider/apiHelper.dart';
import 'package:ncov_visual/provider/coreClass.dart';
import 'package:ncov_visual/screen_size.dart';
import 'package:provider/provider.dart';

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
    final prov = Provider.of<CountriesResponseHelper>(context);
    final glob = Provider.of<GlobalResponseHelper>(context);
    
    return (prov.bufferStatus && glob.bufferStatus)
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Container(
            margin: EdgeInsets.only(top: ScreenSize.safeHeight * 1),
            //padding: EdgeInsets.all(ScreenSize.safeWidth * 1),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: ScreenSize.safeWidth * 50,
                  margin: EdgeInsets.only(left: ScreenSize.safeWidth * 50),
                  padding: EdgeInsets.only(right: ScreenSize.safeWidth * 2),
                  child: Text(
                    'Updated at ' +
                        retUpdated(glob.globalData.lastUpdate.hour) +
                        ':' +
                        retUpdated(glob.globalData.lastUpdate.minute),
                    textAlign: TextAlign.end,
                  ),
                ),
                Card(
                  margin: EdgeInsets.only(top: ScreenSize.safeHeight * 1),
                  elevation: ScreenSize.safeHeight * 1,
                  child: Container(
                    padding: EdgeInsets.all(ScreenSize.safeWidth * 3),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Data upto: ${prov.vaccData.dates[prov.vaccData.dates.length - 1]}\n'),
                        Text(
                            'Total Vaccinations: ${prov.vaccData.doses[prov.vaccData.doses.length - 1]}'),
                        Text(
                            'Innoculations in 24h: ${dailyDoses(prov.vaccData.perDay[prov.vaccData.perDay.length - 2], prov.vaccData.perDay[prov.vaccData.perDay.length - 1])}\n'),
                        Text(
                            'Samples tested: ${prov.testObj.rows[prov.testObj.rows.length - 1].value.samples}'),
                        Text('Tested in 24h: '
                            '${dailyDoses(prov.testObj.dailytests[prov.testObj.dailytests.length - 2], prov.testObj.dailytests[prov.testObj.dailytests.length - 1])}\n'),
                        Text('ETA at current rate: ${prov.vaccData.eta} years'),
                      ],
                    ),
                  ),
                ),
                //Text('Testing list length: ${prov.testObj.rows.length}'),
                SizedBox(
                  width: ScreenSize.safeWidth * 90,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Innoculations by Date',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Testing by Date',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  height: ScreenSize.safeHeight * 4,
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemBuilder: (context, id) {
                            return Card(
                              elevation: ScreenSize.safeHeight * 1,
                              child: Padding(
                                padding:
                                    EdgeInsets.all(ScreenSize.safeHeight * 1),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${prov.vaccData.dates[id]}',
                                      textAlign: TextAlign.left,
                                    ),
                                    Text(
                                      notZero(prov.vaccData.perDay[id]),
                                      textAlign: TextAlign.left,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          itemCount: prov.vaccData.perDay.length,
                        ),
                      ),
                      SizedBox(
                        width: ScreenSize.safeWidth * 3,
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemBuilder: (context, id) {
                            return Card(
                              elevation: ScreenSize.safeHeight * 1,
                              child: Padding(
                                padding:
                                    EdgeInsets.all(ScreenSize.safeHeight * 1),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${prov.vaccData.dates[id]}',
                                      textAlign: TextAlign.left,
                                    ),
                                    Text(
                                      notZero(prov.testObj.dailytests[id]),
                                      textAlign: TextAlign.left,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          itemCount: prov.testObj.dailytests.length,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: ScreenSize.safeHeight * 10,
                ),
              ],
            ),
          );
  }

  String notZero(int num) {
    return (num != 0) ? num.toString() : 'TBA';
  }

  int dailyDoses(int num1, int num2) {
    return (num2 == 0) ? num1 : num2;
  }
}
