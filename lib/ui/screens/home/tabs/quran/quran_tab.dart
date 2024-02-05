import 'package:flutter/material.dart';
import 'package:isalmi_mon_c10/ui/utils/app_assets.dart';
import 'package:isalmi_mon_c10/ui/utils/app_colors.dart';
import 'package:isalmi_mon_c10/ui/utils/app_theme.dart';
import 'package:isalmi_mon_c10/ui/utils/constants.dart';

class QuranTab extends StatelessWidget {

  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(flex: 3,child: Center(child: Image.asset(AppAssets.quranTabLogo))),
       Expanded(
         flex: 7,
         child: Stack(
           alignment: Alignment.center,
           children: [
             buildTabContent(),
             Container(
               width: 3,
               color: AppColors.orange,
               height: double.infinity,
             )
           ],
         ),
       )

      ],
    );
  }

  Widget buildTabContent() {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 3,
          color: AppColors.orange,
        ),
        const SizedBox(height: 4,),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(child: Text("Sura Name", textAlign: TextAlign.center, style: AppTheme.mediumTitleTextStyle,)),
            Expanded(child: Text("Verses", textAlign: TextAlign.center, style: AppTheme.mediumTitleTextStyle)),
          ],
        ),
        const SizedBox(height: 4,),
        Container(
          width: double.infinity,
          height: 3,
          color: AppColors.orange,
        ),
        Expanded(flex: 7,
          child: buildListView(),),
      ],
    );
  }

  ListView buildListView() {
    return ListView.builder(
            itemCount: Constants.suraNames.length,
            itemBuilder: (context, index){
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(child: Text(Constants.suraNames[index], textAlign: TextAlign.center, style: AppTheme.regularTitleTextStyle,)),
                  Expanded(child: Text("${Constants.versesNumber[index]}", textAlign: TextAlign.center, style: AppTheme.regularTitleTextStyle)),
                ],
              );
            },
        );
  }
}
