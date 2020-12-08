import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:testes/views/home_page.dart';

enum LegendShape { Circle, Rectangle }

class Dash extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Dash> {
  Map<String, double> dataMapAtividades = {
    "Saúde": 20,
    "Trabalho": 110,
    "Lazer": 16,
    "Estudos": 8,
  };

  Map<String, double> dataMap = {
    "Saúde": 20,
    "Trabalho": 110,
    "Lazer": 16,
    "Estudos": 8,
  };
  List<Color> colorList = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
  ];

  ChartType _chartType = ChartType.ring;
  double _ringStrokeWidth = 32;
  double _chartLegendSpacing = 32;

  bool _showLegendsInRow = false;
  bool _showLegends = true;

  bool _showChartValueBackground = true;
  bool _showChartValues = true;
  bool _showChartValuesInPercentage = false;
  bool _showChartValuesOutside = false;

  LegendShape _legendShape = LegendShape.Circle;
  LegendPosition _legendPosition = LegendPosition.right;

  int key = 0;

  @override
  Widget build(BuildContext context) {
    final chart2 = PieChart(
      key: ValueKey(key),
      dataMap: dataMap,
      animationDuration: Duration(milliseconds: 800),
      chartLegendSpacing: _chartLegendSpacing,
      chartRadius: MediaQuery.of(context).size.width / 3.2 > 300
          ? 300
          : MediaQuery.of(context).size.width / 3.2,
      colorList: colorList,
      initialAngleInDegree: 0,
      chartType: _chartType,
      legendOptions: LegendOptions(
        showLegendsInRow: _showLegendsInRow,
        legendPosition: _legendPosition,
        showLegends: _showLegends,
        legendShape: _legendShape == LegendShape.Circle
            ? BoxShape.circle
            : BoxShape.rectangle,
        legendTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      chartValuesOptions: ChartValuesOptions(
        showChartValueBackground: _showChartValueBackground,
        showChartValues: _showChartValues,
        showChartValuesInPercentage: _showChartValuesInPercentage,
        showChartValuesOutside: _showChartValuesOutside,
      ),
      ringStrokeWidth: _ringStrokeWidth,
    );

    final chart = PieChart(
      key: ValueKey(key),
      dataMap: dataMap,
      animationDuration: Duration(milliseconds: 800),
      chartLegendSpacing: _chartLegendSpacing,
      chartRadius: MediaQuery.of(context).size.width / 3.2 > 300
          ? 300
          : MediaQuery.of(context).size.width / 3.2,
      colorList: colorList,
      initialAngleInDegree: 0,
      chartType: _chartType,
      legendOptions: LegendOptions(
        showLegendsInRow: _showLegendsInRow,
        legendPosition: _legendPosition,
        showLegends: _showLegends,
        legendShape: _legendShape == LegendShape.Circle
            ? BoxShape.circle
            : BoxShape.rectangle,
        legendTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      chartValuesOptions: ChartValuesOptions(
        showChartValueBackground: _showChartValueBackground,
        showChartValues: _showChartValues,
        showChartValuesInPercentage: _showChartValuesInPercentage,
        showChartValuesOutside: _showChartValuesOutside,
      ),
      ringStrokeWidth: _ringStrokeWidth,
    );
    final settings = SingleChildScrollView(
      child: Card(
        margin: EdgeInsets.all(12),
        child: Column(
          children: [],
        ),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("MyTime - Dash"),
        actions: [
          RaisedButton(
            onPressed: () {
              setState(() {
                key = key + 1;
              });
            },
            child: Text("Atualizar".toUpperCase()),
          ),
          RaisedButton(
            child: Text("Minhas Tarefas".toUpperCase()),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (_, constraints) {
          if (constraints.maxWidth >= 600) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex: 2,
                  fit: FlexFit.tight,
                  child: chart,
                ),
                Flexible(
                  flex: 1,
                  child: settings,
                )
              ],
            );
          } else {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    child: chart,
                    margin: EdgeInsets.symmetric(
                      vertical: 64,
                    ),
                  ),
                  Container(
                    child: chart2,
                    margin: EdgeInsets.symmetric(
                      vertical: 64,
                    ),
                  ),
                  settings,
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
