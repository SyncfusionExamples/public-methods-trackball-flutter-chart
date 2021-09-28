import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  return runApp(ChartApp());
}

class ChartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chart Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late SfCartesianChart chart;
  late TrackballBehavior _trackballBehavior;

  @override
  void initState() {
    _trackballBehavior = TrackballBehavior(
        enable: true, activationMode: ActivationMode.singleTap);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData(10, 17),
      ChartData(20, 34),
      ChartData(30, 25),
      ChartData(40, 10),
      ChartData(50, 28)
// Add the required data
    ];

    chart = SfCartesianChart(
        backgroundColor: Colors.white,
        primaryXAxis: NumericAxis(interval: 10),
        trackballBehavior: _trackballBehavior,
        series: <CartesianSeries>[
          LineSeries<ChartData, double>(
              enableTooltip: true,
              dataSource: chartData,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y),
        ]);
    return Scaffold(
        appBar: AppBar(title: Text('Trackball')),
        body: Container(
            child: Column(children: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              primary: Theme.of(context).primaryColor
            ),
            child: Text('Show'),
            onPressed: show,
          ),
          Center(
            child: Container(height: 500, width: 320, child: chart),
          )
        ])));
  }

  void show() {
    _trackballBehavior.showByIndex(1);
  }

  void hide() {
    _trackballBehavior.hide();
  }
}

class ChartData {
  ChartData(this.x, this.y);

  final double x;
  final double y;
}
