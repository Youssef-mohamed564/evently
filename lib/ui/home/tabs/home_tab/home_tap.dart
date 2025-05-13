import 'package:evently/provider/language_provider.dart';
import 'package:evently/provider/theme_provider.dart';
import 'package:evently/ui/home/tabs/home_tab/event_item.dart';
import 'package:evently/ui/home/tabs/home_tab/event_type_tap.dart';
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
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<String> eventNameList = [
      AppLocalizations.of(context)!.all,
      AppLocalizations.of(context)!.sport,
      AppLocalizations.of(context)!.birthday,
      AppLocalizations.of(context)!.meeting,
      AppLocalizations.of(context)!.gaming,
      AppLocalizations.of(context)!.workshop,
      AppLocalizations.of(context)!.book_club,
      AppLocalizations.of(context)!.exhibition,
      AppLocalizations.of(context)!.holiday,
      AppLocalizations.of(context)!.eating,
    ];
    List<String> eventIconList = [];
    var languageProvider = Provider.of<LanguageProvider>(context);
    var themeProvider = Provider.of<ThemeProvider>(context);

    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24))),
        toolbarHeight: 170,
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
            const SizedBox(
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
            width: 10,
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
        bottom: PreferredSize(
            preferredSize: Size(size.width, 0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    height: 30,
                    width: size.width * .911,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: eventNameList.map((eventName) {
                        return GestureDetector(
                          onTap: () {
                            selectedIndex = eventNameList.indexOf(eventName);
                            setState(() {});
                          },
                          child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 6.0),
                              child: EventTypeTap(
                                  selectedBackgroundColor:
                                      themeProvider.currentTheme ==
                                              ThemeMode.dark
                                          ? AppColor.primaryLight
                                          : Colors.white,
                                  selectedTextColor:
                                      themeProvider.currentTheme ==
                                              ThemeMode.dark
                                          ? Colors.white
                                          : AppColor.primaryLight,
                                  eventType: eventName,
                                  isSelected: selectedIndex ==
                                      eventNameList.indexOf(eventName))),
                        );
                      }).toList(),
                    ),
                  ),
                )
              ],
            )),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemBuilder: (context, index) {
                    return EventItem();
                  },
                  itemCount: 6))
        ],
      ),
    );
  }
}
