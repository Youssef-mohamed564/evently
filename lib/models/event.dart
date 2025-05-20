class Event{
  static const String collectionName='Events';
  String id;
  String image;
  String catigory;
  String title;
  String description;
  DateTime dateTime;
  String time;
  bool isFav;
  Event({
    this.id='',
    required this.dateTime,
    required this.description,
    required this.title,
    required this.time,
    required this.image,
    this.isFav =false,
    required this.catigory,
    });
  Event.fromFireStore(Map<String,dynamic>data):this(
  image:data['image'] ,
  id:data['id'] ,
  dateTime:DateTime.fromMillisecondsSinceEpoch(data['dateTime']) ,
  description: data['description'],
  time:data['time'] ,
  title: data['title'],
  isFav: data['isFav'],
  catigory:data['catigory'] ,
  );
  Map<String,dynamic> toFireStore(){
    return{
      'id': id,
      'time': time,
      'title': title,
      'description': description,
      'dateTime': dateTime.millisecondsSinceEpoch,
      'catigory': catigory,
      'isFav': isFav,
      'image': image,

  };}
}