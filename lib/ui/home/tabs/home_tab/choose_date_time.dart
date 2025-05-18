import 'package:evently/provider/theme_provider.dart';
import 'package:evently/utils/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChooseDateTime extends StatefulWidget {
   ChooseDateTime({
    super.key,
    this.validator,
    required this.chooseDate,
    required this.choosedDate,
    required this.chooseTime,
    required this.choosedTime,
  });
  final Function chooseDate;
  final Function chooseTime;
  String? Function(String?)? validator;

  final String choosedDate;
  final String choosedTime;

  @override
  State<ChooseDateTime> createState() => _ChooseDateTimeState();
}

class _ChooseDateTimeState extends State<ChooseDateTime> {
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);

    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.calendar_month_outlined,
                  color: themeProvider.currentTheme == ThemeMode.dark
                      ? Colors.white
                      : Colors.black),
              const SizedBox(
                width: 8,
              ),
              Text(
                AppLocalizations.of(context)!.event_date,
                style: themeProvider.currentTheme == ThemeMode.dark
                    ? AppStylse.medium16White
                    : AppStylse.medium16Black,
              )
            ],
          ),
          InkWell(
            onTap: () {
              widget.chooseDate();
            },
            child: Text(
              widget.choosedDate,
              style: AppStylse.medium16Primary,
            ),
          )
        ],
      ),
      const SizedBox(
        height: 8,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                CupertinoIcons.clock,
                color: themeProvider.currentTheme == ThemeMode.dark
                    ? Colors.white
                    : Colors.black,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                AppLocalizations.of(context)!.event_time,
                style: themeProvider.currentTheme == ThemeMode.dark
                    ? AppStylse.medium16White
                    : AppStylse.medium16Black,
              )
            ],
          ),
          InkWell(
            onTap: () {
              widget.chooseTime();
            },
            child: Text(
              widget.choosedTime,
              style: AppStylse.medium16Primary,
            ),
          ),
        ],
      ),
    ]);
  }
}
