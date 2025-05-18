import 'package:evently/provider/theme_provider.dart';
import 'package:evently/utils/app_assets.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventItem extends StatelessWidget {
  const EventItem({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);

    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height * .25,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: AppColor.primaryLight,
          ),
          image: const DecorationImage(
              image: AssetImage(AppAsset.birthdayImg), fit: BoxFit.fill)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.all(8),
            width: 44,
            height: 51,
            decoration: BoxDecoration(
                color: themeProvider.currentTheme == ThemeMode.light
                    ? AppColor.whiteBgColor
                    : AppColor.PrimaryDark,
                borderRadius: BorderRadius.circular(8)),
            child: Column(
              children: [
                Text(
                  '22',
                  style: AppStylse.bold20Primary,
                ),
                Text(
                  'Oct',
                  style: AppStylse.bold14Primary,
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
                color: themeProvider.currentTheme == ThemeMode.light
                    ? AppColor.whiteBgColor
                    : AppColor.PrimaryDark,
                borderRadius: BorderRadius.circular(8)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'This is a Birthday Party ',
                    style: themeProvider.currentTheme == ThemeMode.light
                        ? AppStylse.bold14Black
                        : AppStylse.bold14White,
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon:  Icon(
                      CupertinoIcons.heart,
                      color: AppColor.primaryLight,
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
