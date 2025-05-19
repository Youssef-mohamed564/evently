import 'package:evently/provider/theme_provider.dart';
import 'package:evently/ui/home/tabs/profile/lang_bottom_sheet.dart';
import 'package:evently/ui/home/tabs/profile/theme_bottom_sheet.dart';
import 'package:evently/utils/app_assets.dart';
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
    var size = MediaQuery.of(context).size;
    var languageProvider = Provider.of<LanguageProvider>(context);
    var themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
          appBar: AppBar(
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(64))),
    backgroundColor: AppColor.primaryLight,
    title: Row(
      children: [
        Image.asset(
          AppAsset.routeImg,
          width: size.width * .3,
        ),
        SizedBox(
          width: size.width * .02,
        ),
        Column(
          children: [
            Text(
              'Route Academy',
              style: AppStylse.bold24White,
            ),
            SizedBox(
              height: size.height * .02,
            ),
            Text(
              '''johnSafwatjohnsafwat.route
            @gmail.com''',
              style: AppStylse.bold12White,
            )
          ],
        )
      ],
    ),
    toolbarHeight: size.height * .18,
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
                      themeProvider.currentTheme == ThemeMode.light
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
        ),
        const Spacer(),
        ElevatedButton(
            style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                backgroundColor: AppColor.redColor,
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * .06,
                    vertical: size.height * .006)),
            onPressed: () {},
            child: Row(
              children: [
                Image.asset('assets/images/Exit.png'),
                SizedBox(
                  width: size.width * .02,
                ),
                Text(
                  AppLocalizations.of(context)!.logout,
                  style: AppStylse.bold16White,
                )
              ],
            )),
        SizedBox(
          height: size.height * .028,
        )
      ],
    ),
          ),
        );
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(
        context: context, builder: (context) => const LangBottomSheet());
  }

  void showThemeBottomSheet() {
    showModalBottomSheet(
        context: context, builder: (context) => ThemeBottomSheet());
  }
}
