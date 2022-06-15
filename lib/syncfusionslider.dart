import 'package:flutter/material.dart';

import 'package:syncfusion_flutter_core/theme.dart';

import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:intl/intl.dart';

class SyncSlider extends StatefulWidget {
  const SyncSlider({Key? key}) : super(key: key);

  @override
  State<SyncSlider> createState() => _SyncSliderState();
}

class _SyncSliderState extends State<SyncSlider> {
  SfRangeValues _values =
      SfRangeValues(DateTime(2025, 06, 14), DateTime(2030, 06, 15));
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      body: SfRangeSliderTheme(
        data: SfRangeSliderThemeData(
            labelOffset: Offset(1, -50),
            activeLabelStyle: TextStyle(fontSize: 20, color: Colors.white),
            inactiveLabelStyle: TextStyle(fontSize: 20, color: Colors.grey),
            activeTrackHeight: 6,
            inactiveTrackHeight: 7,
            activeDividerRadius: 8,
            inactiveDividerRadius: 7,
            inactiveDividerColor: Colors.grey,
            activeDividerColor: Colors.red,
            activeTrackColor: Colors.red,
            thumbColor: Colors.red,
            thumbRadius: 12,
            tooltipBackgroundColor: Colors.red,
            inactiveTrackColor: Colors.grey,
            overlayRadius: 25,
            overlayColor: Colors.red.withOpacity(0.12)),
        child: SfRangeSlider(
          values: _values,
          min: DateTime(2022, 06, 14),
          max: DateTime(2035, 06, 15),
          interval: 3,
          showLabels: true,
          showDividers: true,
          dateFormat: DateFormat.y(),
          labelPlacement: LabelPlacement.onTicks,
          dateIntervalType: DateIntervalType.years,
          numberFormat: NumberFormat('\$'),
          enableTooltip: true,
          tooltipShape: const SfPaddleTooltipShape(),
          onChanged: (SfRangeValues value) {
            setState(() {
              _values = value;
            });
          },
        ),
      ),
    ));
  }
}
