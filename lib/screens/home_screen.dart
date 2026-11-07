import 'package:flutter/material.dart';

void main () => runApp(HomeScreen());


class HomeScreen extends StatelessWidget {
	const HomeScreen({super.key});

	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			home: Scaffold(
				backgroundColor: Color(0xFF101C23),
				body: Center(
					child: Title(
						color: Colors.white,
						child: const Text('Home Screen'),
					),
				),
			),
		);
	}
}
