import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/firebase_utils.dart';
import 'package:evently/models/event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class EventListProvider extends ChangeNotifier{
  int selectedIndex = 0;
  List<Event> eventsList=[];
  List<Event> filterList=[];
  List<String> eventNameList=[];

  List<String> getEventNameList(BuildContext context){
    return   eventNameList = [
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
  }
  void getAllEvents()async{
    print('#################################');
    QuerySnapshot<Event> querySnapshot =await FirebaseUtils.getEventToFireStore().get();
    eventsList=querySnapshot.docs.map((doc){
      return doc.data();
    }).toList();
    filterList=eventsList;
    notifyListeners();
    print('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@');

  }

  void getFilteredEnents(){
     filterList = eventsList.where((event){
     return event.catigory == eventNameList[selectedIndex];
    }).toList();
     notifyListeners();
  }
  void changeSelectedIndex(int newSelectedIndex){
    selectedIndex=newSelectedIndex;
    selectedIndex==0?getAllEvents():getFilteredEnents();
  }
}