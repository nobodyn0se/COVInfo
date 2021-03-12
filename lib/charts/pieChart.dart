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
    return AspectRatio(
      aspectRatio: 2.5, //width to height ratio
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Expanded(
              child: AspectRatio(
                aspectRatio: 2,
                child: PieChart(
                  PieChartData(
                      centerSpaceColor: Colors.transparent,
                      borderData: FlBorderData(
                        show: false,
                      ),
                      sectionsSpace: 0,
                      centerSpaceRadius: 40,
                      sections: showingSections()),
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
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.amber,
                      ),
                    ),
                    SizedBox(
                      width: ScreenSize.safeWidth * 1,
                    ),
                    Text('Active'),
                  ],
                ),
                SizedBox(
                  height: ScreenSize.safeHeight * 1,
                ),
                Row(
                  children: [
                    Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                      ),
                    ),
                    SizedBox(
                      width: ScreenSize.safeWidth * 1,
                    ),
                    Text('Deaths'),
                  ],
                ),
                SizedBox(
                  height: ScreenSize.safeHeight * 1,
                ),
                Row(
                  children: [
                    Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green,
                      ),
                    ),
                    SizedBox(
                      width: ScreenSize.safeWidth * 1,
                    ),
                    Text('Recovered'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
