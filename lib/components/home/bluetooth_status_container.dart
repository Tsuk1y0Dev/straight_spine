import 'package:flutter/material.dart';
import 'package:flutter_classic_bluetooth/flutter_classic_bluetooth.dart';
import 'package:straight_spine/components/home/bluetooth_views/connected_view.dart';

class BluetoothStatusContainer extends StatefulWidget {
  final double firstSensorBatteryLevel;
  final double secondSensorBatteryLevel;
  final bool isConnected;
  final bool isConnecting;
  final List<BtcDevice> devices; // <-- Real paired devices
  final ValueChanged<BtcDevice> onDeviceSelected; // <-- Passes selected device up
  final VoidCallback onDisconnect;

  const BluetoothStatusContainer({
    super.key,
    required this.isConnected,
    this.isConnecting = false,
    required this.firstSensorBatteryLevel,
    required this.secondSensorBatteryLevel,
    required this.devices,
    required this.onDeviceSelected,
    required this.onDisconnect,
  });

  @override
  State<BluetoothStatusContainer> createState() =>
      _BluetoothStatusContainerState();
}

class _BluetoothStatusContainerState extends State<BluetoothStatusContainer> {
  BtcDevice? selectedDevice;

  @override
  Widget build(BuildContext context) {
    return Ink(
      width: 354,
      height: 64,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: widget.isConnecting
            ? null
            : () => _showBluetoothDeviceSelectDialog(context),
        child: Padding(
          padding: const EdgeInsets.only(left: 14, right: 35),
          child: widget.isConnecting
              ? const Center(child: CircularProgressIndicator())
              : widget.isConnected
                  ? ConnectedBluetoothView(
                      secondSensorBatteryLevel: widget.secondSensorBatteryLevel,
                      firstSensorBatteryLevel: widget.firstSensorBatteryLevel,
                    )
                  : const Center(
                      child: Text("Нажмите, чтобы выбрать устройство"),
                    ),
        ),
      ),
    );
  }

  Future<void> _showBluetoothDeviceSelectDialog(BuildContext context) async {
    BtcDevice? tempSelectedDevice = selectedDevice;

    final result = await showDialog<BtcDevice>(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              title: const Text("Выберите устройство"),
              backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              content: widget.devices.isEmpty
                  ? const Text("Нет сопряжённых устройств")
                  : RadioGroup<BtcDevice>(
                      groupValue: tempSelectedDevice,
                      onChanged: (value) {
                        setDialogState(() {
                          tempSelectedDevice = value;
                        });
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: widget.devices.map((device) {
                          return RadioListTile<BtcDevice>(
                            value: device,
                            title: Text(device.name ?? "Unknown"),
                            subtitle: Text(device.address),
                            contentPadding: EdgeInsets.zero,
                          );
                        }).toList(),
                      ),
                    ),
              actions: <Widget>[
                if (widget.isConnected)
                  TextButton(
                    onPressed: () {
                      widget.onDisconnect();
                      Navigator.pop(context);
                    },
                    child: const Text("Отключить"),
                  ),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Отмена"),
                ),
                TextButton(
                  onPressed: tempSelectedDevice == null
                      ? null
                      : () {
                          widget.onDeviceSelected(tempSelectedDevice!);
                          Navigator.pop(context, tempSelectedDevice);
                        },
                  child: const Text("Подключить"),
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

