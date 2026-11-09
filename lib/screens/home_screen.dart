import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(HomeScreen());

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
	home: Scaffold(
        backgroundColor: Color(0xFF101C23),
        appBar: AppBar(
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
                  return Color(0xFF1A2A32);
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: 354,
                height: 410,
                decoration: BoxDecoration(
                  color: Color(0xFF1A2A32),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
