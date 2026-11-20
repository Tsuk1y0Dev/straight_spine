import 'package:flutter/material.dart';
import 'package:straight_spine/services/bluetooth_service.dart';


class InsightsScreen extends StatelessWidget {
	final BluetoothService btService;
	const InsightsScreen({
		super.key,
		required this.btService
	});

	@override
	  Widget build(BuildContext context) {
		return MaterialApp(
			home: Scaffold(
				body: Center(
					child: Title(
						color: Color(0xFF49D9A1),
						child: const Text('Home Screen'),
					),
				),
			),
		);
	  }
}
