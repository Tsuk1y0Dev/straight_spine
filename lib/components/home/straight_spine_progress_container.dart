import 'package:flutter/material.dart';

class StraightSpineProgressContainer extends StatelessWidget {
	final double holdSpineProgress;
	final double holdSpineTarget;
  const StraightSpineProgressContainer({
  	super.key,
	required this.holdSpineProgress,
	required this.holdSpineTarget
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: 354,
      height: 154,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(16),
      ),

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
        child: Column(
          spacing: 10,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              spacing: 8,
              children: [
                Text(
                  'Прогресс за сегодня',
                  style: TextStyle(
                    color: theme.colorScheme.onSurface,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                Text(
                  'Цель: 80%',
                  style: TextStyle(
                    color: theme.colorScheme.onSurfaceVariant,
                    fontSize: 11,
                  ),
                ),
              ],
            ),

            Row(
              spacing: 8,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                Text(
                  '74%',
                  style: TextStyle(
                    fontSize: 29,
                    fontWeight: FontWeight.w600,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
                Text(
                  'Времени без отклонений',
                  style: TextStyle(
                    color: theme.colorScheme.onSurfaceVariant,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                LinearProgressIndicator(
                  value: holdSpineProgress,
                  borderRadius: BorderRadiusGeometry.circular(99),
                  minHeight: 6,
                ),
                Align(
                  alignment: Alignment(holdSpineTarget * 2 - 1, 0),
                  child: Container(
                    width: 3,
                    height: 9,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.onSurface,
                      borderRadius: BorderRadiusGeometry.circular(2),
                    ),
                  ),
                ),
              ],
            ),
            Align(
			alignment: Alignment.centerLeft,
              child: Text(
                'До цели 6%',
                style: TextStyle(
                  color: theme.colorScheme.onSurfaceVariant,
                  fontSize: 11,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
