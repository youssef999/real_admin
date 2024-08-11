
// ignore_for_file: unused_local_variable

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:realstateAdmin/core/const/app_message.dart';
import 'package:realstateAdmin/core/const/constant.dart';
import 'package:realstateAdmin/features/views/admin_view.dart';

class EditBuildingController extends GetxController{

  TextEditingController buiildingController=TextEditingController();
  TextEditingController locationController=TextEditingController();
  TextEditingController priceController=TextEditingController();
  TextEditingController phoneController=TextEditingController();


   
   
   
//    updateData()async{
//     var headers = {
//   'Content-Type': 'application/json',
//   'Authorization': 'Basic cmVhbFN0YXRlQXBwOnJlYWxTdGF0ZUFwcDIwMjQ='
// };
// var request = http.Request('POST', Uri.parse('localhost/brokers/buildings/update_building.php'));
// request.body = json.encode({
//   "name": "rrrr",
//   "phone": "121122",
//   "id": "1",
//   "price": "2133"
// });
// request.headers.addAll(headers);

// http.StreamedResponse response = await request.send();

// if (response.statusCode == 200) {
//   print(await response.stream.bytesToString());
// }
// else {
//   print(response.reasonPhrase);
// }

//    }
  updateBuilding (Map<String, dynamic> data) async{
  print("update BUILDINGS....");
  print(data.toString());
  print("ID===="+data['id']);
   print("ID===="+data['name']);
 
   try{

  print(baseUrl.toString()+'/brokers/buildings/update_building.php');
     var request = await
     http.post(Uri.parse
       (baseUrl+'/brokers/buildings/update_building.php'),

       //localhost/brokers/buildings/get_buildings.php
       headers: {
         //'Content-Type': 'application/json',
         'Authorization': basicUrl,
       },
    
       body: json.encode({
        'id':data['id'],
        'name':
        (buiildingController.text.length>2)?buiildingController.text:data['name'],
        'phone':(phoneController.text.length>2)?phoneController.text:data['phone'],
        'price':(priceController.text.length>2)?priceController.text:data['price'],
       })
     );
     var responseBody =jsonDecode(request.body);
     print("STATUS CODE=========="+request.statusCode.toString());
     print("ORDERdata=========="+request.body.toString());

     if(request.statusCode==201 || request.statusCode==200){
       print("update done.........");
       Get.offAll(const AdminView());
       appMessage(text: 'تم التحديث بنجاح', fail: false);
      
     }
   
   }catch(e){
     print("ERROR====="+e.toString());
   }
  update();

}

  //TextEditingController Controller=TextEditingController();
}