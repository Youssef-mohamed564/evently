import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/models/event.dart';
import 'package:evently/models/my_user.dart';


class FirebaseUtils {
  static CollectionReference<Event> getEventToFireStore(String uid) {
    return getUsersCollection().doc(uid).collection('Events').withConverter<Event>(
        fromFirestore: (snapshot, options) =>
            Event.fromFireStore(snapshot.data()!),
        toFirestore: (event, options) => event.toFireStore());
  }

  static CollectionReference<MyUser> getUsersCollection() {
    return FirebaseFirestore.instance
        .collection(MyUser.collectionName)
        .withConverter<MyUser>(
            fromFirestore: (snapshot, options) =>
                MyUser.fromFireStore(snapshot.data()!),
            toFirestore: (user, options) => user.toFireStore());
  }
static Future<MyUser?> readUserFromFireStore(String id)async{
    var querySnapShot= await getUsersCollection().doc(id).get();
    return querySnapShot.data();
}
  static Future<void> addUserToFireStore(MyUser user) {
   return getUsersCollection().doc(user.id).set(user);
  }

  static Future<void> addEventToFireStore(Event event,String uid) {
    var eventCollection = getEventToFireStore(uid);
    DocumentReference<Event> docRef = eventCollection.doc();
    event.id = docRef.id;
    return docRef.set(event);
  } 
  static Future<void> editEventToFireStore(Event event,String uid) {
    var eventCollection = getEventToFireStore(uid);
    DocumentReference<Event> docRef = eventCollection.doc();
    event.id = docRef.id;
    return docRef.update(event.toFireStore());
  }

}
