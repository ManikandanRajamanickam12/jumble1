import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:jumbledemo/utils.dart';

class SliderScale extends StatefulWidget {
  const SliderScale({Key? key}) : super(key: key);

  @override
  State<SliderScale> createState() => _SliderScaleState();
}

class _SliderScaleState extends State<SliderScale> {
  RangeValues values = RangeValues(20, 50);
  final double min = 0;
  final double max = 100;
  final double thumbRadius = 10;
  final double tickMarkRadius = 8;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SliderTheme(
            data: const SliderThemeData(
              // //ticks in b/w
              // activeTickMarkColor: Colors.transparent,
              // inactiveTickMarkColor: Colors.transparent,
              // //track color
              // activeTrackColor: Colors.green,
              // inactiveTrackColor: Colors.grey,
              // //height
              // trackHeight: 10,
              // //thump height
              rangeThumbShape: RoundRangeSliderThumbShape(
                  enabledThumbRadius: 10, disabledThumbRadius: 10),
              // //thump border
              // overlayShape: RoundSliderOverlayShape(overlayRadius: 30)
              /// Thumb
            ),
            child: Row(
              children: [
                buildSideLabel(min),
                Expanded(
                  //max spacce
                  child: SizedBox(
                    width: 150,
                    child: RangeSlider(
                        values: values,
                        min: min,
                        max: max,
                        divisions: 25,
                        labels: RangeLabels(values.start.round().toString(),
                            values.end.round().toString()),
                        onChanged: (values) {
                          setState(() {
                            this.values = values;
                          });
                        }),
                  ),
                ),
                buildSideLabel(max),
              ],
            ),
          ),
          RangeSlider(
              values: values,
              min: min,
              max: max,
              divisions: 20,
              activeColor: Colors.red,
              inactiveColor: Colors.grey.shade700,
              labels: RangeLabels(values.start.round().toString(),
                  values.end.round().toString()),
              onChanged: (values) {
                setState(() {
                  this.values = values;
                });
              })
        ],
      ),
    );
  }
}

Widget buildSideLabel(double value) => Container(
      width: 50,
      child: Text(
        value.round().toString(),
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
