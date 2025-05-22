import 'package:evently/models/event.dart';
import 'package:evently/provider/theme_provider.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class EventItem extends StatefulWidget {

   EventItem({super.key, required this.event});
  Event event;

  @override
  State<EventItem> createState() => _EventItemState();
}

class _EventItemState extends State<EventItem> {

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
          image:  DecorationImage(
              image: AssetImage(widget.event.image), fit: BoxFit.fill)),
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
                  widget.event.dateTime.day.toString(),
                  style: AppStylse.bold20Primary,
                ),
                Text(
                  DateFormat('MMM').format(widget.event.dateTime),
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
                Text(
                  widget.event.title,
                  style: themeProvider.currentTheme == ThemeMode.light
                      ? AppStylse.bold14Black
                      : AppStylse.bold14White,
                ),
                IconButton(
                    onPressed: () {
                      widget.event.isFav = !widget.event.isFav;
                      setState(() {});
                    },
                    icon: Icon(
                      widget.event.isFav
                          ? CupertinoIcons.heart_fill
                          : CupertinoIcons.heart,
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
