import 'dart:convert';

import 'package:get/get.dart';
import 'package:model_flutter/models/model_tiga.dart';
import 'package:http/http.dart' as http;

class NestedModel2Controller extends GetxController{
  RxBool isLoading=false.obs;
  Rx<List<ModelTiga>> listmodeltiga=Rx<List<ModelTiga>>([]);
  
  @override
  void onInit() {
    getDatamodel3();
    super.onInit();
  }

  void getDatamodel3()async{

    try{
      isLoading.value=true;
      var response=await http.get(Uri.parse('https://mocki.io/v1/c118410e-4fd0-408d-9f40-1f9524651913'));

      if(response.statusCode==200){
        isLoading.value=false;
        final content=jsonDecode(response.body);

        print(content);

        for(Map<String,dynamic> i in content){
          listmodeltiga.value.add(ModelTiga.fromJson(i));
          print(listmodeltiga.value.length);
        }
      }
      else{
        isLoading.value=false;
        print("terjadi kesalahan");
      }
    }catch(e){
      isLoading.value=false;
      print(e.toString());
    }

  }
}