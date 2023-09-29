import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'chart.dart';
import 'storage_info_card.dart';

class StorageDetails extends StatelessWidget {
  const StorageDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: const BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Détails de Stockage",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: defaultPadding),
          const Chart(),
          InkWell(
            onTap: () => {
            },
            child: const StorageInfoCard(
              svgSrc: "assets/icons/Documents.svg",
              title: "Fichiers Doc",
              amountOfFiles: "1.3GB",
              numOfFiles: 1328,
            ),
          ),
          InkWell(
            onTap: () {
              
            },
            child: const StorageInfoCard(
              svgSrc: "assets/icons/media.svg",
              title: "Media Doc",
              amountOfFiles: "15.3GB",
              numOfFiles: 1328,
            ),
          ),
          InkWell(
            onTap: () {
              
            },
            child: const StorageInfoCard(
              svgSrc: "assets/icons/folder.svg",
              title: "Autres",
              amountOfFiles: "1.3GB",
              numOfFiles: 1328,
            ),
          ),
          InkWell(
            onTap: () {
              
            },
            child: const StorageInfoCard(
              svgSrc: "assets/icons/unknown.svg",
              title: "Unknown",
              amountOfFiles: "1.3GB",
              numOfFiles: 140,
            ),
          ),
        ],
      ),
    );
  }
}
