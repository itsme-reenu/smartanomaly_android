import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reenu_susan_kurian_112033_s_application1/core/app_export.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DataVisulaization extends StatefulWidget {
  DataVisulaization({Key? key}) : super(key: key);

  @override
  _DataVisulaizationState createState() => _DataVisulaizationState();
}

class _DataVisulaizationState extends State<DataVisulaization> {
  late List<Map<String, dynamic>> chartData;

 @override
 void initState() {
    super.initState();
    loadChartData();
 }

 Future<void> loadChartData() async {
    String jsonString = await rootBundle.loadString('assets/CrimesData.json');
    List<dynamic> jsonResponse = json.decode(jsonString);
    setState(() {
      chartData = jsonResponse.cast<Map<String, dynamic>>();
    });
 }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Crime Data Visualization'),
      // ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Total Anomalies detected',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 400,
              child: SfCartesianChart(
                //title: ChartTitle(text: 'Total IPC Crimes for Districts in 2001'),
                legend: Legend(isVisible: true),
                primaryXAxis: CategoryAxis(),
                series: [
                  ColumnSeries<Map<String, dynamic>, String>(
                    dataSource: chartData,
                    xValueMapper: (Map<String, dynamic> data, _) => data['DISTRICT'] as String,
                    yValueMapper: (Map<String, dynamic> data, _) => data['TOTAL IPC CRIMES'] as int,
                    name: 'Total Anomaly',
                  )
                ],
                tooltipBehavior: TooltipBehavior(enable: true),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 400,
              child: SfCircularChart(
               // title: ChartTitle(text: 'Crime Analysis (Pie Chart)'),
                series: <CircularSeries>[
                  PieSeries<Map<String, dynamic>, String>(
                    dataSource: chartData,
                    xValueMapper: (Map<String, dynamic> data, _) => 'Murder',
                    yValueMapper: (Map<String, dynamic> data, _) => data['MURDER'] as int,
                    dataLabelSettings: DataLabelSettings(isVisible: true),
                  ),
                  PieSeries<Map<String, dynamic>, String>(
                    dataSource: chartData,
                    xValueMapper: (Map<String, dynamic> data, _) => 'Rape',
                    yValueMapper: (Map<String, dynamic> data, _) => data['RAPE'] as int,
                    dataLabelSettings: DataLabelSettings(isVisible: true),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 400,
              child: SfCircularChart(
                //title: ChartTitle(text: 'Crime Analysis (Doughnut Chart)'),
                series: <CircularSeries>[
                  DoughnutSeries<Map<String, dynamic>, String>(
                    dataSource: chartData,
                    xValueMapper: (Map<String, dynamic> data, _) => 'Murder',
                    yValueMapper: (Map<String, dynamic> data, _) => data['MURDER'] as int,
                    dataLabelSettings: DataLabelSettings(isVisible: true),
                  ),
                  DoughnutSeries<Map<String, dynamic>, String>(
                    dataSource: chartData,
                    xValueMapper: (Map<String, dynamic> data, _) => 'Rape',
                    yValueMapper: (Map<String, dynamic> data, _) => data['RAPE'] as int,
                    dataLabelSettings: DataLabelSettings(isVisible: true),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class CustomTextStyles {

  // Title text style
  static get titleMedium18 => theme.textTheme.titleMedium!.copyWith(
        fontSize: 18.fSize,
      );
  static get titleMediumGreenA400 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.greenA400,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumMedium => theme.textTheme.titleMedium!.copyWith(
        fontWeight: FontWeight.w500,
      );
  static get titleSmallOnPrimary => theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.onPrimary,
      );
}

extension on TextStyle {
  TextStyle get spaceGrotesk {
    return copyWith(
      fontFamily: 'Space Grotesk',
    );
  }
}





