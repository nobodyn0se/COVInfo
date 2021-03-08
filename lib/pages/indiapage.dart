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
    VaccineDataResponse lst = prov.vaccData;
    List<TestRows> testlist = prov.testObj.rows;
    return (prov.bufferStatus)
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Container(
            margin: EdgeInsets.only(top: ScreenSize.safeHeight * 1),
            padding: EdgeInsets.all(ScreenSize.safeWidth * 1),
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
                    'Last Updated at ${glob.globalData.updated.hour}:${glob.globalData.updated.minute}',
                    textAlign: TextAlign.end,
                  ),
                ),
                Card(
                  margin: EdgeInsets.only(top: ScreenSize.safeHeight * 1),
                  elevation: ScreenSize.safeHeight * 1,
                  child: Container(
                    padding: EdgeInsets.all(ScreenSize.safeWidth * 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Data upto: ${lst.dates[lst.dates.length - 1]}\n'),
                        Text(
                            'Total Vaccinations: ${lst.doses[lst.doses.length - 1]}'),
                        Text(
                            'Innoculations in 24h: ${dailyDoses(lst.perDay[lst.perDay.length - 2], lst.perDay[lst.perDay.length - 1])}\n'),
                        Text(
                            'Samples tested: ${testlist[testlist.length - 1].value.samples}'),
                        Text(
                            'Tested in 24h: ${dailyDoses(testlist[testlist.length - 2].value.samples - testlist[testlist.length - 3].value.samples, testlist[testlist.length - 1].value.samples - testlist[testlist.length - 2].value.samples)}'),
                      ],
                    ),
                  ),
                ),
                //Text('Testing list length: ${testlist.length}'),
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
                                      '${lst.dates[id]}',
                                      textAlign: TextAlign.left,
                                    ),
                                    Text(
                                      notZero(lst.perDay[id]),
                                      textAlign: TextAlign.left,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          itemCount: lst.perDay.length,
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
                                      '${lst.dates[id]}',
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
