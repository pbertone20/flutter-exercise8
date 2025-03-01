import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class LanguagePieChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Top 10 Programming Languages')),
      body: Column(
        children: [
          SizedBox(height: 20),
          Expanded(
            child: PieChart(
              PieChartData(
                sections: _buildPieSections(),
                sectionsSpace: 2,
                centerSpaceRadius: 40,
                borderData: FlBorderData(show: false),
              ),
            ),
          ),
          _buildLegend(),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  List<PieChartSectionData> _buildPieSections() {
    final data = {
      'Python': 33,
      'C++': 14,
      'Java': 14,
      'C': 12,
      'C#': 6,
      'JavaScript': 6,
      'Go': 4,
      'SQL': 3,
      'Visual Basic': 3,
      'Fortran': 3,
    };

    final colors = [
      Colors.blue,
      Colors.red,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.brown,
      Colors.teal,
      Colors.yellow,
      Colors.pink,
      Colors.cyan,
    ];

    int index = 0;
    return data.entries.map((entry) {
      final color = colors[index % colors.length];
      index++;
      return PieChartSectionData(
        color: color,
        value: entry.value.toDouble(),
        title: '${entry.value}%',
        radius: 80,
        titleStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      );
    }).toList();
  }

  Widget _buildLegend() {
    final data = [
      'Python', 'C++', 'Java', 'C', 'C#', 'JavaScript', 'Go', 'SQL', 'Visual Basic', 'Fortran'
    ];
    final colors = [
      Colors.blue,
      Colors.red,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.brown,
      Colors.teal,
      Colors.yellow,
      Colors.pink,
      Colors.cyan,
    ];

    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: List.generate(data.length, (index) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(width: 16, height: 16, color: colors[index]),
            SizedBox(width: 5),
            Text(data[index]),
          ],
        );
      }),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: LanguagePieChart(), // Display the pie chart
    );
  }
}
