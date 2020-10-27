import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:ncov_visual/providers/all_data_provider.dart';
import 'package:ncov_visual/widgets/pie_chart.dart';
import 'package:provider/provider.dart';
import '../models/all_data.dart';

class MainPage extends StatefulWidget {
  static const routeName = '/main_page';
  MainPage({Key key}) : super(key: key);

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  List<charts.Series<Task, String>> _seriesPieData;
  all_data data;
  var pieData;
  _generateData() {
    _seriesPieData.add(
      // ignore: missing_required_param
      charts.Series(
        data: pieData,
        domainFn: (Task task, _) => task.task,
        measureFn: (Task task, _) => task.taskvalue,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _seriesPieData = List<charts.Series<Task, String>>();
    _generateData();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[900],
        title: Text('Worldwide Statistics'),
      ),
      body: Center(
        child: FutureBuilder(
          future: Provider.of<All_data_provider>(context).fetchAllData(),
          builder: (context, snapshot) {
            data = snapshot.data;
            pieData = [
              Task(task: 'total cases', taskvalue: 100),
              Task(task: 'total deaths', taskvalue: 120),
              Task(task: 'total recovered', taskvalue: 600),
            ];
            return Center(
              child: DonutPieChart(
                _seriesPieData,animate: true,
              ),
            );
            /*return Card(
              child: Column(
                children: [
                  Text(
                    data.cases.toString(),
                  ),
                  Text(
                    data.deaths.toString(),
                  ),
                  Text(
                    data.recovered.toString(),
                  ),
                ],
              ),
            )*/
            ;
          },
        ),
      ),
    );
  }
}

class Task {
  String task;
  int taskvalue;

  Task({
    this.task,
    this.taskvalue,
  });
}