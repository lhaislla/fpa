import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class CardDetailScreen extends StatelessWidget {
  final String cardNumber;
  final String lastAccessHour;
  final String monitoringStartDate;
  final String lastModificationDate;
  final String monitoringPeriod;

  // Construtor que recebe os dados do card
  CardDetailScreen({
    required this.cardNumber,
    required this.lastAccessHour,
    required this.monitoringStartDate,
    required this.lastModificationDate,
    required this.monitoringPeriod,
  });

  @override
  Widget build(BuildContext context) {
    // Configuração dos dados do gráfico
    var seriesList = [
      charts.Series<LinearSales, int>(
        id: 'Desktop',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        areaColorFn: (_, __) =>
            charts.MaterialPalette.blue.shadeDefault.lighter,
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: [
          LinearSales(0, 5),
          LinearSales(1, 25),
          LinearSales(2, 100),
          LinearSales(3, 75),
        ],
      ),
      charts.Series<LinearSales, int>(
        id: 'Tablet',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        areaColorFn: (_, __) => charts.MaterialPalette.red.shadeDefault.lighter,
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: [
          LinearSales(0, 10),
          LinearSales(1, 50),
          LinearSales(2, 200),
          LinearSales(3, 150),
        ],
      ),
      charts.Series<LinearSales, int>(
        id: 'Mobile',
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        areaColorFn: (_, __) =>
            charts.MaterialPalette.green.shadeDefault.lighter,
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: [
          LinearSales(0, 15),
          LinearSales(1, 75),
          LinearSales(2, 300),
          LinearSales(3, 225),
        ],
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('$cardNumber'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _buildDetailItem('Último acesso', lastAccessHour),
            _buildDetailItem(
                'Data de início do monitoramento', monitoringStartDate),
            _buildDetailItem('Última modificação', lastModificationDate),
            _buildDetailItem('Período de monitoramento', monitoringPeriod),
            SizedBox(height: 24.0),
            Expanded(
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  side: BorderSide(color: Colors.orange, width: 2.0),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: AspectRatio(
                    aspectRatio: 1.5,
                    child: charts.LineChart(
                      seriesList,
                      animate: true,
                      behaviors: [
                        charts.LinePointHighlighter(
                          showHorizontalFollowLine:
                              charts.LinePointHighlighterFollowLineType.none,
                          showVerticalFollowLine:
                              charts.LinePointHighlighterFollowLineType.nearest,
                        ),
                      ],
                      defaultRenderer: charts.LineRendererConfig(
                        includeArea: true,
                        stacked: true,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.orange,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8.0),
        Text(
          value,
          style: TextStyle(fontSize: 16.0),
        ),
        SizedBox(height: 16.0),
      ],
    );
  }
}

class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}
