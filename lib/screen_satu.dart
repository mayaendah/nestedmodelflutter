import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:model_flutter/controllers/model_controller.dart';

class ScreenSatu extends StatelessWidget {
  const ScreenSatu({super.key});

  @override
  Widget build(BuildContext context) {
    ModelController modelController = Get.put(ModelController());

    return Scaffold(
      appBar: AppBar(
        title: Text('Model'),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Obx(
          () =>
          modelController.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              :
          ListView.builder(
                  itemCount: modelController.modellist.value.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                          '${modelController.modellist.value[index].name}'),
                      subtitle: Text(
                          '${modelController.modellist.value[index].email}'),
                    );
                  }),
        ),
      ),
    );
  }
}
