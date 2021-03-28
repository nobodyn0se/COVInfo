import 'package:flutter/material.dart';
import 'package:ncov_visual/provider/apiHelper.dart';
import 'package:ncov_visual/screen_size.dart';
import 'package:provider/provider.dart';

class IndiaPage extends StatelessWidget {
  final List months = [
    'Null',
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<CountriesResponseHelper>(context);
    final glob = Provider.of<GlobalResponseHelper>(context);

    return glob.bufferStatus || prov.bufferStatus
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
                    'Updated at ${glob.globalData!.lastHour}:${glob.globalData!.lastMinute}', //do not use String interpolation here
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
                        Text(
                            'Data upto: ${prov.vaccData!.dates![prov.vaccData!.dates!.length - 1]}\n'),
                        Text(
                            'Total Vaccinations: ${prov.vaccData!.doseList![prov.vaccData!.doseList!.length-1].values}'),
                        Text(
                            'Innoculations in 24h: ${dailyDoses(prov.vaccData!.perDay![prov.vaccData!.perDay!.length - 2], prov.vaccData!.perDay![prov.vaccData!.perDay!.length - 1])}\n'),
                        Text(
                            'Samples tested: ${prov.testObj!.totalSamples!}'),
                        Text('Tested in 24h: '
                            '${dailyDoses(prov.testingList[prov.testingList.length - 2].values!, prov.testingList[prov.testingList.length - 1].values!)}\n'),
                        Text('ETA at current rate: ${prov.vaccData!.eta} years'),
                        Text(
                            'Reaching 20% target by ${months[prov.vaccData!.eta20pct!.month]} ${prov.vaccData!.eta20pct!.day}'),
                      ],
                    ),
                  ),
                ),
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
                                      '${months[prov.vaccData!.doseList![id].weekdate!.month]} '
                                      '${prov.vaccData!.doseList![id].weekdate!.day}',
                                      textAlign: TextAlign.left,
                                    ),
                                    Text(
                                      notZero(prov.vaccData!.doseList![id].values!),
                                      textAlign: TextAlign.left,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          itemCount: prov.vaccData!.doseList!.length,
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
                                      '${months[prov.testingList[id].weekdate!.month]} '
                                      '${prov.testingList[id].weekdate!.day}',
                                      textAlign: TextAlign.left,
                                    ),
                                    Text(
                                      notZero(prov.testingList[id].values!),
                                      textAlign: TextAlign.left,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          itemCount: prov.testingList.length,
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

  String notZero(int num) => (num != 0) ? num.toString() : 'TBA';

  int dailyDoses(int num1, int num2) => (num2 == 0) ? num1 : num2;
}
