import 'package:adv_exam/bookHelper/bookHelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class BookController extends GetxController {
  TextEditingController txtTitle = TextEditingController();
  TextEditingController txtAuthor = TextEditingController();
  TextEditingController txtStatust = TextEditingController();
  TextEditingController txtEmail=TextEditingController();
  TextEditingController txtPass=TextEditingController();
  TextEditingController txtName=TextEditingController();
  TextEditingController txtPhone=TextEditingController();
  RxList data = [].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    intDb();
  }

  Future<void> intDb() async {
    await BookHelper.bookHelper.database;
    await getRecords();
  }

  Future<void> insertRecord(String title, String author, String status) async {
    await BookHelper.bookHelper.insertData(title, author, status);
    await getRecords();
  }

  Future<void> getRecords() async {
    data.value = await BookHelper.bookHelper.readData();
  }
  Future<void> delectRecord(int id)
  async {
   await BookHelper.bookHelper.delectData(id);
  }

  Future<void> updateRecords(
      String title, String author, String status, int id) async {
    await BookHelper.bookHelper.updateData(id, title, author, status);
  }

}
