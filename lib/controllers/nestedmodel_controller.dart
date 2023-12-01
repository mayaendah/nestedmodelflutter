import 'dart:convert';

import 'package:get/get.dart';
import 'package:model_flutter/models/nested_model.dart';
import 'package:http/http.dart' as http;

class NestedModelCOntroller extends GetxController{
  RxBool isLoading=false.obs;
  Rx<List<datanested>> listnested=Rx<List<datanested>>([]);
  // Rx<List<DemoModel>> modellist=Rx<List<DemoModel>>([]);
  
  @override
  void onInit(){
    getDataNested();
    super.onInit();
  }

  getDataNested() async{   {

    try{
      isLoading.value=true;
      var response= await http.get(Uri.parse('https://mocki.io/v1/8b182361-1df5-4ff4-8407-27b4d0efd372'));

      if(response.statusCode==200){
        isLoading.value=false;

        final content=jsonDecode(response.body);
        print(content);
        for(Map<String,dynamic> i in content){
          listnested.value.add(datanested.fromJson(i));
          print(listnested.value.length);
        }
      }else{
        isLoading.value=true;
        print('terjadi kesalahan');
      }
    }catch(e){
      isLoading.value=true;
      print(e.toString());
    }
    
  }
}}