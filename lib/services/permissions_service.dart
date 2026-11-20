import 'dart:io';

import 'package:permission_handler/permission_handler.dart';

class PermissionsService {
  Future<bool> requestBluetoothPermissions() async {
    if (Platform.isAndroid) {
      final statuses = await [
        Permission.bluetoothConnect,
        Permission.bluetoothScan,
        Permission.location,
      ].request();

      final connectGranted =
          statuses[Permission.bluetoothConnect]?.isGranted ?? false;
      final scanGranted =
          statuses[Permission.bluetoothScan]?.isGranted ?? false;
      final locationGranted = statuses[Permission.location]?.isGranted ?? false;
      return (scanGranted && connectGranted) || locationGranted;
    }
	return true;
  }
}
