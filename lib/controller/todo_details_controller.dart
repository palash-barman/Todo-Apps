import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_apps/model/todo_model.dart';

class TodoDetailsController extends GetxController {
  var title = "".obs;
  var description = "".obs;
  var isLoading = false.obs;
  var isDeleteLoading = false.obs;

  final titileTextCtrl = TextEditingController();
  final desTextCtrl = TextEditingController();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void updateData(
    String documentId,
  ) async {
    isLoading(true);
    TodoModel data =
        TodoModel(title: titileTextCtrl.text, description: desTextCtrl.text);
    try {
      await _firestore
          .collection('Todos')
          .doc(documentId)
          .update(data.toJson());
      title.value = titileTextCtrl.text;
      description.value = desTextCtrl.text;
      Get.back();
      isLoading(false);
    } on Exception catch (e) {
      debugPrint("Update data error : $e");

      isLoading(false);
    }
  }

  Future<void> deleteDocument(String documentId) async {
    isDeleteLoading(true);
    try {
      await FirebaseFirestore.instance
          .collection('Todos')
          .doc(documentId)
          .delete();

      Get.back();
      debugPrint('Document deleted successfully');
      isDeleteLoading(false);
    } catch (e) {
      debugPrint('Error deleting document: $e');
      isDeleteLoading(false);
    }
  }
}
