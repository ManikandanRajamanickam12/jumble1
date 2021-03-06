import 'package:flutter/material.dart';

class CustomSliderTheme extends StatelessWidget {
  final Widget child;

  const CustomSliderTheme({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double thumbRadius = 10;
    const double tickMarkRadius = 8;

    final activeColor = Color(0xffC40004);
    final inactiveColor = Color.fromRGBO(109, 114, 120, 1);

    return SliderTheme(
      data: SliderThemeData(
        trackHeight: 5,

        /// Thumb
        rangeThumbShape: RoundRangeSliderThumbShape(
          disabledThumbRadius: thumbRadius,
          enabledThumbRadius: thumbRadius,
        ),

        /// Tick Mark
        rangeTickMarkShape:
            RoundRangeSliderTickMarkShape(tickMarkRadius: tickMarkRadius),

        /// Inactive
        inactiveTickMarkColor: inactiveColor,
        inactiveTrackColor: inactiveColor,

        /// Active
        thumbColor: activeColor,
        activeTrackColor: activeColor,
        activeTickMarkColor: activeColor,
      ),
      child: child,
    );
  }
}
