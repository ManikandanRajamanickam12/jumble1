import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:jumbledemo/customslidertheme.dart';
import 'package:jumbledemo/utils.dart';

class SliderLable extends StatefulWidget {
  const SliderLable({Key? key}) : super(key: key);

  @override
  State<SliderLable> createState() => _SliderLableState();
}

class _SliderLableState extends State<SliderLable> {
  RangeValues valuesBottom = RangeValues(0, 2);
  @override
  Widget build(BuildContext context) {
    Widget buildSliderTopLabel() {
      final labels = ['0', '18', '30', '50', '+'];
      final double min = 0;
      final double max = labels.length - 1.0;
      final divisions = (max - min).toInt();

      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: Utils.modelBuilder(
                labels,
                (index, label) {
                  final selectedColor = Colors.black;
                  final unselectedColor = Colors.black.withOpacity(0.3);
                  final isSelected =
                      index >= valuesBottom.start && index <= valuesBottom.end;
                  final color = isSelected ? selectedColor : unselectedColor;

                  return buildLabel(label: label as String, color: color);
                },
              ),
            ),
          ),
          CustomSliderTheme(
            child: RangeSlider(
              values: valuesBottom,
              min: min,
              max: max,
              divisions: divisions,
              labels: RangeLabels(valuesBottom.start.round().toString(),
                  valuesBottom.end.round().toString()),
              onChanged: (values) => setState(() => valuesBottom = values),
            ),
          ),
        ],
      );
    }

    return Scaffold(
        body: Center(
            child: SliderTheme(
      data: SliderThemeData(
        /// ticks in between
        activeTickMarkColor: Colors.transparent,
        inactiveTickMarkColor: Colors.transparent,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildSliderTopLabel(),
        ],
      ),
    )));
  }
}

Widget buildLabel({
  required String label,
  required Color color,
}) =>
    Text(
      label,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ).copyWith(color: color),
    );
