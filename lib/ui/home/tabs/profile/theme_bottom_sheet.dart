import 'package:evently/provider/theme_provider.dart';

import 'package:evently/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class ThemeBottomSheet extends StatelessWidget {
  const ThemeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
  //  var languageProvider = Provider.of<LanguageProvider>(context);
    var themeProvider = Provider.of<ThemeProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: InkWell(
            onTap: () {
              themeProvider.changeTheme(ThemeMode.light);
            },
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context)!.light,
                  style: themeProvider.currentTheme == ThemeMode.light
                      ? Theme.of(context)
                      .textTheme
                      .headlineLarge
                      ?.copyWith(color: AppColor.primaryLight)
                      : Theme.of(context).textTheme.headlineMedium,
                ),
                themeProvider.currentTheme == ThemeMode.light
                    ? const Icon(
                  Icons.check,
                  color: AppColor.primaryLight,
                )
                    : const Icon(null)
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: InkWell(
            onTap: () {
              themeProvider.changeTheme(ThemeMode.dark);
            },
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context)!.dark,
                  style: themeProvider.currentTheme == ThemeMode.dark
                      ? Theme.of(context)
                      .textTheme
                      .headlineLarge
                      ?.copyWith(color: AppColor.primaryLight)
                      : Theme.of(context).textTheme.headlineLarge,
                ), themeProvider.currentTheme == ThemeMode.dark
                    ? const Icon(
                  Icons.check,
                  color: AppColor.primaryLight,
                )
                    : const Icon(null)
              ],
            ),
          ),
        )
      ],
    );
  }
}
