import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SideMenu extends StatelessWidget {
  final VoidCallback onDashboardSelected;
  final VoidCallback onLawSelected;
  final VoidCallback onAskMeSelected;
  final VoidCallback onTicketsSelected;

  const SideMenu({
    Key? key,
    required this.onDashboardSelected,
    required this.onLawSelected,
    required this.onAskMeSelected,
    required this.onTicketsSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset("assets/images/Docable.png"),
          ),
          DrawerListTile(
            title: "Dashboard",
            svgSrc: "assets/icons/menu_dashboard.svg",
            press: () {
              onDashboardSelected();
            },
          ),
          // DrawerListTile(
          //   title: "Law",
          //   svgSrc: "assets/icons/menu_tran.svg",
          //   press: () {
          //     onLawSelected();
          //   },
          // ),
          DrawerListTile(
            title: "Code Pénal",
            svgSrc: "assets/icons/menu_task.svg",
            press: () {
              onAskMeSelected();
            },
          ),
          DrawerListTile(
            title: "Documents",
            svgSrc: "assets/icons/menu_doc.svg",
            press: () {},
          ),
         
          // DrawerListTile(
          //   title: "Notification",
          //   svgSrc: "assets/icons/menu_notification.svg",
          //   press: () {},
          // ),
          DrawerListTile(
            title: "Profile",
            svgSrc: "assets/icons/menu_profile.svg",
            press: () {},
          ),
          DrawerListTile(
            title: "Settings",
            svgSrc: "assets/icons/menu_setting.svg",
            press: () {},
          ),
           DrawerListTile(
            title: "Tickets",
            svgSrc: "assets/icons/menu_store.svg",
            press: () {
              onTicketsSelected();
            },
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        colorFilter: const ColorFilter.mode(Colors.white54, BlendMode.srcIn),
        height: 16,
      ),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white54),
      ),
    );
  }
}
