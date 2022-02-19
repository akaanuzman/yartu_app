import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import '../../../../core/components/text/body_text1.dart';
import '../../../../product/components/button/special_button.dart';
import '../../../../product/components/items/upload_item.dart';
import '../../../../product/components/text/normal_text.dart';
import '../../../../core/extensions/app_extensions.dart';
import '../../../../core/base/view/base_view.dart';
import '../viewmodel/upload_view_model.dart';

class UploadView extends StatelessWidget {
  const UploadView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BaseView<UploadViewModel>(
        viewModel: UploadViewModel(),
        onModelReady: (model) {
          model.setContext(context);
          model.init();
        },
        onPageBuilder: (BuildContext context, UploadViewModel viewModel) =>
            Scaffold(
          body: FadeInUp(
            child: Padding(
              padding: context.horizontalPaddingNormal,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BodyText1Text(data: "Items", context: context),
                  context.emptySizedHeightBoxLow2x,
                  _uploadButton(context),
                  _folderIcon(context)
                ],
              ),
            ),
          ),
        ),
      );

  SpecialButton _uploadButton(BuildContext context) => SpecialButton(
        context: context,
        borderRadius: context.extraLowBorderRadius,
        onTap: () => _showModalBottomSheet(context),
        child: Wrap(
          children: [
            const Icon(Icons.file_upload_outlined),
            NormalText(
              data: "Upload",
              context: context,
              color: Colors.white,
            ),
          ],
        ),
      );

  Expanded _folderIcon(BuildContext context) => Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset("assets/images/folder_icon.png"),
            ),
            NormalText(data: "Wow such a empty space.", context: context),
          ],
        ),
      );

  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => _bottomSheet(context),
      shape: RoundedRectangleBorder(borderRadius: context.lowBorderRadius),
    );
  }

  FadeInUp _bottomSheet(BuildContext context) => FadeInUp(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: context.paddingNormal,
              child: NormalText(data: "Upload", context: context),
            ),
            context.emptySizedHeightBoxLow,
            UploadItem(
              context: context,
              icon: Icons.insert_drive_file_outlined,
              text: "Files",
              tileColor: context.porselain,
            ),
            UploadItem(
              context: context,
              icon: Icons.folder_outlined,
              text: "Folder",
            ),
            context.emptySizedHeightBoxLow3x,
          ],
        ),
      );
}
