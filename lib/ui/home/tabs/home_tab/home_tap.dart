import 'package:evently/provider/language_provider.dart';
import 'package:evently/provider/theme_provider.dart';
import 'package:evently/utils/app_assets.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeTap extends StatefulWidget {
  const HomeTap({super.key});

  @override
  State<HomeTap> createState() => _HomeTapState();
}

class _HomeTapState extends State<HomeTap> {
  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<LanguageProvider>(context);
    var themeProvider = Provider.of<ThemeProvider>(context);

    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 174,
        backgroundColor: Theme.of(context).primaryColor,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${AppLocalizations.of(context)!.welcome_back} ✨',
              style: AppStylse.bold14White,
            ),
            Text(
              'Youssef Mohamed',
              style: AppStylse.bold24White,
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: [
                const ImageIcon(
                    color: Colors.white,
                    AssetImage(
                      AppAsset.unSelectedMapIcon,
                    )),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  'Cairo , Egypt',
                  style: AppStylse.bold14White,
                ),
              ],
            )
          ],
        ),
        actions: [
          InkWell(
            onTap: () {
              themeProvider.changeTheme(
                  themeProvider.currentTheme == ThemeMode.light
                      ? ThemeMode.dark
                      : ThemeMode.light);
            },
            child: ImageIcon(
              const AssetImage(AppAsset.sunIcon),
              color: themeProvider.currentTheme == ThemeMode.light
                  ? Colors.white
                  : Colors.brown,
            ),
          ),
          const SizedBox(
            width: 14,
          ),
          GestureDetector(
            onTap: () {
              languageProvider.changeLanguage(
                  languageProvider.currentLanguage == 'ar' ? 'en' : 'ar');
            },
            child: Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                  color: AppColor.whiteColor,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(8)),
              child: Center(
                  child: Text(
                languageProvider.currentLanguage == 'ar' ? 'عر' : 'EN',
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 14),
              )),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
        ],
      ),
    );
  }
}
