import 'package:dockable/screens/dashboard/components/header.dart';
import 'package:dockable/screens/askme/components/prompt_container.dart';
import 'package:flutter/material.dart';
import 'package:dockable/constants.dart';
import 'package:dockable/screens/askme/components/doc_picker.dart';


class AskMeScreen extends StatefulWidget {
  const AskMeScreen({super.key});
  
  @override
  State<AskMeScreen> createState () => _AskMeScreenState(); 
}

class _AskMeScreenState extends State<AskMeScreen> {

  // Widget _currentContent = DocPicker(
  //   onSectorSelected: () {
  //     _switchToSector();
  //   },
  // );

  // void _switchToSector() {
  //   setState(() {
  //     _currentContent = Text("nice");
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      minimum: EdgeInsets.all(defaultPadding),
      child: SingleChildScrollView(
        child: Column(
          children: [
            //SizedBox(height: defaultPadding),
            Header(page: "Ask Me"),
            DocPicker(),
            Padding(
              padding: EdgeInsets.all(defaultPadding),
              child: PromptContainer()
            ),
          ]
        ),
      ),
    );
  }
}
