import 'package:flutter/material.dart';
import 'package:simple_techstore/chart/chart_bar.dart';
import 'package:simple_techstore/model/product.dart'
    show CartBucket, CartItem, GadgetCategory, categoryIcons;

class Chart extends StatelessWidget {
  const Chart({
    super.key,
    required this.items,
  });

  final List<CartItem> items;

  List<CartBucket> get buckets {
    return [
      CartBucket.forCategory(items, GadgetCategory.phones),
      CartBucket.forCategory(items, GadgetCategory.laptops),
      CartBucket.forCategory(items, GadgetCategory.accessories),
    ];
  }

  int get maxTotalCount {
    int max = 0;
    for (final bucket in buckets) {
      if (bucket.countByCategory > max) {
        max = bucket.countByCategory;
      }
    }
    return max;
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    final maxCount = maxTotalCount == 0 ? 1 : maxTotalCount;

    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 16,
      ),
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary.withOpacity(0.5),
            Theme.of(context).colorScheme.primary.withOpacity(0.0),
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                for (final bucket in buckets)
                  ChartBar(
                    fill: bucket.countByCategory == 0
                        ? 0
                        : bucket.countByCategory / maxCount,
                  ),
              ],
            ),
          ),
          SizedBox(height: 12),
          Row(
            children: buckets.map(
              (bucket) => Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  child: Column(
                    children: [
                      Icon(
                        categoryIcons[bucket.category],
                        color: isDarkMode
                            ? Theme.of(context).colorScheme.secondary
                            : Theme.of(context).colorScheme.primary.withOpacity(0.7),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '${bucket.countByCategory}',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                  ),
                ),
              ),
            ).toList(),
          ),
        ],
      ),
    );
  }
}
