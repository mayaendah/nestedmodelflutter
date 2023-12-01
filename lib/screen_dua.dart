

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:model_flutter/controllers/nestedmodel_controller.dart';

class ScreenDua extends StatelessWidget {
  const ScreenDua({super.key});

  @override
  Widget build(BuildContext context) {
    NestedModelCOntroller nestedModelCOntroller =
        Get.put(NestedModelCOntroller());

    return Scaffold(
      appBar: AppBar(
        title: Text('Screen dua'),
      ),
      body: Container(
        child: Obx(() => nestedModelCOntroller.isLoading.value == true
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: nestedModelCOntroller.listnested.value.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text(
                          '${nestedModelCOntroller.listnested.value[index].firstname}'),
                    ),
                    title: Text(
                        '${nestedModelCOntroller.listnested.value[index].createdAt}'),
                    subtitle: ListView.builder(
                        shrinkWrap: true,
                        itemCount: nestedModelCOntroller
                            .listnested.value[index].posts?.length,
                        itemBuilder: (context, i) {
                          return Row(
                            children: [
                              Text(
                                  '${nestedModelCOntroller.listnested.value[index].posts?[i].title}'),
                            ],
                          );
                        }),
                  );
                },
              )),
      ),
    );
  }
}
