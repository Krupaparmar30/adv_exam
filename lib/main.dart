import 'package:adv_exam/ho/ho.dart';
import 'package:adv_exam/screens/homePage/homePage.dart';
import 'package:adv_exam/sign_in/sign_in.dart';
import 'package:adv_exam/sign_up/sign_up.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'firebase_options.dart';

Future<void> main()
async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(myApp());
}
class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: '/', page: () => signIn(),),
        GetPage(name: '/signup', page: () => signUp(),),
        GetPage(name: '/home', page: () => HomePage(),)
      ],
    );
  }
}


