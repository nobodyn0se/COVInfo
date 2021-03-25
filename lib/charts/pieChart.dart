import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:ncov_visual/screen_size.dart';

class GlobalPieChart extends StatelessWidget {
  final List<int> chartObjects;

  GlobalPieChart({this.chartObjects});

  List<PieChartSectionData> showingSections() {
    return [
      PieChartSectionData(
        color: Colors.amber,
        value: chartObjects[0].toDouble(),
        radius: 20,
        title: '',
      ),
      PieChartSectionData(
        color: Colors.red,
        value: chartObjects[1].toDouble(),
        radius: 20,
        title: '',
      ),
      PieChartSectionData(
        color: Colors.green,
        value: chartObjects[2].toDouble(),
        radius: 20,
        title: '',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: ScreenSize.safeHeight * 1,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: ScreenSize.safeWidth * 2),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: AspectRatio(
                    aspectRatio: 1.6,
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      PieChart(
                        PieChartData(
                            startDegreeOffset: 270,
                            centerSpaceColor: Colors.transparent,
                            borderData: FlBorderData(
                              show: false,
                            ),
                            sectionsSpace: 0,
                              centerSpaceRadius: ScreenSize.safeHeight * 5.5,
                            sections: showingSections()),
                      ),
                      Text(
                        'Total\n${(chartObjects[3] * 0.000001).toStringAsFixed(2)}M',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: ScreenSize.safeHeight * 1.9,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: [
                      Container(
                        width: ScreenSize.safeHeight * 2,
                        height: ScreenSize.safeHeight * 2,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.black,
                              width: ScreenSize.safeWidth * 0.3),
                          shape: BoxShape.circle,
                          color: Colors.amber,
                        ),
                      ),
                      SizedBox(
                        width: ScreenSize.safeWidth * 1,
                      ),
                      Text(
                          'Active: ${(chartObjects[0] * 0.000001).toStringAsFixed(2)}M'),
                    ],
                  ),
                  SizedBox(
                    height: ScreenSize.safeHeight * 1,
                  ),
                  Row(
                    children: [
                      Container(
                        width: ScreenSize.safeHeight * 2, //1 unit is 7
                        height: ScreenSize.safeHeight * 2,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.black,
                              width: ScreenSize.safeWidth * 0.3),
                          shape: BoxShape.circle,
                          color: Colors.red,
                        ),
                      ),
                      SizedBox(
                        width: ScreenSize.safeWidth * 1,
                      ),
                      Text(
                          'Deaths: ${(chartObjects[1] * 0.000001).toStringAsFixed(2)}M'),
                    ],
                  ),
                  SizedBox(
                    height: ScreenSize.safeHeight * 1,
                  ),
                  Row(
                    children: [
                      Container(
                        width: ScreenSize.safeHeight * 2,
                        height: ScreenSize.safeHeight * 2,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.black,
                              width: ScreenSize.safeWidth * 0.3),
                          shape: BoxShape.circle,
                          color: Colors.green,
                        ),
                      ),
                      SizedBox(
                        width: ScreenSize.safeWidth * 1,
                      ),
                      Text(
                          'Recovered: ${(chartObjects[2] * 0.000001).toStringAsFixed(2)}M'),
                    ],
                  ),
                ],
              ),
            ],
          ),
            Divider(
              color: Colors.black38,
              indent: ScreenSize.safeWidth*2,
              endIndent: ScreenSize.safeWidth*2,
            ),
            Container(
              margin: EdgeInsets.only(bottom: ScreenSize.safeWidth*1),
              child: Text('Case Fatality Rate: ${(chartObjects[1]/chartObjects[3] * 100).toStringAsFixed(2)}%\n'
              'Recovery Rate: ${(chartObjects[2]/chartObjects[3] * 100).toStringAsFixed(2)}%'),
            ),
          ],
        ),
      ),
    );
  }
}
