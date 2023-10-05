import 'package:dockable/responsive.dart';
import 'package:flutter/material.dart';
import 'package:dockable/models/MyFiles.dart';
import '../../../constants.dart';
import 'doc_info_card.dart';
import 'file_info_card.dart';

class DocPicker extends StatefulWidget {

  const DocPicker({
    Key? key,
  }) : super(key: key);
  
  @override
  State<DocPicker> createState() => _DocPickerState();
}

class _DocPickerState extends State<DocPicker> {

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Domaines",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        const SizedBox(height: defaultPadding),
        SingleChildScrollView(
          child: Responsive(
            mobile: SectorInfoCardGridView(
              crossAxisCount: size.width < 650 ? 2 : 4,
              childAspectRatio: size.width < 650 ? 1.3 : 1.2,
            ),
            tablet: const SectorInfoCardGridView(),
            desktop: SectorInfoCardGridView(
              childAspectRatio: size.width < 1400 ? 1.1 : 1.8,
            ),
          ),
        ),
      ],
    );
  }
}

class SectorInfoCardGridView extends StatefulWidget {
  const SectorInfoCardGridView({
    Key? key,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  State<SectorInfoCardGridView> createState() => _SectorInfoCardGridViewState();
}

class _SectorInfoCardGridViewState extends State<SectorInfoCardGridView> {

  bool _showSector = false;
  int _sectorPicked = 0;

  void _showSectorClicked (int index) {
    setState(() {
      _showSector = !_showSector;
      _sectorPicked = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    var cpt = 0;
    List<FileInfo> filteredFiles = [];

    for (var i = 0; i < demoMyFilesSelect.length; i++) {
      if (demoMyFilesSelect[i].sector == _sectorPicked) {
        cpt++;
        filteredFiles.add(demoMyFilesSelect[i]);
      }
    }
    
    return _showSector ?
    SingleChildScrollView(
      child: Container(
        //width : MediaQuery.of(context).size.width * 0.85,
        height: MediaQuery.of(context).size.height * 0.28,
        child: GridView.builder(
          //physics: const NeverScrollableScrollPhysics(),
          physics: const ScrollPhysics(),
          shrinkWrap: true,
          itemCount: cpt,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            crossAxisSpacing: defaultPadding,
            mainAxisSpacing: defaultPadding,
            childAspectRatio: widget.childAspectRatio * 1.3,
          ),
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              _showSectorClicked(0);
            },
            child: FileInfoCard(info: filteredFiles[index]),
            // child: demoMyFilesSelect[index].sector == _sectorPicked ?
            // FileInfoCard(info: demoMyFilesSelect[index]) : Text("slt")
            ),
        ),
      ),
    ) :
    SingleChildScrollView(
      child: Container(
        height : MediaQuery.of(context).size.height * 0.28,
        child: GridView.builder(
          //physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: demoMyFiles.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: widget.crossAxisCount,
            crossAxisSpacing: defaultPadding,
            mainAxisSpacing: defaultPadding,
            childAspectRatio: widget.childAspectRatio,
          ),
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              //print all files in the sector chosen (index)
              _showSectorClicked(index);
            },
            child: DocInfoCard(info: demoMySectors[index])
            ),
        ),
      ),
    );
  }
}
