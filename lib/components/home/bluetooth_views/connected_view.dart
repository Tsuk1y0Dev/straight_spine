import "package:flutter/material.dart";

class ConnectedBluetoothView extends StatelessWidget {
	final double firstSensorBatteryLevel;
	final double secondSensorBatteryLevel;

  const ConnectedBluetoothView({
    super.key,
    required this.firstSensorBatteryLevel,
	required this.secondSensorBatteryLevel,
  });

  @override
  Widget build(BuildContext context) {
  String getFormattedBatteryLevel(double batteryLevel) {
    return '${batteryLevel.toStringAsFixed(0)}%';
  }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      spacing: 10,

      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 15.5,

          children: [
            Icon(
              Icons.bluetooth,
              color: Theme.of(context).colorScheme.primary,
              size: 22,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Text(
                  "Датчики",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "Подключены",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ],
        ),
        Row(
          spacing: 20,

          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Text(
                  "Датчик 1",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                    fontSize: 10,
                  ),
                ),

                Row(
                  children: [
                    Icon(Icons.battery_full),
                    Text(getFormattedBatteryLevel(firstSensorBatteryLevel)),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Text(
                  "Датчик 2",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                    fontSize: 10,
                  ),
                ),

                Row(
                  children: [
                    Icon(Icons.battery_full),
                    Text(getFormattedBatteryLevel(secondSensorBatteryLevel)),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
