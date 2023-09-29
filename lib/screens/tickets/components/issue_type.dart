import 'package:flutter/material.dart';
import 'package:dockable/constants.dart';



class IssueType extends StatelessWidget {
  const IssueType({super.key});

  @override
  Widget build(BuildContext context) {
  return GridView.count(
  primary: false,
  padding: const EdgeInsets.all(defaultPadding),
  crossAxisSpacing: 50,
  mainAxisSpacing: 50,
  crossAxisCount: 4,
  children: <Widget>[
    Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: secondaryColor,
      ),
      child: const Text("He'd have you all unravel at the"),
    ),
    Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: secondaryColor,
      ),
      child: const Text('Heed not the rabble'),
    ),
    Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: secondaryColor,
      ),
      child: const Text('Sound of screams but the'),
    ),
    Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: secondaryColor,
      ),
      child: const Text('Who scream'),
    ),
    Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: secondaryColor,
      ),
      child: const Text('Revolution is coming...'),
    ),
    Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: secondaryColor,
      ),
      child: const Text('Revolution, they...'),
    ),
  ],
);
}
}