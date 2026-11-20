import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_classic_bluetooth/flutter_classic_bluetooth.dart';
import 'package:straight_spine/services/permissions_service.dart';

class BluetoothService extends ChangeNotifier {
  final _btc = FlutterClassicBluetooth();
  final PermissionsService _permissionsService;

  BluetoothService(this._permissionsService);

  List<BtcDevice> _devices = [];
  BtcConnection? _conn;
  StreamSubscription? _sub;
  bool _isConnecting = false;

  final _incomingDataController = StreamController<String>.broadcast();

  List<BtcDevice> get devices => _devices;
  bool get isConnected => _conn != null;
  bool get isConnecting => _isConnecting;
  Stream<String> get incomingLines => _incomingDataController.stream;

  Future<void> init() async {
    final granted = await _permissionsService.requestBluetoothPermissions();
    if (granted) {
      await loadPairedDevices();
    }
  }

  Future<void> loadPairedDevices() async {
    if (await _btc.isEnabled()) {
      _devices = await _btc.getPairedDevices();
      notifyListeners();
    }
  }

  Future<bool> connect(BtcDevice device) async {
    try {
      await disconnect();
      _isConnecting = true;
      notifyListeners();

      _conn = await _btc.connect(address: device.address);

      _sub = _conn?.input
          .map((Uint8List data) => data.toList())
          .transform(utf8.decoder)
          .listen(
            (String line) => _incomingDataController.add(line),
            onError: (e) => _incomingDataController.addError(e),
            onDone: disconnect,
          );
      _isConnecting = false;
      notifyListeners();
      return true;
    } catch (e) {
      _isConnecting = false;
      _conn = null;
      notifyListeners();
      return false;
    }
  }

  Future<void> send(String message) async {
    if (_conn == null) return;
    _conn!.output.add(utf8.encode('$message\n'));
  }

  Future<void> disconnect() async {
    await _sub?.cancel();
    _sub = null;
    await _conn?.close();
    _conn = null;
    notifyListeners();
  }

  @override
  void dispose() {
    disconnect();
    _incomingDataController.close();
    super.dispose();
  }
}
