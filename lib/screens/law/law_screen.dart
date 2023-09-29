import 'package:flutter/material.dart';
import 'package:dockable/screens/dashboard/components/header.dart';
import 'package:dockable/screens/askme/components/prompt_container.dart';
import 'package:dockable/constants.dart';


class LawScreen extends StatelessWidget {
  const LawScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      minimum: EdgeInsets.all(defaultPadding),
      child: Column(
        children: [
          //SizedBox(height: defaultPadding),
          Header(page: "Law"),
          Padding(
            padding: EdgeInsets.all(defaultPadding),
            child: PromptContainer()
          ),
        ]
      ),
    );
  }
}