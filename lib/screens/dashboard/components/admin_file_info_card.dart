import 'package:dockable/models/MyFiles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dockable/constants.dart';

class AdminFileInfoCard extends StatefulWidget {

  @override
  State<AdminFileInfoCard> createState() => _AdminFileInfoCardState();
  
  const AdminFileInfoCard({
    Key? key,
    required this.info,
  }) : super(key: key);

  final CloudStorageInfo info;
}

enum AdminItem { itemOne, itemTwo, itemThree }

class _AdminFileInfoCardState extends State<AdminFileInfoCard> {
  
  AdminItem? selectedMenu;

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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(defaultPadding * 0.65),
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: widget.info.color!.withOpacity(0.1),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: SvgPicture.asset(
                  widget.info.svgSrc!,
                  colorFilter: ColorFilter.mode(
                      widget.info.color ?? Colors.black, BlendMode.srcIn),
                ),
              ),


// ======================================================================================
              PopupMenuButton<AdminItem>(
                initialValue: selectedMenu,
                color: bgColor,
                tooltip: "Paramètres",
                icon: const Icon(Icons.more_vert, color: Colors.white54),
                // Callback that sets the selected popup menu item.
                onSelected: (AdminItem item) {
                  setState(() {
                    selectedMenu = item;
                  });
                },
                itemBuilder: (BuildContext context) => <PopupMenuEntry<AdminItem>>[
                  const PopupMenuItem<AdminItem>(
                    value: AdminItem.itemOne,
                    child: Text('Gérer'),
                  ),
                  const PopupMenuItem<AdminItem>(
                    value: AdminItem.itemTwo,
                    child: Text('Ajouter'),
                  ),
                  const PopupMenuItem<AdminItem>(
                    value: AdminItem.itemThree,
                    child: Text('Supprimer'),
                  ),
                ],
              ),
// ======================================================================================

              //const Icon(Icons.more_vert, color: Colors.white54)
            ],
          ),
          const SizedBox(height: defaultPadding * 0.5),
          Text(
            widget.info.title!,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: defaultPadding * 0.5),
          ProgressLine(
            color: widget.info.color,
            percentage: widget.info.percentage,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${widget.info.numOfFiles} Documents",
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  maxLines: 1,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.white70),
                ),
                Text(
                  widget.info.totalStorage!,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  maxLines: 1,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.white),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ProgressLine extends StatelessWidget {
  const ProgressLine({
    Key? key,
    this.color = primaryColor,
    required this.percentage,
  }) : super(key: key);

  final Color? color;
  final int? percentage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 5,
          decoration: BoxDecoration(
            color: color!.withOpacity(0.1),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
        ),
        LayoutBuilder(
          builder: (context, constraints) => Container(
            width: constraints.maxWidth * (percentage! / 100),
            height: 5,
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
          ),
        ),
      ],
    );
  }
}
