import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:straight_spine/components/home/bluetooth_status_container.dart';
import 'package:straight_spine/components/home/spine_status_container.dart';

void main() => runApp(HomeScreen());

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  // Theme.of(context).colorScheme.surfaceContainer
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF49D9A1),
          primary: const Color(0xFF49D9A1),
          brightness: Brightness.dark,
          surface: const Color(0xFF101C23),
          surfaceContainer: const Color(0xFF1A2A32),
          onSurface: Colors.white,
          onSurfaceVariant: const Color(0xFF9BAFB8),
          onInverseSurface: const Color(0xFF173D34),
        ),
      ),

      themeMode: ThemeMode.dark,
      home: Builder(
        builder: (context) {
          return Scaffold(
            backgroundColor: Color(0xFF101C23),
            appBar: AppBar(
              scrolledUnderElevation: 0,
              titleSpacing: 30.0,
              actionsPadding: EdgeInsetsGeometry.symmetric(horizontal: 30),
              backgroundColor: Color(0xFF101C23),
              title: Text("AppName", style: GoogleFonts.getFont('Inter')),
              titleTextStyle: TextStyle(
                color: Colors.white,
                fontSize: 27.0,
                fontWeight: FontWeight.w600,
              ),
              actions: <Widget>[
                IconButton(
                  //TODO: decomposition
                  style: IconButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    backgroundColor: WidgetStateColor.resolveWith((
                      Set<WidgetState> states,
                    ) {
                      if (states.contains(WidgetState.pressed)) {
                        return Color(0x771A2A32);
                      }
                      return Theme.of(context).colorScheme.surfaceContainer;
                    }),
                  ),
                  iconSize: 22,
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    'assets/icons/settings_icon.svg',
                    width: 22,
                    height: 22,
                    colorFilter: ColorFilter.mode(
                      Color(0xFF9BAFB8),
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ],
            ),
            body: Padding(
              padding: EdgeInsetsGeometry.all(24.0),
              child: SingleChildScrollView(
                child: Column(
                  spacing: 16,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    BluetoothStatusContainer(
                      regularContDecoration: regularContDecoration,
                    ),
                    SpineStatusContainer(),
                    Container(
                      width: 354,
                      height: 154,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surfaceContainer,
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    Container(
                      width: 354,
                      height: 154,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surfaceContainer,
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

const regularContDecoration = BoxDecoration(
  color: Color(0xFF1A2A32),
  borderRadius: BorderRadius.all(Radius.circular(16)),
);
