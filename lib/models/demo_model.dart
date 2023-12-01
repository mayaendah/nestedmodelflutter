class DemoModel{
   String? name;
   int? userId;
   String? email;

   DemoModel({this.name,this.userId,this.email});

   DemoModel.fromJson(Map<String,dynamic> jsonData){
     name=jsonData['name'];
     userId=jsonData['userId'];
     email=jsonData['email'];
   }
}