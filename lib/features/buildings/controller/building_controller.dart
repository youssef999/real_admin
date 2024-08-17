
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:realstateAdmin/core/const/app_message.dart';
import 'package:realstateAdmin/core/const/constant.dart';
import 'package:realstateAdmin/features/views/admin_view.dart';


class BuildingController extends GetxController{

 List  buildingList=[];

 getAllBuildings () async{
  print("GET ALL BUILDINGS....");
  buildingList=[];
   try{
  print(baseUrl.toString()+'/brokers/buildings/get_buildings.php');
     var request = await
     http.get(Uri.parse
       (baseUrl+'/brokers/buildings/get_buildings.php'),
       //localhost/brokers/buildings/get_buildings.php
       headers: {
         'Content-Type': 'application/json',
         'Authorization': basicUrl,
       },
     );
     var responseBody =jsonDecode(request.body);
     print("STATUS CODE=========="+request.statusCode.toString());
     print("ORDERdata=========="+request.body.toString());

     if(request.statusCode==201 || request.statusCode==200){
       print("DONE BOOKINGS DATA..........");
       buildingList=responseBody['data'];
     }
     print("buildingsxxxx====="+buildingList.toString());
   }catch(e){
     print("ERROR====="+e.toString());
   }
  update();
}



//showDialog(BuildContext context){
 Future<void> showDeleteDialog(BuildContext context,String id) async {

    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('تاكيد الحذف !!'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('هل انت متاكد من حذف هذا العقار '),
              
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('لا'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('نعم'),
              onPressed: () {
                deleteBuilding(id.toString());
                Navigator.of(context).pop();
                Get.offAll(const AdminView());
                appMessage(text: 'تم الحذف بنجاح', fail: false);
              },
            ),
          ],
        );
      },
    );
}

deleteBuilding(String id) async {
  print("ID==="+id);
 var headers = {
  'Content-Type': 'application/json',
  'Authorization': 'Basic cmVhbFN0YXRlQXBwOnJlYWxTdGF0ZUFwcDIwMjQ='
};
var request = http.Request('POST', Uri.parse(baseUrl.toString()+'/brokers/buildings/delete_building.php'));
request.body = json.encode({
  "id": id
});
request.headers.addAll(headers);

http.StreamedResponse response = await request.send();

if (response.statusCode == 200) {
  print(await response.stream.bytesToString());
}
else {
  print(response.reasonPhrase);
}

  update();
}
}