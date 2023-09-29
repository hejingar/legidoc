import 'package:flutter/material.dart';
import 'package:dockable/ia_widgets/prompt/classic_prompt.dart';

import '../../../constants.dart';

class PromptContainer extends StatelessWidget {
  const PromptContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.55,
      padding: const EdgeInsets.all(defaultPadding),
      decoration: const BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: const ClassicPrompt(),
    );
  }
}
