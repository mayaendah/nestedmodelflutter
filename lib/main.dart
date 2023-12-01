import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:model_flutter/screen_dua.dart';
import 'package:model_flutter/screen_main.dart';
import 'package:model_flutter/screen_satu.dart';
import 'package:model_flutter/screen_tiga.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: [
        GetPage(
          name: '/satu',
          page: () => ScreenSatu(),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
            name: '/dua',
            page: () => ScreenDua(),
            transition: Transition.leftToRightWithFade),
        GetPage(
            name: '/tiga',
            page: () => ScreenTiga(),
            transition: Transition.leftToRightWithFade)
      ],
      home: ScreenMain(),
    );
  }
}
