import 'package:flutter/material.dart';

class SegmentedButtons extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onChanged;

  const SegmentedButtons({
    super.key,
    required this.selectedIndex,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<int>(
      segments: const [
        ButtonSegment(
          value: 0,
          label: Text('All'),
        ),
        ButtonSegment(
          value: 1,
          label: Text('Active'),
        ),
        ButtonSegment(
          value: 2,
          label: Text('Completed'),
        ),
      ],
      selected: {selectedIndex},
      onSelectionChanged: (Set<int> newSelection) {
        onChanged(newSelection.first);
      },
    );
  }
}