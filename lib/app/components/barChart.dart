/// Bar chart example
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:covid_app/app/models/itemModel.dart';
import 'package:flutter/material.dart';

class SimpleBarChart extends StatelessWidget {
  final List<Item> series;
  final bool animate;
  final bool isCase;

  SimpleBarChart(this.series, {this.animate, this.isCase});

  /// Create one series with sample hard coded data.
  List<charts.Series<Cases, DateTime>> _createSampleData() {
    List<Cases> casesData = new List<Cases>();

    if (isCase)
      for (int i = series.length - 1; i >= 0; i--)
        casesData.add(Cases(
            DateTime(
                int.parse(series[i].date.split('-')[0]),
                int.parse(series[i].date.split('-')[1]),
                int.parse(series[i].date.split('-')[2])),
            series[i].confirmed));
    else
      for (int i = series.length - 1; i >= 0; i--)
        casesData.add(Cases(
            DateTime(
                int.parse(series[i].date.split('-')[0]),
                int.parse(series[i].date.split('-')[1]),
                int.parse(series[i].date.split('-')[2])),
            series[i].deaths));

    return [
      new charts.Series<Cases, DateTime>(
        id: 'Casos',
        colorFn: (_, __) => isCase
            ? charts.MaterialPalette.teal.shadeDefault
            : charts.MaterialPalette.red.shadeDefault,
        domainFn: (Cases sales, _) => sales.day,
        measureFn: (Cases sales, _) => sales.quant,
        data: casesData,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return new charts.TimeSeriesChart(
      _createSampleData(),
      defaultInteractions: false,
      animate: true,
      defaultRenderer: new charts.LineRendererConfig(
          includePoints: true, roundEndCaps: true, stacked: true),
      dateTimeFactory: const charts.LocalDateTimeFactory(),
      behaviors: [
        new charts.ChartTitle('Dias',
            behaviorPosition: charts.BehaviorPosition.bottom,
            titleStyleSpec: charts.TextStyleSpec(fontSize: 11),
            titleOutsideJustification:
                charts.OutsideJustification.middleDrawArea),
        new charts.ChartTitle('Quantidade',
            behaviorPosition: charts.BehaviorPosition.start,
            titleStyleSpec: charts.TextStyleSpec(fontSize: 11),
            titleOutsideJustification:
                charts.OutsideJustification.middleDrawArea)
      ],
      domainAxis: new charts.DateTimeAxisSpec(
        tickFormatterSpec: new charts.AutoDateTimeTickFormatterSpec(
            day: new charts.TimeFormatterSpec(
              format: 'dd/MM',
              transitionFormat: 'dd/MM',
            ),
            hour: new charts.TimeFormatterSpec(
              format: 'dd/MM',
              transitionFormat: 'dd/MM',
            ),
            month: new charts.TimeFormatterSpec(
              format: 'dd/MM',
              transitionFormat: 'dd/MM',
            )),
      ),
      primaryMeasureAxis: new charts.NumericAxisSpec(
          tickProviderSpec:
              new charts.BasicNumericTickProviderSpec(desiredTickCount: 4)),
    );
  }
}

/// Sample ordinal data type.
class Cases {
  final DateTime day;
  final int quant;

  Cases(this.day, this.quant);
}
