import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenMain extends StatelessWidget {
  const ScreenMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Screen'),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            ElevatedButton(onPressed: (){
              Get.toNamed('/satu');
            }, child: Text('Screen Satu')),
            ElevatedButton(onPressed: (){
              Get.toNamed('/dua');
            }, child: Text('Screen Dua')),
            ElevatedButton(onPressed: (){
              Get.toNamed('/tiga');
            }, child: Text('Screen Tiga'))
          ],
        ),
      ),
    );
  }
}
