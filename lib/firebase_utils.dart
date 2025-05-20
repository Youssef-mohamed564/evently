import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/models/event.dart';

class FirebaseUtils{

  static CollectionReference<Event> getEventToFireStore(){
    return FirebaseFirestore.instance.collection('Events').withConverter<Event>(
        fromFirestore: (snapshot,options)=>Event.fromFireStore(snapshot.data()!),
        toFirestore: (event,options)=>event.toFireStore());
  }
  static Future<void> addEventToFireStore(Event event){
    var eventCollection = getEventToFireStore();
    DocumentReference<Event> docRef= eventCollection.doc();
    event.id = docRef.id;
    return docRef.set(event);
  }

}