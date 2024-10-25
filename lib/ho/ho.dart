import 'package:adv_exam/cloudFireStroe/CloudFireStroe.dart';
import 'package:adv_exam/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var bookController = Get.put(BookController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Book'),
        actions: [
          IconButton(onPressed: () {
            String title = bookController.txtTitle.text;
            String author = bookController.txtAuthor.text;
            String status = bookController.txtStatust.text;
bookController.insertRecord(title, author, status);
           CloudFireBaseStoreServices.cloudFireBaseStoreServices.addUser(title, author, status);

          }, icon: Icon(Icons.sync_alt))
        ],
      ),
      body: FutureBuilder(
        future: bookController.getRecords(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("error");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            Text("w");
          }
          return Obx(
            () => ListView.builder(
              itemCount: bookController.data.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap:() {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Update"),
                          content: Column(
                            children: [
                              TextField(
                                controller: bookController.txtTitle,
                                decoration: InputDecoration(labelText: "title"),
                              ),
                              TextField(
                                controller: bookController.txtAuthor,
                                decoration: InputDecoration(labelText: "author"),
                              ),
                              TextField(
                                controller: bookController.txtStatust,
                                decoration: InputDecoration(labelText: "statust"),
                              ),
                            ],
                          ),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Get.back();
                                },
                                child: Text('CEN')),
                            IconButton(
                                onPressed: () async {
                                  await  bookController.delectRecord(
                                      bookController.data[index]['id']
                                          );



                                  Get.back();
                                },
                                icon: Icon(Icons.delete)),
                            TextButton(
                                onPressed: () async {
                                  await     bookController.updateRecords(
                                    bookController.data[index]['title'],
                                      bookController.data[index]['author'],
                                      bookController.data[index]['status']
                                      ,
                                      bookController.data[index]['id']

                                  );
                                  Get.back();
                                },
                                child: Text('save'))
                          ],
                        );
                      },
                    );
                  } ,
                  child: ListTile(

                      title: Text(bookController.data[index]['title']),
                      //   //
                      subtitle: Text(bookController.data[index]['author']),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(bookController.data[index]['status']),

                        ],
                      )),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('enter the details'),
                content: Column(
                  children: [
                    TextField(
                      controller: bookController.txtTitle,
                      decoration: InputDecoration(labelText: "Enter the Book Title"),
                    ),
                    TextField(
                      controller: bookController.txtAuthor,
                      decoration: InputDecoration(labelText: "Enter the Book Author name"),
                    ),
                    TextField(
                      controller: bookController.txtStatust,
                      decoration: InputDecoration(labelText: "Enter the Book status"),
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text("Cencle")),
                  TextButton(
                      onPressed: () {
                        String title = bookController.txtTitle.text;
                        String author = bookController.txtAuthor.text;
                        String status = bookController.txtStatust.text;
                        bookController.insertRecord(title, author, status);


                        bookController.txtTitle.clear();
                        bookController.txtAuthor.clear();
                        bookController.txtStatust.clear();
                        Get.back();
                      },
                      child: Text("Save"))
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
