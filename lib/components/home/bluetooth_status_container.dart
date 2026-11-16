import 'package:flutter/material.dart';
import 'package:straight_spine/components/home/bluetooth_views/connected_view.dart';

class BluetoothStatusContainer extends StatefulWidget {
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
  State<BluetoothStatusContainer> createState() =>
      _BluetoothStatusContainerState();
}

class _BluetoothStatusContainerState extends State<BluetoothStatusContainer> {
  final List<String> devices = ["Device 1", "Device 2", "Device 3"];

  String? selectedDevice;

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
        onTap: () => _showBluetoothDeviceSelectDialog(context),
        child: Padding(
          padding: const EdgeInsets.only(left: 14, right: 35),

          child: widget.isConnected
              ? ConnectedBluetoothView(
                  secondSensorBatteryLevel: widget.secondSensorBatteryLevel,
                  firstSensorBatteryLevel: widget.firstSensorBatteryLevel,
                )
              : Center(child: Text("Нажмите, чтобы выбрать устройство")),
        ),
      ),
    );
  }

  Future<void> _showBluetoothDeviceSelectDialog(BuildContext context) async {
    String? tempSelectedDevice = selectedDevice;
    final result = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              title: Text("Выберите устройство"),
              backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(20),
              ),
              content: RadioGroup<String>(
                groupValue: tempSelectedDevice,
                onChanged: ((value) {
                  setDialogState(() {
                    tempSelectedDevice = value;
                  });
                }),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: devices.map((device) {
                    return RadioListTile(
                      value: device,
                      title: Text(device),
                      contentPadding: EdgeInsets.zero,
                    );
                  }).toList(),
                ),
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Отмена"),
                ),
                TextButton(
                  onPressed: tempSelectedDevice == null
                      ? null
                      : () {
                          widget.onTap();
                          Navigator.pop(context, tempSelectedDevice);
                        },
                  child: Text("Подключить"),
                ),
              ],
            );
          },
        );
      },
    );
    if (result != null) {
      setState(() {
        selectedDevice = result;
      });
    }
  }
}
