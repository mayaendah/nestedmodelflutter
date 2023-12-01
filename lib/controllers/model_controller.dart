import 'dart:convert';

import 'package:get/get.dart';
import 'package:model_flutter/models/demo_model.dart';
import 'package:http/http.dart' as http;

class ModelController extends GetxController{

  RxBool isLoading=false.obs;
  Rx<List<DemoModel>> modellist=Rx<List<DemoModel>>([]);

  @override
  void onInit() {
    getAllDemoModel();
    super.onInit();
  }

  getAllDemoModel() async{
    try{
    isLoading.value=true;
      var response=await http.get(Uri.parse('https://mocki.io/v1/9ecf0203-5ed1-4840-9f13-102e67fda907'));
      print(response.body);
      if(response.statusCode==200){
        isLoading.value=false;
        final content=jsonDecode(response.body);
        // print(content);
        for(Map<String,dynamic> i in content){
          modellist.value.add(DemoModel.fromJson(i));
          // print(modellist.value.length);
        }
      }else{
        isLoading.value=false;
        print("terjadi kesalahan");
      }

    }catch(e){
      isLoading.value=false;
      print(e.toString());
    }
  }


}