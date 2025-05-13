import 'package:evently/ui/home/tabs/home_tab/event_item.dart';
import 'package:evently/ui/home/widgets/custom_text_field.dart';
import 'package:evently/utils/app_assets.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FavoriteTab extends StatelessWidget {
  const FavoriteTab({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: size.height * 0.08,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:16),
            child: CustomTextField(minLines: 1,
              hintText: AppLocalizations.of(context)!.search_event,
              borderColor: AppColor.primaryLight,
              hintStyle: AppStylse.bold14Primary,
              prefixIcon: Image.asset(
                AppAsset.searchIcon,
                scale: size.width * .008,
              ),
            ),
          ),
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
