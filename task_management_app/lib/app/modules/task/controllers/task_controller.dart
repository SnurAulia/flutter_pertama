import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:task_management_app/app/data/controller/auth_controller.dart';

class TaskController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final authCont = Get.find<AuthController>();
  late TextEditingController tittleController,
      descriptionController,
      dueDateController;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    tittleController = TextEditingController();
    descriptionController = TextEditingController();
    dueDateController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    tittleController.dispose();
    descriptionController.dispose();
    dueDateController.dispose();
  }

  void saveUpdateTask(
      {String? tittle,
      String? description,
      String? dueDate,
      String? docId,
      String? type}) async {
    // print(tittle);
    // print(description);
    // print(dueDate);
    // print(docId);
    // print(type);
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    formKey.currentState!.save();

    CollectionReference taskColl = firestore.collection('task');
    CollectionReference usersColl = firestore.collection('users');
    var taskId = DateTime.now().toIso8601String();
    if (type == 'Add') {
      await taskColl.doc(taskId).set({
        'tittle': tittle,
        'description': description,
        'due_Date': dueDate,
        'status': '0',
        'total_task': '0',
        'total_task_finished': '0',
        'task_detail': [],
        'asign_to': [authCont.auth.currentUser!.email],
        'created_by': authCont.auth.currentUser!.email,
      }).whenComplete(() async {
        await usersColl.doc(authCont.auth.currentUser!.email).set({
          'task_id': FieldValue.arrayUnion([taskId])
        }, SetOptions(merge: true));
        Get.back();
        Get.snackbar('Task', 'Sucsessfully $type');
      }).catchError((error) {
        Get.snackbar('Task', 'Error $type');
      });
    } else {
      await taskColl.doc(docId).update({
        'tittle': tittle,
        'description': description,
        'due_Date': dueDate,
      }).whenComplete(() async {
        // await usersColl.doc(authCont.auth.currentUser!.email).set({
        //   'task_id': FieldValue.arrayUnion([taskId])
        // }, SetOptions(merge: true));
        Get.back();
        Get.snackbar('Task', 'Sucsessfully $type');
      }).catchError((error) {
        Get.snackbar('Task', 'Error $type');
      });
    }
  }

  void deleteTask(String taskId) async {
    CollectionReference taskColl = firestore.collection('task');
    CollectionReference usersColl = firestore.collection('users');

    await taskColl.doc(taskId).delete().whenComplete(() async {
      await usersColl.doc(auth.currentUser!.email).set({
        'task_id': FieldValue.arrayRemove([taskId])
      }, SetOptions(merge: true));
      Get.back();
      Get.snackbar('Task', 'Sucsesfuly Deleted');
    });
  }

  void increment() => count.value++;
}
