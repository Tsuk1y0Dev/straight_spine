import 'package:flutter/material.dart';

import 'screens/home_screen.dart';
import 'screens/insights_screen.dart';

class AppNavigator extends StatefulWidget {
  const AppNavigator({super.key});

  @override
  State<AppNavigator> createState() => _AppNavigatorState();
}

class _AppNavigatorState extends State<AppNavigator> {
  int currentPageIndex = 0;

  final List<Widget> _screens = [const HomeScreen(), const InsightsScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: currentPageIndex, children: _screens),
      bottomNavigationBar: NavigationBar(
        labelTextStyle: WidgetStateProperty.resolveWith((
          Set<WidgetState> states,
        ) {
          if (states.contains(WidgetState.selected)) {
            return const TextStyle(
              color: Color(0xFF49D9A1),
              fontWeight: FontWeight.bold,
            );
          }
          return const TextStyle(color: Color(0xFF9BAFB8));
        }),
        backgroundColor: Color(0xFF101C23),
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Color(0xFF101C23),
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home, color: Color(0xFF49D9A1)),
            icon: Icon(Icons.home_outlined, color: Color(0xFF9BAFB8)),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.insights, color: Color(0xFF49D9A1)),
            icon: Icon(Icons.insights_outlined, color: Color(0xFF9BAFB8)),
            label: 'Insights',
          ),
        ],
      ),
    );
  }
}
