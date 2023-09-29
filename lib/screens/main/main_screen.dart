import 'package:dockable/controllers/MenuAppController.dart';
import 'package:dockable/responsive.dart';
import 'package:dockable/screens/dashboard/dashboard_screen.dart';
import 'package:dockable/screens/tickets/tickets_screen.dart';
import 'package:dockable/screens/askme/askme_screen.dart';
import 'package:dockable/screens/law/law_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/side_menu.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  Widget _currentContent = const DashboardScreen();
  
  void _switchToDashboard() {
    setState (() {
      _currentContent = const DashboardScreen();
    });
  }

  void _switchToLaw () {
    setState(() {
      _currentContent = const LawScreen();
    });
  }

  void _switchToAskMe() {
    setState(() {
      _currentContent = const AskMeScreen();
    });
  }

  void _switchToTickets() {
    setState(() {
      _currentContent = const TicketsScreen();
    });
  }

  // void _switchToDocuments () {
  //   setState(() {
  //     _currentContent = DocumentsScreen();
  //   });
  // }

  // void _swithToProfile () {
  //   setState(() {
  //     _currentContent = ProfileScreen();
  //   });
  // }

  // void _switchToSettings () {
  //   setState(() {
  //     _currentContent = SettingsScreen();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuAppController>().scaffoldKey,
      drawer: SideMenu(
        onDashboardSelected: () {
          _switchToDashboard();
        },
        onAskMeSelected: () {
          _switchToAskMe();
        },
        onLawSelected: () {
          _switchToLaw();
        },
        onTicketsSelected: () {
          _switchToTickets();
        },
      ),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            // if (Responsive.isDesktop(context))
            //   Expanded(
            //     // default flex = 1
            //     // and it takes 1/6 part of the screen
            //     child: SideMenu(
            //       onDashboardSelected: () {
            //         _switchToDashboard();
            //       },
            //       onAskMeSelected: () {
            //         _switchToAskMe();
            //       },
            //       onLawSelected: () {
            //         _switchToLaw();
            //       },
            //       onTicketsSelected: () {
            //         _switchToTickets();
            //       },
            //     ),
            //   ),
            Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: Stack(
                children: [
                  _currentContent,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
