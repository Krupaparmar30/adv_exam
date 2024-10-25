import 'package:adv_exam/controller/controller.dart';
import 'package:adv_exam/firebase/firebase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class signUp extends StatelessWidget {
  const signUp({super.key});

  @override
  Widget build(BuildContext context) {
    var bookController = Get.put(BookController());
    return Scaffold(
        appBar: AppBar(
          title: Text("Sign up"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Center(
                child: Container(
                  height: 500,
                  width: 330,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(0, 2,)
                          ,
                        blurRadius: 2,
          
                      )
                    ]
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        TextField(
                          controller: bookController.txtName,
                          decoration: InputDecoration(
                              labelText: "Name",
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: bookController.txtPhone,
                          decoration: InputDecoration(
                              labelText: "Phone",
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: bookController.txtEmail,
                          decoration: InputDecoration(
                              labelText: "email",
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: bookController.txtPass,
                          decoration: InputDecoration(
                              labelText: "pass",
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                            onPressed: () {
          
                              FirebaseService.firebaseService.signUp(
                                  bookController.txtEmail.text,
                                  bookController.txtPass.text);
          
          
                              Navigator.of(context).pushNamed('/home');
                              bookController.txtEmail.clear();
          
          
                            },
                            child: Text("SING up")),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("dont gavev sing in "))
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
