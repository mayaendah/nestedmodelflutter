import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:model_flutter/controllers/nestedModel2_controller.dart';

class ScreenTiga extends StatelessWidget {
  const ScreenTiga({super.key});

  @override
  Widget build(BuildContext context) {
    NestedModel2Controller nestedModel2Controller=Get.put(NestedModel2Controller());
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen Tiga'),
      ),
      body: Container(
        child: Obx(() => nestedModel2Controller.isLoading.value?
        Center(
          child: CircularProgressIndicator(),
        ):
           ListView.builder(
             itemCount: nestedModel2Controller.listmodeltiga.value.length,
             itemBuilder: (BuildContext context, int index) {
               return ListView.builder(
                 shrinkWrap: true,
                 itemCount: nestedModel2Controller.listmodeltiga.value[index].data?.length,
                   itemBuilder: (context,i){
                   return ListTile(
                     leading: CircleAvatar(
                       child: Text('${nestedModel2Controller.listmodeltiga.value[index].data?[i].mainId}')
                       ),
                     title: Text('${nestedModel2Controller.listmodeltiga.value[index].data?[i].firstName}'),
                     subtitle: ListView.builder(
                       shrinkWrap: true,
                       itemCount: nestedModel2Controller.listmodeltiga.value[index].data?[i].categories?.length,
                         itemBuilder: (context,t){
                         return Text('${nestedModel2Controller.listmodeltiga.value[index].data?[i].categories?[t].categoryName}');
                         }),
                     );

                   });
             },

           )
        )
      ),
    );
  }
}
