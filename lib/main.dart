import 'package:dockable/constants.dart';
import 'package:dockable/controllers/MenuAppController.dart';
import 'package:dockable/screens/login/login_page.dart';
import 'package:dockable/screens/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Docable Panel',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,  
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white),
        canvasColor: secondaryColor,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => MenuAppController(),
          ),
        ],
        // child: const MainScreen(),
        child: LoginPage(),
      ),
    );
  }
}
