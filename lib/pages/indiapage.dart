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
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text('Date: ${lst.dates[lst.dates.length - 1]}'),
                  Text(
                      'Total Vaccinations: ${lst.doses[lst.doses.length - 1]}'),
                  SizedBox(
                    height: ScreenSize.safeHeight * 5,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, id) {
                        return Card(
                          child: Padding(
                            padding: EdgeInsets.all(ScreenSize.safeHeight * 1),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text('${lst.dates[id]}'),
                                Text('${lst.perDay[id]}'),
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: lst.perDay.length,
                    ),
                  )
                ],
              ),
            ),
          );
  }
}