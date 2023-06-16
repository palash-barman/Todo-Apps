import 'package:cloud_firestore/cloud_firestore.dart';

class TodoModel {
  String title;
  String? id;
  String description;
  Timestamp? timestamp;

  TodoModel({
    this.id,
    this.timestamp,
    required this.title,
    required this.description,
  });

  Map<String, dynamic> toJson() => {
        "timestamp": timestamp,
        "title": title,
        "description": description,
      };

  static TodoModel fromSnap(DocumentSnapshot snapshot) {
    Map<String, dynamic> snap = snapshot.data() as Map<String, dynamic>;

    return TodoModel(
      id: snapshot.id,
      title: snap["title"],
      description: snap["description"],
    );
  }
}
