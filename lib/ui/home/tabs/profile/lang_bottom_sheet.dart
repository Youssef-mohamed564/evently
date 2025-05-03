import 'package:evently/provider/language_provider.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class LangBottomSheet extends StatelessWidget {
  const LangBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<LanguageProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: InkWell(
            onTap: () {
              languageProvider.changeLanguage('en');
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context)!.english,
                  style: languageProvider.currentLanguage == 'en'
                      ? Theme.of(context)
                          .textTheme
                          .headlineLarge
                          ?.copyWith(color: AppColor.primaryLight)
                      : Theme.of(context).textTheme.headlineMedium,
                ),
                languageProvider.currentLanguage == 'en'
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
              languageProvider.changeLanguage('ar');
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context)!.arabic,
                  style: languageProvider.currentLanguage == 'ar'
                      ? Theme.of(context)
                          .textTheme
                          .headlineLarge
                          ?.copyWith(color: AppColor.primaryLight)
                      : Theme.of(context).textTheme.headlineMedium,
                ),
                languageProvider.currentLanguage == 'ar'
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
