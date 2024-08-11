

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:realstateAdmin/core/const/constant.dart';

class ItemController extends GetxController{


 TextEditingController nameController=TextEditingController();

TextEditingController locationNameController=TextEditingController();
TextEditingController priceController=TextEditingController();
TextEditingController phoneController=TextEditingController();

TextEditingController locationCountry=TextEditingController();
TextEditingController locationArea=TextEditingController();
TextEditingController locationName=TextEditingController();

TextEditingController buildingNumberController=TextEditingController();

TextEditingController toiletController=TextEditingController();

TextEditingController roomsController=TextEditingController();

TextEditingController floorNumControoler=TextEditingController();

TextEditingController areaController=TextEditingController();

TextEditingController monthlyRentController=TextEditingController();

TextEditingController bankSecurityController=TextEditingController();

TextEditingController rentTimeController=TextEditingController();

TextEditingController availabilityTimeController=TextEditingController();

TextEditingController threeDImagesController=TextEditingController();



  final ImagePicker _picker = ImagePicker();
  final ImagePicker _picker2 = ImagePicker();

  String imageLink='';
  
  List<XFile>? pickedImageXFiles;

  String imageLink2='';
  List<XFile>? pickedImageXFiles2;

  pickMultiImage() async {
    pickedImageXFiles = await _picker.pickMultiImage(
      imageQuality: 100,
    );
    update();
  }

  pickMultiImage2() async {
    pickedImageXFiles2 = await _picker2.pickMultiImage(
      imageQuality: 100,
    );
    update();
  }

  uploadImageToServer2(String imagePath)async{
    print("imagepath===$imagePath");
    try {
      // Read image file as bytes
      File imageFile = File(imagePath);
      List<int> imageBytes = await imageFile.readAsBytes();
      // Encode image bytes to base64
      String base64Image = base64Encode(imageBytes);

      // Prepare POST request body
      Map<String, String> requestBody = {
        'image': base64Image,
      };
      // Send POST request to Imgur API
      final response = await http.post(
        Uri.parse('https://api.imgur.com/3/image'),
        headers: {
          'Authorization': "Client-ID " + "fb8a505f4086bd5",
          //'Client-ID $clientId',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(requestBody),
      );
      // Check if the request was successful
      if (response.statusCode == 200) {
        print("IMAGE200");
        // Parse response JSON
        Map<String, dynamic> responseData = jsonDecode(response.body);
        // Check if upload was successful
        if (responseData.containsKey('data') &&
            responseData['data'].containsKey('link')) {
          print(responseData['data']['link']);
          imageLink=responseData['data']['link'];
          // Image uploaded successfully
          return responseData['data']['link'];
        } else {
          print("ELSEEE IMAGE");
          // Image upload failed
          throw ('Image upload failed: ${response.body}');
        }
      } else {
        // Request failed
        print("ELSEEE 2222 IMAGE");
        throw ('Failed to upload image: ${response.statusCode}');
      }
    } catch (e) {
      // Handle errors
      print('Error uploading image: $e');
      return 'eee';
    }
  }


  uploadImageToServer(String imagePath)async{
    print("imagepath===$imagePath");
    try {
      // Read image file as bytes
      File imageFile = File(imagePath);
      List<int> imageBytes = await imageFile.readAsBytes();
      // Encode image bytes to base64
      String base64Image = base64Encode(imageBytes);

      // Prepare POST request body
      Map<String, String> requestBody = {
        'image': base64Image,
      };
      // Send POST request to Imgur API
      final response = await http.post(
        Uri.parse('https://api.imgur.com/3/image'),
        headers: {
          'Authorization': "Client-ID " + "fb8a505f4086bd5",
          //'Client-ID $clientId',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(requestBody),
      );
      // Check if the request was successful
      if (response.statusCode == 200) {
        print("IMAGE200");
        // Parse response JSON
        Map<String, dynamic> responseData = jsonDecode(response.body);
        // Check if upload was successful
        if (responseData.containsKey('data') &&
            responseData['data'].containsKey('link')) {
          print(responseData['data']['link']);
          imageLink=responseData['data']['link'];
          // Image uploaded successfully
          return responseData['data']['link'];
        } else {
          print("ELSEEE IMAGE");
          // Image upload failed
          throw ('Image upload failed: ${response.body}');
        }
      } else {
        // Request failed
        print("ELSEEE 2222 IMAGE");
        throw ('Failed to upload image: ${response.statusCode}');
      }
    } catch (e) {
      // Handle errors
      print('Error uploading image: $e');
      return 'eee';
    }

  }

  addNewItem() async {
    print("ADD NEW ITEM..............");
    var request = await http.post(
        Uri.parse(baseUrl+'/brokers/buildings/add_building.php'),
        headers: {
         'Content-Type': 'application/json',
         'Authorization': basicUrl,
       },
        body: json.encode({
          "name": nameController.text,
          "lat": "31.2332",
          "lng": "12.433",
          "location_name": "المعادي",
          "image":imageLink,
             // "https://content.almalnews.com/wp-content/uploads/2019/10/%D8%A7%D9%84%D8%A7%D8%B3%D9%83%D8%A7%D9%86-1.jpg",
          "price": "29000",
          "user_id": "2",
          "roleId": "2",
          "type": "3",
          "cat": "1",
          "phone": "1232122",
        }));
    // var responseBody =jsonDecode(request.body);
    print("STATUS locations CODE==========${request.statusCode}");
    print("bodyyyy===xxxxx=======${request.body}");
    update();
  }

}