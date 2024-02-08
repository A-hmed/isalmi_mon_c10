import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:isalmi_mon_c10/model/sura_details_args.dart';
import 'package:isalmi_mon_c10/ui/utils/app_assets.dart';
import 'package:isalmi_mon_c10/ui/utils/app_colors.dart';

import '../../utils/app_theme.dart';

class SuraDetails extends StatefulWidget {
  static const String routeName = "sura_details";

  const SuraDetails({super.key});

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
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
        appBar: buildAppBar(args.suraName),
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
        rootBundle.loadString("assets/files/quran/$fileName");
    fileContent = await futureFileContent;
    List<String> suraLines = fileContent.split("\n");

    for (int i = 0; i < suraLines.length; i++) {
      if (suraLines[i].isNotEmpty) {
        suraLines[i] += "(${i + 1})";
      }
    }
    fileContent = suraLines.join(" ");
    setState(() {});
    print("fileContent: $fileContent");
  }

  AppBar buildAppBar(String title) => AppBar(
        title: Text(
          title,
          style: AppTheme.appBarTextStyle,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.transparent,
      );
}
