import 'package:flutter/material.dart';
import 'package:isalmi_mon_c10/ui/screens/home/tabs/ahadeth/ahadeth_tab.dart';
import 'package:isalmi_mon_c10/ui/screens/home/tabs/quran/quran_tab.dart';
import 'package:isalmi_mon_c10/ui/screens/home/tabs/radio/radio_tab.dart';
import 'package:isalmi_mon_c10/ui/screens/home/tabs/sebha/sebha_tab.dart';
import 'package:isalmi_mon_c10/ui/screens/home/tabs/settings/settings_tab.dart';
import 'package:isalmi_mon_c10/ui/utils/app_assets.dart';
import 'package:isalmi_mon_c10/ui/utils/app_colors.dart';
import 'package:isalmi_mon_c10/ui/utils/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:isalmi_mon_c10/ui/utils/build_context_extension.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home_screen";

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late AppLocalizations l10n;
  int currentTabIndex = 0;
  List<Widget> tabs = [
    const QuranTab(),
    const AhadethTab(),
    const SebhaTab(),
    const RadioTab(),
    const SettingsTab(),
  ];

  @override
  Widget build(BuildContext context) {
    l10n = context.l10n;
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(AppAssets.background))),
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        appBar: buildAppBar(),
        bottomNavigationBar: buildBottomNav(),
        body: tabs[currentTabIndex],
      ),
    );
  }

  AppBar buildAppBar() =>
      AppBar(
        title: Text(
          l10n.islami,
          style: AppTheme.appBarTextStyle,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.transparent,
      );

  Widget buildBottomNav() =>
      Theme(
        data: ThemeData(canvasColor: AppColors.orange),
        child: BottomNavigationBar(
          items: [
            buildBottomNavigationBarItem(l10n.quran,iconPath: AppAssets.icQuran, ),
            buildBottomNavigationBarItem(l10n.ahadeth, iconPath:AppAssets.icAhadeth),
            buildBottomNavigationBarItem(l10n.sebha, iconPath: AppAssets.icSebha),
            buildBottomNavigationBarItem(l10n.radio, iconPath: AppAssets.icRadio),
            buildBottomNavigationBarItem("Settings", iconData: Icons.settings_rounded),
          ],
          selectedItemColor: AppColors.lightBlack,
          iconSize: 34,
          currentIndex: currentTabIndex,
          onTap: (index) {
            currentTabIndex = index;
            setState(() {});
          },
        ),
      );

  BottomNavigationBarItem buildBottomNavigationBarItem(String label,
      {String? iconPath, IconData? iconData}) =>
      BottomNavigationBarItem(
          icon: iconPath != null ?
          ImageIcon(AssetImage(iconPath))
              : Icon(iconData!), label: label);
}