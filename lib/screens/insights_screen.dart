import 'package:flutter/material.dart';

void main () => runApp(InsightsScreen());


class InsightsScreen extends StatelessWidget {
	const InsightsScreen({super.key});

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
