import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SpineStatusContainer extends StatelessWidget {
  const SpineStatusContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsetsGeometry.all(18),
      width: 354,
      height: 410,
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(16),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 10,

        children: [
          Align(
            alignment: Alignment.topLeft,

            child: Container(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: theme.colorScheme.onInverseSurface,
                borderRadius: BorderRadiusGeometry.circular(99),
              ),

              child: Text(
                "Осанка в норме",
                style: TextStyle(
                  color: theme.colorScheme.primary,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          SvgPicture.asset(
            'assets/images/spine/straight.svg',
            width: 180,
            height: 232,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 6,

            children: [
              Text(
                "3.2deg",
                style: TextStyle(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
              Text(
                'среднее отклонение',
                style: TextStyle(
                  color: theme.colorScheme.onSurfaceVariant,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          FilledButton.icon(
            style: FilledButton.styleFrom(
              fixedSize: const Size(318, 44),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(12),
              ),
            ),
            onPressed: () {},

            label: Text(
              "Калибровка",
              style: TextStyle(
                color: Theme.of(context).colorScheme.surface,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            icon: Icon(
              Icons.sync,
              color: theme.colorScheme.surface,
              size: 20,
              weight: 1.7,
            ),
          ),
        ],
      ),
    );
  }
}
