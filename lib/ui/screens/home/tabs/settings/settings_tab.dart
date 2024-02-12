import 'package:flutter/material.dart';
import 'package:isalmi_mon_c10/ui/utils/app_theme.dart';
import 'package:provider/provider.dart';

import '../../../../provider/locale_provider.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  static const englishValue = "en";
  static const arabicValue = "ar";
  String selectedLocale = englishValue;
  late LocaleProvider provider;
  @override
  Widget build(BuildContext context) {
    provider =  Provider.of(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            "Language",
            textAlign: TextAlign.start,
            style: AppTheme.mediumTitleTextStyle,
          ),
          SizedBox(height: 18,),
          buildLanguageDropDownMenu()
        ],
      ),
    );
  }

  buildLanguageDropDownMenu() {
    return Row(
      children: [
        Expanded(
          child: DropdownButton<String>(
            value: selectedLocale,
            items: const [
              DropdownMenuItem(
                value: englishValue,
                child: Text("English"),
              ),
              DropdownMenuItem(
                value: arabicValue,
                child: Text("العربيه"),
              )
            ],
            isExpanded: true,
            onChanged: (String? value) {
              if (value == null) return;
              selectedLocale = value;
              provider.setNewLocale(selectedLocale);
            },
          ),
        ),
      ],
    );
  }
}
