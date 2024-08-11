
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:realstateAdmin/core/const/app_message.dart';
import 'package:realstateAdmin/core/const/constant.dart';
import 'package:realstateAdmin/features/views/admin_view.dart';

class UserController extends GetxController{


 List userList=[];
 List brokerList=[];
 
 
  getUsers()async{
       print("GET ALLusers ...");
   userList=[];
   try{
  print(baseUrl.toString()+'/brokers/user/all_users.php');
     var request = await
     http.post(Uri.parse
       (baseUrl+'/brokers/user/all_users.php'),

       //localhost/brokers/buildings/get_buildings.php
       headers: {
         'Content-Type': 'application/json',
         'Authorization': basicUrl,
       },
       body: json.encode({
         "roleId": "1"
       }),
     );
     var responseBody =jsonDecode(request.body);
     print("STATUS CODE=========="+request.statusCode.toString());
     print("ORDERdata=========="+request.body.toString());

     if(request.statusCode==201 || request.statusCode==200){
       print("DONE BOOKINGS DATA..........");
      userList=responseBody['data'];
     }
     print("buildingsxxxx====="+userList.toString());
   }catch(e){
     print("ERROR====="+e.toString());
   }
  update();

}

 getBrokers()async{
 brokerList=[];
   try{
  print(baseUrl.toString()+'/brokers/user/all_users.php');
     var request = await
     http.post(Uri.parse
       (baseUrl+'/brokers/user/all_users.php'),
       //localhost/brokers/buildings/get_buildings.php
       headers: {
         'Content-Type': 'application/json',
         'Authorization': basicUrl,
       },
       body: json.encode({
         "roleId": "2"
       }),
     );
     var responseBody =jsonDecode(request.body);
     print("STATUS CODE=========="+request.statusCode.toString());
     print("ORDERdata=========="+request.body.toString());

     if(request.statusCode==201 || request.statusCode==200){
       print("DONE BROKERS DATA..........");
      brokerList=responseBody['data'];
     }
     print("buildingsxxxx====="+userList.toString());
   }catch(e){
     print("ERROR====="+e.toString());
   }

  update();
}



  deleteUser(String userId)async{
    var headers = {
   'Content-Type': 'application/json',
   'Authorization': basicUrl,
};
//baseUrl+'/brokers/user/all_users.php'
var request = http.Request('POST',
 Uri.parse('$baseUrl/brokers/auth/delete_user.php'));
request.body = json.encode({
  "user_id": userId
});
request.headers.addAll(headers);

http.StreamedResponse response = await request.send();

if (response.statusCode == 200) {

  print(await response.stream.bytesToString());
  
  appMessage(text: 'تم الحذف', fail: false);
  
  Get.offAll(const AdminView());


}
else {
  print(response.reasonPhrase);
}

  }
 }