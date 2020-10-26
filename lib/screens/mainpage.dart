import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:ncov_visual/widgets/pie_chart.dart';
import '../screen_size.dart';

class MainPage extends StatefulWidget {
  static const routeName = '/main_page';
  MainPage({Key key}) : super(key: key);

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  List<charts.Series<Task, String>> _seriesPieData;

  _generateData() {
    var pieData = [
      Task(
        task: 'Work',
        taskvalue: 25.6,
      ),
      Task(
        task: 'Study',
        taskvalue: 15.6,
      ),
      Task(
        task: 'Food',
        taskvalue: 5.6,
      ),
      Task(
        task: 'Sleep',
        taskvalue: 9.6,
      ),
    ];
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
        child: DonutPieChart(_seriesPieData),
      ),
    );
  }
}

class Task {
  String task;
  double taskvalue;

  Task({
    this.task,
    this.taskvalue,
  });
}
