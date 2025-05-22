import 'package:evently/provider/event_list_provider.dart';
import 'package:evently/provider/language_provider.dart';
import 'package:evently/provider/theme_provider.dart';
import 'package:evently/provider/user_provider.dart';
import 'package:evently/ui/home/tabs/home_tab/edit_event.dart';
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
int getIndex(int ind){
  return ind;
}
  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<LanguageProvider>(context);
    var themeProvider = Provider.of<ThemeProvider>(context);
    var eventListProvider = Provider.of<EventListProvider>(context);
    eventListProvider.getEventNameList(context);
    var size = MediaQuery.of(context).size;
    var userProvider =Provider.of<UserProvider>(context);
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
              userProvider.currentUser?.name??'',
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
                      children:
                          eventListProvider.eventNameList.map((eventName) {
                        return GestureDetector(
                          onTap: () {
                            eventListProvider.changeSelectedIndex(eventListProvider
                                .eventNameList
                                .indexOf(eventName),userProvider.currentUser!.id);
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
                                  isSelected: eventListProvider.selectedIndex ==
                                      eventListProvider.eventNameList
                                          .indexOf(eventName))),
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
              child: eventListProvider.filterList.isEmpty
                  ? Center(
                      child:
                          Text(AppLocalizations.of(context)!.no_events_found,style: AppStylse.bold20Black,))
                  : ListView.builder(
                      itemBuilder: (context, index) {
                        return GestureDetector(onTap: () {
                          Navigator.of(context).pushNamed(EditEvent.routeName);

                         },
                          child: EventItem(
                            event: eventListProvider.filterList[index],
                          ),
                        );
                      },
                      itemCount: eventListProvider.filterList.length))
        ],
      ),
    );
  }
  moveToEdit(int index){

  }
}
