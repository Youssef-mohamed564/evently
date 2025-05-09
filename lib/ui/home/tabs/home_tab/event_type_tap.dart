import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:evently/provider/theme_provider.dart';
import 'package:provider/provider.dart';
class EventTypeTap extends StatelessWidget {
  final String eventType;
  final String? iconPath;
  final bool isSelected;
  const EventTypeTap(
      {super.key,
      required this.eventType,
       this.iconPath,
      required this.isSelected});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);

    return Container(

      decoration: BoxDecoration(
          border: const Border.fromBorderSide(
              BorderSide(color: AppColor.whiteColor, width: 1)),
          borderRadius: BorderRadius.circular(16),
          color: isSelected?Theme.of(context).cardColor:Theme.of(context).primaryColor),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0,vertical: 2),
        child: Row(
          children: [
            ImageIcon(
              AssetImage(iconPath??'assets/images/all_icon.png'),
              color: isSelected?AppColor.primaryLight:AppColor.whiteColor,
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              eventType,
              style: isSelected?AppStylse.medium16Primary:AppStylse.medium16White,
            )
          ],
        ),
      ),
    );
  }
}
