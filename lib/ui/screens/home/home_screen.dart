import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:insta_downloader/ui/common_widgets/base_scaffold.dart';
import 'package:insta_downloader/ui/common_widgets/my_elevated_button.dart';
import 'package:insta_downloader/ui/common_widgets/my_text.dart';
import 'package:insta_downloader/ui/common_widgets/my_text_from_field.dart';
import 'package:insta_downloader/ui/common_widgets/vertical_spacing.dart';
import 'package:insta_downloader/utils/web_services.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final formKey = GlobalKey<FormState>();
  final urlController = TextEditingController();
  String? message;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: AppBar(
        title: const MyText('Insta video downloader'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyTextFormField(
                controller: urlController,
                caption: 'Instagram URL',
                hintText: 'Enter URL of the reel/image',
                isRequired: true,
              ),
              const VerticalSpacing(12),
              MyElevatedButton(
                onTap: onTapDownload,
                label: 'Download',
              ),
              if (message != null) MyText(message!),
            ],
          ),
        ),
      ),
    );
  }

  void onTapDownload() async {
    if (formKey.currentState?.validate() ?? false) {
      try {
        EasyLoading.show();
        final response = await WebServices.downloadRequest(urlController.text);
        if (response.containsKey('media')) {
          await WebServices.saveImage(context, response['media']);
        } else {
          EasyLoading.showError('Error occurred while downloading the file!');
        }
      } catch (e) {
        EasyLoading.dismiss();
        EasyLoading.showError(e.toString());
      }
    }
  }
}
