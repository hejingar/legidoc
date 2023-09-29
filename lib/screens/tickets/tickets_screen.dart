import 'package:flutter/material.dart';
import 'package:dockable/constants.dart';
import 'package:dockable/screens/dashboard/components/header.dart';
import 'package:dockable/screens/tickets/components/issue_type.dart';


class TicketsScreen extends StatelessWidget {
  const TicketsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: defaultPadding),
      padding: const EdgeInsets.all(defaultPadding),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Header(page: "Tickets"),
          Expanded(
            // margin: const EdgeInsets.only(top: defaultPadding),
            // padding: const EdgeInsets.all(defaultPadding),
            child: IssueType(),
            )
        ],
      ),
    );
  }
}