import 'package:adv_exam/controller/controller.dart';
import 'package:adv_exam/firebase/firebase.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class signIn extends StatelessWidget {
  const signIn({super.key});

  @override
  Widget build(BuildContext context) {
    var bookController = Get.put(BookController());
    return Scaffold(
        appBar: AppBar(
          title: Text("Sign in"),
        ),
        body: Center(
          child: Container(
            height: 350,
            width: 330,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(
                      0,
                      2,
                    ),
                    blurRadius: 2,
                  )
                ]),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  TextField(
                    controller: bookController.txtEmail,
                    decoration: InputDecoration(labelText: "email", enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextField(
                    controller: bookController.txtPass,
                    decoration: InputDecoration(labelText: "pass",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        FirebaseService.firebaseService.signIn(
                            bookController.txtEmail.text,
                            bookController.txtPass.text);

                        Navigator.of(context).pushNamed('/home');
                      },
                      child: Text("SING IN")),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/signup');
                      },
                      child: Text("alrady have acc"))
                ],
              ),
            ),
          ),
        ));
  }
}
