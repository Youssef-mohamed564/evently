import 'package:evently/utils/app_colors.dart';
import 'package:flutter/material.dart';


class EventTypeTap extends StatelessWidget {
  final String eventType;
  final String? iconPath;
  final bool isSelected;
  final Color? selectedBackgroundColor;
  final Color? selectedTextColor;
  final Color? borderColor;
  final Color? unSelectedTextColor;
  final Color? unSelectedBackgroundColor;
  const EventTypeTap(
      {super.key,
      required this.eventType,
      this.iconPath,
      required this.isSelected,
      this.selectedBackgroundColor,
      this.unSelectedBackgroundColor,
      this.selectedTextColor,
      this.unSelectedTextColor,
      this.borderColor});

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
          border: Border.fromBorderSide(
              BorderSide(color: borderColor ?? AppColor.whiteColor, width: 1)),
          borderRadius: BorderRadius.circular(16),
          color: isSelected
              ? selectedBackgroundColor ?? Theme.of(context).cardColor
              : unSelectedBackgroundColor ?? AppColor.transparentColor),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 2),
        child: Row(
          children: [
            //  ImageIcon(
            //  AssetImage(iconPath ?? 'assets/images/all_icon.png'),
            // color: isSelected ? AppColor.primaryLight : AppColor.whiteColor,
            //   ),
            const SizedBox(
              width: 4,
            ),
            Text(eventType,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: isSelected
                        ? selectedTextColor ?? AppColor.primaryLight
                        : unSelectedTextColor ?? Colors.white))
          ],
        ),
      ),
    );
  }
}
