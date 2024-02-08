import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../model/sura_details_args.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_theme.dart';

class HadethDetails extends StatefulWidget {
  static const String routeName = "hadeth_details";
  const HadethDetails({super.key});

  @override
  State<HadethDetails> createState() => _HadethDetailsState();
}

class _HadethDetailsState extends State<HadethDetails> {
  String fileContent = "";

  @override
  Widget build(BuildContext context) {
    DetailsScreenArgs args =
    ModalRoute.of(context)!.settings.arguments as DetailsScreenArgs;
    if (fileContent.isEmpty) {
      readFileContent(args.fileName);
    }

    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(AppAssets.background))),
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        appBar: buildAppBar(),
        body: fileContent.isEmpty
            ? const Center(child: CircularProgressIndicator(color: AppColors.orange,))
            : SingleChildScrollView(
          child: Text(
            fileContent,
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.center,
            style: AppTheme.regularTitleTextStyle,
          ),
        ),
      ),
    );
  }

  Future<void> readFileContent(String fileName) async {
    Future<String> futureFileContent =
    rootBundle.loadString("assets/files/ahadeth/$fileName");
    fileContent = await futureFileContent;
    setState(() {});
    print("fileContent: $fileContent");
  }

  AppBar buildAppBar() => AppBar(
    title: Text(
      "islami",
      style: AppTheme.appBarTextStyle,
    ),
    centerTitle: true,
    elevation: 0,
    backgroundColor: AppColors.transparent,
  );
}
