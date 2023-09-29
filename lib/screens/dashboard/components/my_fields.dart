//======================================================
library file_case;

import 'package:file_case/src/file_case_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
export 'package:file_case/src/widgets/file_icon.dart' hide FileIcon;
export 'package:file_case/src/file_picker_options.dart' show FilePickerOptions;
export 'package:file_case/src/file_case_controller.dart'
    show FileCaseController;
export 'package:file_picker/file_picker.dart' show FileType, FilePickerStatus;
//======================================================

import 'package:dockable/models/MyFiles.dart';
import 'package:dockable/responsive.dart';
// import 'package:flutter/material.dart';
import 'package:file_case/file_case.dart';

import '../../../constants.dart';
import 'admin_file_info_card.dart';

class MyFiles extends StatelessWidget {

  final firstController = FileCaseController(
      filePickerOptions: FilePickerOptions(type: FileType.any),
      tag: 'controller1');
      //Change controllers with corpus ID
      //corpus ID inclu dans index

  MyFiles({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Secteurs",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const FileCase(
              tag: 'controller1',
            ),
            ElevatedButton.icon(
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  horizontal: defaultPadding * 1.5,
                  vertical:
                      defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
                ),
              ),
              onPressed: () {
                  FileController fileCaseController = Get.find<FileController>(tag: 'controller1');
                  fileCaseController.pickFiles();
              },
              icon: const Icon(Icons.add),
              label: const Text("Nouveau Fichier"),
            ),
            
            //const FileUploadButton(tag: 'controller1'),
          ],
        ),
        const SizedBox(height: defaultPadding),
        Responsive(
          mobile: FileInfoCardGridView(
            crossAxisCount: size.width < 650 ? 2 : 2,
            childAspectRatio: size.width < 650 && size.width > 350 ? 2 : 2,
          ),
          // tablet: FileInfoCardGridView(
          //   crossAxisCount: size.width < 1080 ? 2 : 4,
          //   childAspectRatio: size.width < 1080 ? 1.5 : 1,
          // ),
          desktop: FileInfoCardGridView(
            childAspectRatio: size.width < 1400 ? 1.8 : 1.4,
            crossAxisCount: size.width < 1400 ? 2 : 4,
          ),
        ),
      ],
    );
  }
}

class FileInfoCardGridView extends StatelessWidget {
  const FileInfoCardGridView({
    Key? key,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        // height: MediaQuery.of(context).size.height * 0.2,
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: demoMyFiles.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: defaultPadding,
            mainAxisSpacing: defaultPadding,
            childAspectRatio: childAspectRatio,
          ),
          itemBuilder: (context, index) => AdminFileInfoCard(info: demoMySectors[index]),
        ),
      ),
    );
  }
}
