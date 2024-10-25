// import 'package:adv_exam/controller/controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class homePage extends StatelessWidget {
//   const homePage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     var bookController = Get.put(BookController());
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("BOOK APP"),
//       ),
//       body:
//       // FutureBuilder(
//       //   future: bookController.getRecord(),
//       //   builder: (context, snapshot) {
//       //     if (snapshot.hasError) {
//       //       return Text("error");
//       //     }
//       //     if (snapshot.connectionState == ConnectionState.waiting) {
//       //       return Text("wating");
//       //     }
//       //
//       //     return Obx(
//       //       () =>  ListView.builder(
//       //         itemCount: bookController.data.length,
//       //         itemBuilder: (context, index) {
//       //
//       //           return ListTile(
//       //
//       //             // title: Text(bookController.data[index]['title']),
//       //             // subtitle: Text(bookController.data[index]['author']),
//       //             // trailing: Text(bookController.data[index]['status']),
//       //             title: Text("dcd"),
//       //
//       //           );
//       //         },
//       //       ),
//       //     );
//       //   },
//       // ),
//       // ListTile(
//       //   t
//       // ),
//       floatingActionButton: FloatingActionButton(
//         // onPressed: () {
//         //   showDialog(
//         //     context: context,
//         //     builder: (context) {
//         //       return AlertDialog(
//         //         title: Text('Enter the book detalis'),
//         //         content: Column(
//         //           children: [
//         //             TextField(
//         //               controller: bookController.txtTitle,
//         //               decoration: InputDecoration(labelText: "titel"),
//         //             ),
//         //             TextField(
//         //               controller: bookController.txtAuthor,
//         //               decoration: InputDecoration(labelText: "Author"),
//         //             ),
//         //             TextField(
//         //               controller: bookController.txtStatust,
//         //               decoration: InputDecoration(labelText: "Status"),
//         //             )
//         //           ],
//         //         ),
//         //         actions: [
//         //           TextButton(
//         //               onPressed: () {
//         //                 Get.back();
//         //               },
//         //               child: Text("Cencle")),
//         //           TextButton(
//         //               onPressed: () {
//         //                 String title = bookController.txtTitle.text;
//         //                 String author = bookController.txtAuthor.text;
//         //                 String status = bookController.txtStatust.text;
//         //                 bookController.insertRecord(title, author, status);
//         //
//         //                 Get.back();
//         //                 bookController.txtTitle.clear();
//         //                 bookController.txtAuthor.clear();
//         //                 bookController.txtStatust.clear();
//         //               },
//         //               child: Text("save")),
//         //         ],
//         //       );
//         //     },
//         //   );
//         // },
//         onPressed: () {
//           showDialog(
//             context: context,
//             builder: (context) {
//               return AlertDialog(
//                 title: Text('enter the details'),
//                 content: Column(
//                   children: [
//                     TextField(
//                       controller: bookController.txtTitle,
//                       decoration: InputDecoration(labelText: "title"),
//                     ),
//                     TextField(
//                       controller: bookController.txtAuthor,
//                       decoration: InputDecoration(labelText: "author"),
//                     ),
//                     TextField(
//                       controller: bookController.txtStatust,
//                       decoration: InputDecoration(labelText: "stutus"),
//                     ),
//                   ],
//                 ),
//                 actions: [
//                   TextButton(
//                       onPressed: () {
//                         Get.back();
//                       },
//                       child: Text("Cencle")),
//                   TextButton(
//                       onPressed: () {
//                         String title = bookController.txtTitle.text;
//                                         String author = bookController.txtAuthor.text;
//                                         String status = bookController.txtStatust.text;
//                                         bookController.insertRecord(title, author, status);
//
//                       //  conController.insertRecords(name, phone, email);
//                         bookController.txtTitle.clear();
//                                         bookController.txtAuthor.clear();
//                                         bookController.txtStatust.clear();
//                         Get.back();
//                       },
//                       child: Text("Save"))
//                 ],
//               );
//             },
//           );
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }
