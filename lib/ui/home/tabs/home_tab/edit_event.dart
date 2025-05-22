import 'package:evently/firebase_utils.dart';
import 'package:evently/models/event.dart';
import 'package:evently/provider/event_list_provider.dart';
import 'package:evently/provider/theme_provider.dart';
import 'package:evently/provider/user_provider.dart';
import 'package:evently/ui/home/tabs/home_tab/choose_date_time.dart';
import 'package:evently/ui/home/widgets/custom_text_field.dart';
import 'package:evently/utils/app_assets.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:evently/ui/home/tabs/home_tab/event_type_tap.dart';

class EditEvent extends StatefulWidget {
  static const String routeName = '/add';
  EditEvent({
    super.key,
  });

  @override
  State<EditEvent> createState() => _EditEventState();
}

class _EditEventState extends State<EditEvent> {
  late EventListProvider eventListProvider;
  int selectedIndex = 0;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  TextEditingController titleControler = TextEditingController();
  TextEditingController descriptionControler = TextEditingController();
  var formKey = GlobalKey<FormState>();
  String selectedImg = '';
  String selectedEventName = '';

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
    List<String> eventImageList = [
      AppAsset.sportImg,
      AppAsset.sportImg,
      AppAsset.birthdayImg,
      AppAsset.meetingImg,
      AppAsset.gamingImg,
      AppAsset.workShopImg,
      AppAsset.bookClubImg,
      AppAsset.exhiImg,
      AppAsset.holidayImg,
      AppAsset.eatingImg,
    ];
    selectedImg = eventImageList[selectedIndex];
    selectedEventName = eventNameList[selectedIndex];
    var size = MediaQuery.of(context).size;
    var themeProvider = Provider.of<ThemeProvider>(context);
    eventListProvider = Provider.of<EventListProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeProvider.currentTheme == ThemeMode.dark
            ? AppColor.PrimaryDark
            : Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: AppColor.primaryLight,
            )),
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!.create_event,
          style: AppStylse.medium20Primary,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
        child: ListView(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: size.height * .25,
                margin: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: AppColor.primaryLight,
                    ),
                    image: DecorationImage(
                        image: AssetImage(selectedImg), fit: BoxFit.fill)),
              ),
              Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: SizedBox(
                              height: 30,
                              width: size.width * .91,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: eventNameList.map((eventName) {
                                  return GestureDetector(
                                    onTap: () {
                                      selectedIndex =
                                          eventNameList.indexOf(eventName);
                                      setState(() {});
                                    },
                                    child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 6.0),
                                        child: EventTypeTap(
                                            borderColor: AppColor.primaryLight,
                                            selectedBackgroundColor:
                                            AppColor.primaryLight,
                                            selectedTextColor: Colors.white,
                                            unSelectedTextColor:
                                            AppColor.primaryLight,
                                            eventType: eventName,
                                            isSelected: selectedIndex ==
                                                eventNameList
                                                    .indexOf(eventName))),
                                  );
                                }).toList(),
                              ),
                            ),
                          )
                        ],
                      ),
                      Text(
                        AppLocalizations.of(context)!.title,
                        style: themeProvider.currentTheme == ThemeMode.dark
                            ? AppStylse.medium16White
                            : AppStylse.medium16Black,
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      CustomTextField(
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Please Enter title for event';
                          } else {
                            return null;
                          }
                        },
                        controller: titleControler,
                        prefixIcon: Image.asset(
                          AppAsset.noteEditIcon,
                          scale: size.width * .004,
                        ),
                        hintText: AppLocalizations.of(context)!.event_title,
                        minLines: 1,
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        AppLocalizations.of(context)!.description,
                        style: themeProvider.currentTheme == ThemeMode.dark
                            ? AppStylse.medium16White
                            : AppStylse.medium16Black,
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      CustomTextField(
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Please Enter description for event';
                          } else {
                            return null;
                          }
                        },
                        controller: descriptionControler,
                        hintText:
                        AppLocalizations.of(context)!.event_description,
                        minLines: 4,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      ChooseDateTime(
                          chooseTime: chooseTime,
                          choosedTime: selectedTime == null
                              ? AppLocalizations.of(context)!.choose_time
                              : selectedTime!.format(context),
                          chooseDate: chooseDate,
                          choosedDate: selectedDate == null
                              ? AppLocalizations.of(context)!.choose_date
                              : '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}'),
                      const SizedBox(
                        height: 62,
                      ),
                      FilledButton(
                        onPressed: () {
                          editEvent();
                        },
                        style: const ButtonStyle(
                            padding: WidgetStatePropertyAll(
                                EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 12)),
                            backgroundColor:
                            WidgetStatePropertyAll(AppColor.primaryLight),
                            shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(16))))),
                        child: Text(
                          'Edit Event',
                          style: AppStylse.medium20White,
                        ),
                      ),
                      const SizedBox(
                        height: 8
                      )
                    ],
                  ))
            ],
          ),
        ]),
      ),
    );
  }

  void chooseDate() async {
    var selecteddate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2030));
    selectedDate = selecteddate;
    setState(() {});
  }

  void chooseTime() async {
    var selectedtime =
    await showTimePicker(context: context, initialTime: TimeOfDay.now());
    selectedtime!.format(context);
    selectedTime = selectedtime;
    setState(() {});
  }

  editEvent() {
    if (formKey.currentState?.validate() == true) {
      var userProvider = Provider.of<UserProvider>(context,listen: false);

      FirebaseUtils.editEventToFireStore(
          Event(

              dateTime: selectedDate!,
              description: descriptionControler.text,
              title: titleControler.text,
              time: selectedTime!.format(context),
              image: selectedImg,
              catigory: selectedEventName),
          userProvider.currentUser!.id).then((value){
        eventListProvider.getAllEvents(userProvider.currentUser!.id);
        Navigator.of(context).pop();
        Fluttertoast.showToast(
            msg: "event edited successfully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM_RIGHT,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        print(titleControler.text);
      })


          .timeout(Duration(milliseconds: 300), onTimeout: () {
        eventListProvider.getAllEvents(userProvider.currentUser!.id);
        Fluttertoast.showToast(
            msg: "event edited successfully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM_RIGHT,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        print(titleControler.text);
      });
    }
  }



}
