import 'package:flutter/material.dart';

class TGridView extends StatelessWidget {
  const TGridView({
    super.key,
    required this.itemsCount,
    required this.numberOfColumns,
    required this.itemWidget,
  });

  /// item count
  final int itemsCount;

  /// number of columns
  final int numberOfColumns;

  /// Item Widget
  final Widget itemWidget;

  @override
  Widget build(BuildContext context) {
    int numberOfRows = (itemsCount / numberOfColumns).ceil();

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        numberOfRows,
        (index) {
          int semanticNumberOfColumns = numberOfColumns;
          if (index + 1 == numberOfRows) {
            semanticNumberOfColumns = itemsCount % numberOfColumns;
          } else {
            semanticNumberOfColumns = numberOfColumns;
          }
          return Row(
            children: List.generate(semanticNumberOfColumns, (i) {
              return itemWidget;
            }),
          );
        },
      ),
    );
  }
}
