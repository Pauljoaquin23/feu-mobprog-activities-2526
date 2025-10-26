import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  const ChartBar({
    super.key,
    required this.fill,
  });

  final double fill;

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.0),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface.withOpacity(0.25),
            borderRadius: BorderRadius.circular(12),
          ),
          alignment: Alignment.bottomCenter,
          child: FractionallySizedBox(
            heightFactor: fill.clamp(0.0, 1.0),
            widthFactor: 1.0,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
                color: isDarkMode
                    ? Theme.of(context).colorScheme.secondary
                    : Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
