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
    VaccineDataResponse lst = prov.vaccData;
    return (prov.bufferStatus)
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Center(
            child: Container(
              height: ScreenSize.safeHeight * 80,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('Date: ${lst.dates[lst.dates.length - 1]}'),
                  Text(
                      'Total Vaccinations: ${lst.doses[lst.doses.length - 1]}'),
                  Text(
                      'Vaccines Administered in 24h: ${dailyDoses(lst.perDay[lst.perDay.length - 2], lst.perDay[lst.perDay.length - 1])}'),
                  Text(
                      'Total Tests in 24h: ${prov.testObj.rows[prov.testObj.rows.length - 1].value.samples - prov.testObj.rows[prov.testObj.rows.length - 2].value.samples}'),
                  SizedBox(
                    height: ScreenSize.safeHeight * 5,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, id) {
                        return Card(
                          elevation: ScreenSize.safeHeight*1,
                          child: Padding(
                            padding: EdgeInsets.all(ScreenSize.safeHeight * 1),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    height: ScreenSize.safeHeight * 6,
                  ),
                ],
              ),
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
