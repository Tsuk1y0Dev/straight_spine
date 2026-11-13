import 'package:flutter/material.dart';
import 'package:straight_spine/components/home/bluetooth_views/connected_view.dart';

class BluetoothStatusContainer extends StatelessWidget {
  final double firstSensorBatteryLevel;
  final double secondSensorBatteryLevel;
  final bool isConnected;
  final VoidCallback onTap;

  const BluetoothStatusContainer({
    super.key,
    required this.isConnected,
    required this.firstSensorBatteryLevel,
    required this.secondSensorBatteryLevel,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Ink(
      width: 354,
      height: 64,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainer,
        borderRadius: BorderRadiusGeometry.circular(16),
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.only(left: 14, right: 35),

          child: isConnected
              ? ConnectedBluetoothView(
                  secondSensorBatteryLevel: secondSensorBatteryLevel,
                  firstSensorBatteryLevel: firstSensorBatteryLevel,
                )
              : Center(child: Text("Нажмите, чтобы выбрать устройство")),
        ),
      ),
    );
  }
}
