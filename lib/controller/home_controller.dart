import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_apps/model/todo_model.dart';

class HomeController extends GetxController {
  var isLoading = false.obs;
  final titleTextCtrl = TextEditingController();
  final desTextCtrl = TextEditingController();

  /// firebase
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

// add data
  addTodos() async {
    isLoading(true);
    try {
      TodoModel data = TodoModel(
          title: titleTextCtrl.text,
          description: desTextCtrl.text,
          timestamp: Timestamp.now());

      await _firebaseFirestore.collection("Todos").doc().set(data.toJson());
      titleTextCtrl.clear();
      desTextCtrl.clear();
      Get.back();
      Get.snackbar(
        "Successful",
        "Add Todos Completed",
      );

      isLoading(false);
    } on Exception catch (e) {
      debugPrint("Data add error $e");

      isLoading(false);
    }
  }

  Stream<QuerySnapshot> stream() {
    return _firebaseFirestore
        .collection("Todos")
        .orderBy("timestamp", descending: true)
        .snapshots();
  }
}
