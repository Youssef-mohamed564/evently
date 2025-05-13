import 'package:evently/ui/home/tabs/favorite/favorite_tab.dart';
import 'package:evently/ui/home/tabs/home_tab/add_event.dart';
import 'package:evently/ui/home/tabs/profile/profile_tab.dart';
import 'package:evently/ui/home/tabs/home_tab/home_tap.dart';
import 'package:evently/ui/home/tabs/map/map_tap.dart';
import 'package:evently/utils/app_assets.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

int selectedIndex = 0;

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> tabs=[HomeTap(),MapTap(),FavoriteTab(),ProfileTab(),];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: Theme(
        data: Theme.of(context)
            .copyWith(canvasColor: Theme.of(context).primaryColor),
        child: BottomNavigationBar(elevation: 0,
            currentIndex: selectedIndex,
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
            },
            type: BottomNavigationBarType.fixed,
            items: [
              buildBottomNavigationBarItems(
                  selectedIconName: AppAsset.homeIcon,
                  unSelectedIconName: AppAsset.unSelectedHomeIcon,
                  label: AppLocalizations.of(context)!.home),
              buildBottomNavigationBarItems(
                selectedIconName: AppAsset.selectedMapIcon,
                unSelectedIconName: AppAsset.unSelectedMapIcon,
                label: AppLocalizations.of(context)!.map,
              ),
              buildBottomNavigationBarItems(
                  selectedIconName: AppAsset.selectedHeartIcon,
                  unSelectedIconName: AppAsset.unSelectedHeartIcon,
                  label: AppLocalizations.of(context)!.favorite),
              buildBottomNavigationBarItems(
                  selectedIconName: AppAsset.selectedProfileIcon,
                  unSelectedIconName: AppAsset.unSelectedProfileIcon,
                  label: AppLocalizations.of(context)!.profile)
            ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
         Navigator.of(context).pushNamed(AddEvent.routeName);
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: tabs[selectedIndex],
    );
  }
}

BottomNavigationBarItem buildBottomNavigationBarItems(
    {String? selectedIconName,
    String? unSelectedIconName,
    required String label}) {
  return BottomNavigationBarItem(
      backgroundColor: AppColor.whiteColor,
      icon: ImageIcon(AssetImage(unSelectedIconName!)),
      activeIcon: ImageIcon(AssetImage(selectedIconName!)),
      label: label);
}
