import 'package:evently/provider/theme_provider.dart';
import 'package:evently/ui/home/tabs/profile/lang_bottom_sheet.dart';
import 'package:evently/ui/home/tabs/profile/theme_bottom_sheet.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:evently/provider/language_provider.dart';
import 'package:provider/provider.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<LanguageProvider>(context);
    var themeProvider = Provider.of<ThemeProvider>(context);

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryLight,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
              child: Text(
                AppLocalizations.of(context)!.language,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            InkWell(
              onTap: showLanguageBottomSheet,
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: AppColor.primaryLight,
                    width: 2,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                          languageProvider.currentLanguage == 'ar'
                              ? AppLocalizations.of(context)!.arabic
                              : AppLocalizations.of(context)!.english,
                          style: AppStylse.bold20Primary),
                    ),
                    const Icon(
                      Icons.arrow_drop_down,
                      color: AppColor.primaryLight,
                      size: 35,
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 12.0),
              child: Text(
                AppLocalizations.of(context)!.theme,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            InkWell(
              onTap: showThemeBottomSheet,
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: AppColor.primaryLight,
                    width: 2,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                          themeProvider.currentTheme==ThemeMode.light
                              ? AppLocalizations.of(context)!.light
                              : AppLocalizations.of(context)!.dark,
                          style: AppStylse.bold20Primary),
                    ),
                    const Icon(
                      Icons.arrow_drop_down,
                      color: AppColor.primaryLight,
                      size: 35,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(
        context: context, builder: (context) => const LangBottomSheet());
  }
  void showThemeBottomSheet() {
    showModalBottomSheet(
        context: context, builder: (context) => ThemeBottomSheet() );
  }
}
