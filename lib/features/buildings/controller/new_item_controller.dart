

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:realstateAdmin/core/const/app_message.dart';
import 'package:realstateAdmin/core/resources/app_strings.dart';
import 'package:realstateAdmin/features/buildings/build_model.dart';
import 'package:realstateAdmin/features/views/admin_view.dart';



class NewItemController extends GetxController {
  String catValue = 'Graphic Design';

  RxMap<String, dynamic>? userData = <String, dynamic>{}.obs;
  String? roleId;
  String? radioValue; //Initial definition of radio button value
  String? choice;
  //final users = Users().obs;

  TextEditingController emailController = TextEditingController();
  final build = Building().obs;
  Rx<int> firstValue = 1.obs;
  Rx<int> secoundValue = 1.obs;
  @override
  void onInit() async {
    // try {
    //   final box = GetStorage();
    //   users.value =
    //       Users.fromJson(box.read('current_user') ?? <String, dynamic>{});
    //   print('yyyyyyyeeeeesssss ${users.value.roleId}');
    //   Future.delayed(const Duration(seconds: 1)).then((value) {
    //     users.value.roleId == '1' || users.value.roleId == '2'
    //         ? null
    //         : Get.showSnackbar(Ui.ErrorSnackBar(message: 'Please Login First'));
    //   });
    // } catch (e) {
    //   Ui.logSuccess(e);
    // }
    // radioValue = "one";
    // selectedListArea.value = firstArea;

    super.onInit();
  }

  final RxList<String> countryNames = [
    'العاصمة',
    'الاحمدي',
    'الجهراء',
    'الفروانية',
    'مبارك الكبير',
    'حولي'
  ].obs;

  RxString selectedCountry = 'العاصمة'.obs;
  
  final RxList<String> selectedListArea = <String>[].obs;

  final ImagePicker _picker = ImagePicker();
  final ImagePicker _picker2 = ImagePicker();

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

  final RxList<String> firstArea = [
    "مدينة جابر الأحمد",
    "الصليبيخات",
    "شمال غرب الصليبيخات",
    "المنصورية",
    "كيفان",
    "الصالحية",
    "القادسية",
    "بنيد القار",
    "اليرموك",
    "الوطية",
    "الدعية",
    "الفيحاء",
    "الشامية",
    "الروضة",
    "النزهة",
    "النهضة",
    "المرقاب",
    "الصوابر",
    "الدوحة",
    "قرطبة",
    "العديلية",
    "ضاحية عبدالله السالم",
    "الشرق",
    "دسمان",
    "الشويخ",
    "الشويخ الصناعية 1",
    "الشويخ الصناعية 2",
    "الشويخ الصناعية 3",
    "الشويخ الصحية",
    "الشويخ التعليمية",
    "السرة",
    "الري",
    "غرناطة",
    "معسكرات المباركية",
    "الخالدية"
  ].obs;

  final RxList<String> secondArea = [
    "الظهر",
    "المقوع",
    "أبو حليفة",
    "الصباحية",
    "المنقف",
    "ميناء عبد الله",
    "الوفرة الزراعية",
    "بنيدر",
    "الجليعة",
    "الضباعية",
    "الفنطاس",
    "العقيلة",
    "الرقة",
    "هدية",
    "الفحيحيل",
    "الأحمدي",
    "المهبولة",
    "ضاحية جابر العلي",
    "ضاحية فهد الأحمد",
    "الشعيبة",
    "الوفرة",
    "الزور",
    "الخيران",
    "مدينة صباح الأحمد",
    "النويصيب",
    "مدينة الخيران",
    "واره",
    "ضاحية علي صباح السالم أم الهيمان سابقاً",
    "مدينة صباح الأحمد البحرية"
  ].obs;
  final RxList<String> thirdArea = [
    "النعيم",
    "الصليبة",
    "الواحة",
    "القصر",
    "تيماء",
    "أمغرة",
    "العيون",
    "النسيم",
    "العبدلي",
    "القيصرية",
    "جهراء القديمة",
    "جهراء الجديدة",
    "الكاظمة",
    "الصبية",
    "مدينة سعد العبدلله",
    "الروضتين",
    "مدينة التحرير",
    "كبد",
    "المطلاع",
    "السالمي"
  ].obs;
  final RxList<String> forthArea = [
    "أبريق الخيطان",
    "الأندلس",
    "الفردوس",
    "الشدادية",
    "الضجيج",
    "الرقعي",
    "خيطان",
    "الرحب",
    "العمرية",
    "إشبيلية",
    "جليب الشيوخ",
    "الرابية",
    "الري",
    "الري الصناعية",
    "ضاحية صباح الناصر",
    "ضاحية عبدالله المبارك",
    "غرب عبدالله المبارك",
    "العارضية",
    "العارضية الصناعية",
    "العارضية الحرفية",
    "الحساوي",
    "العباسية",
    "منطقة المطار"
  ].obs;
  final RxList<String> fifthArea = [
    "ضاحية صباح السالم",
    "ضاحية مبارك الكبير",
    "القصور",
    "منطقة القرين",
    "منطقة أبو الحصاني",
    "منطقة أبو فطيرة",
    "منطقة العدان",
    "منطقة صبحان",
    "منطقة المسيلة",
    "منطقة المسايل",
    "منطقة الفنيطيس"
  ].obs;
  final RxList<String> sixthArea = [
    "الجابرية",
    "الرميثية",
    "بيان",
    "مشرف",
    "الزهراء",
    "ضاحية مبارك العبد الله الجابر",
    "الشهداء",
    "السالمية",
    "حولي",
    "سلوى",
    "حطين",
    "البدع",
    "الصديق",
    "الشعب",
    "السلام",
    "النقرة"
  ].obs;

  RxString selectedArea = "مدينة جابر الأحمد".obs;

  changeFilterCountry(String value) {
    selectedCountry.value = value;

    if (selectedCountry.value == 'العاصمة') {
      selectedListArea.value = firstArea;
      selectedArea =  "مدينة جابر الأحمد".obs;///
    } else if (selectedCountry.value == 'الاحمدي') {
      selectedListArea.value = secondArea;
      selectedArea = "الظهر".obs;///
    } else if (selectedCountry.value == 'الجهراء') {
      selectedListArea.value = thirdArea;
      selectedArea = "النعيم".obs;
    } else if (selectedCountry.value == 'الفروانية') {
      selectedListArea.value = forthArea;
      selectedArea = "أبريق الخيطان".obs;
    } else if (selectedCountry.value == 'مبارك الكبير') {
      selectedListArea.value = fifthArea;
      selectedArea =  "ضاحية صباح السالم".obs;
    } else if (selectedCountry.value == 'حولي') {
      selectedListArea.value = sixthArea;
      selectedArea = "الجابرية".obs;
    }

    update();
  }

  String imageLink = '';
  List<XFile>? pickedImageXFiles;

  String imageLink2 = '';
  List<XFile>? pickedImageXFiles2;

  uploadImageToServer2(String imagePath) async {
    print("HERE222");
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
          imageLink2 = responseData['data']['link'];
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

  String downloadUrl = '';
  String downloadUrl2 = '';
  List<String> downloadUrls = [];
  List<String> downloadUrls2 = [];

  // Future uploadMultiImageToFirebaseStorage(List<XFile> images) async {
  //   for (int i = 0; i < images.length; i++) {
  //     try {
  //       String fileName = DateTime.now().millisecondsSinceEpoch.toString();
  //       Reference reference =
  //           FirebaseStorage.instance.ref().child('images2024/$fileName');
  //       UploadTask uploadTask = reference.putFile(File(images[i].path));
  //       TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
  //       downloadUrl = await taskSnapshot.ref.getDownloadURL();
  //       downloadUrls.add(downloadUrl);
  //     } catch (e) {
  //       // Handle any errors that occur during the upload process
  //       // ignore: avoid_print
  //       print('Error uploading image to Firebase Storage: $e');
  //     }
  //   }
  //   return downloadUrls;
  // }
  //
  // Future uploadMultiImageToFirebaseStorage2(List<XFile> images) async {
  //   for (int i = 0; i < images.length; i++) {
  //     try {
  //       String fileName = DateTime.now().millisecondsSinceEpoch.toString();
  //       Reference reference =
  //           FirebaseStorage.instance.ref().child('images2024/$fileName');
  //       UploadTask uploadTask = reference.putFile(File(images[i].path));
  //       TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
  //       downloadUrl2 = await taskSnapshot.ref.getDownloadURL();
  //       downloadUrls2.add(downloadUrl2);
  //     } catch (e) {
  //       // Handle any errors that occur during the upload process
  //       // ignore: avoid_print
  //       print('Error uploading image to Firebase Storage: $e');
  //     }
  //   }
  //   return downloadUrls2;
  // }

 bool isLoading=false;
 List<String>imagesList=[];
 List<String>imageList2=[];

 bool isAllUpload=false;
  uploadMultiImageToServer(List<String>imagesListData) async {
    isLoading=true;
    update();
    print("HERE..");
    List<File> imageFile=[];
    print("IMAGELISTDATA=====${imagesListData.length}");
    try {
      for (int i = 0; i < imagesListData.length; i++) {
        print("I============$i");
        // Load the image file
        File imageFile = File(imagesListData[i]);
        // Read the image bytes
        List<int> imageBytes = await imageFile.readAsBytes();
        // Encode the image to base64
        String base64Image = base64Encode(imageBytes);

        // Prepare the request body
        Map<String, String> requestBody = {
          'image': base64Image,
        };

        // Send POST request to Imgur API
        final response = await http.post(
          Uri.parse('https://api.imgur.com/3/image'),
          headers: {
            'Authorization': "Client-ID fb8a505f4086bd5",
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
            String imageLink = responseData['data']['link'];
            print("LINK========$imageLink");
            imagesList.add(imageLink);
            // Check if all images are uploaded
            if (i == imagesListData.length - 1) {
              isAllUpload = true;
              update();
            }
          } else {
            print("ELSEEE IMAGE");
            throw ('Image upload failed: ${response.body}');
          }
        } else {
          print("ELSEEE 2222 IMAGE");
          throw ('Failed to upload image: ${response.statusCode}');
        }
      }
    } catch (e) {
      print('Error uploading image: $e');
    }
//       try {
//
//
//         for(int i=0;i<imagesListData.length;i++){
//
//             imageFile.add(File(imagesListData[i]));
//          List<int> imageBytes = await imageFile[i].readAsBytes();
//     String base64Image = base64Encode(imageBytes);
//      Map<String, String> requestBody = {
//         'image': base64Image,
//       };
//       // Send POST request to Imgur API
//       final response = await http.post(
//         Uri.parse('https://api.imgur.com/3/image'),
//         headers: {
//           'Authorization': "Client-ID " + "fb8a505f4086bd5",
//           //'Client-ID $clientId',
//           'Content-Type': 'application/json',
//         },
//         body: jsonEncode(requestBody),
//       );
//       // Check if the request was successful
//       if (response.statusCode == 200) {
//         print("IMAGE200");
//         // Parse response JSON
//         Map<String, dynamic> responseData = jsonDecode(response.body);
//         // Check if upload was successful
//         if (responseData.containsKey('data') &&
//             responseData['data'].containsKey('link')) {
//           print(responseData['data']['link']);
//           imageLink = responseData['data']['link'];
//
//           print("LINK========$imageLink");
//
//           imagesList.add(imageLink);
//
//           if(i==imagesListData.length-1){
//             isAllUpload=true;
//             update();
//           }
//           // Image uploaded successfully
//           return responseData['data']['link'];
//         } else {
//           print("ELSEEE IMAGE");
//           // Image upload failed
//           throw ('Image upload failed: ${response.body}');
//         }
//       } else {
//         // Request failed
//         print("ELSEEE 2222 IMAGE");
//         throw ('Failed to upload image: ${response.statusCode}');}
// }
//
//       }catch(e){
//   print('Error uploading image: $e');
// //       return 'eee';
//       }

    //print("imagepath===$imagePath");
    //
  }




  uploadMultiImageToServer2( List<String>imagesListData) async {
    isLoading=true;
    update();
    print("HERE..");
    List<File> imageFile=[];
    //print("imagepath===$imagePath");
    try {
      // Read image file as bytes
      for(int i=0;i<imagesListData.length;i++){
        imageFile.add(File(imagesListData[i]));
         List<int> imageBytes = await imageFile[i].readAsBytes();
    String base64Image = base64Encode(imageBytes);
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
          imageLink = responseData['data']['link'];
          imageList2.add(imageLink);
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
    }
      //List<File> imageFile.add( File(imagePath));
     
      // Encode image bytes to base64
      

      // Prepare POST request body
     
  }
   catch (e) {
      // Handle errors
      print('Error uploading image: $e');
      return 'eee';
    }
      
}



  uploadImageToServer(String imagePath) async {

    isLoading=true;
    update();
    print("HERE..");
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
          imageLink = responseData['data']['link'];
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

  changeFilterArea(String value) {
    selectedArea.value = value;
    update();
  }

  addNewItem() async {

   print("NEW TYPE===${build.value.type}");
    if(build.value.type.toString() != '1'
    || build.value.type.toString() != '2'

    ){
      build.value.type='1';
    }
    final box = GetStorage();
   // users.value = Users.fromJson(box.read('current_user'));
    print("ADD NEW ITEM .....");
        if(build.value.type.toString()=='null'){
          build.value.type='1';
        }if(build.value.cat.toString()=='null'){
          build.value.cat='1';
        }if(build.value.item.toString()=='null'){
          build.value.item='1';
        }
    print("...ITEM........=====${build.value.item}");
    print("...CAT.......=====${build.value.cat}");
    print("...TYPE.......=====${build.value.type}");


    Ui.logSuccess('1z1z $imageLink');
    String basicUrl =
        'Basic ${base64Encode(utf8.encode('realStateApp:realStateApp2024'))}';
    //List<String> images = [imageLink, imageLink2];
    //downloadUrls.add(imageLink2.toString());
    String joinImages(List<String> imageList) {
       return imageList.join(',');
  }
String buildingImage = joinImages(imagesList);
//String buildingImage2 = joinImages(imageList2);
    print("List========$imagesList");
    print("IMAGES==111===$buildingImage");
    //print("IMAGES==22===$buildingImage2");
      // String buildingImage='';
      //  String buildingImage2='';

      //  if(imagesList.length==1){
      //   buildingImage=imagesList[0];
      //  }
      //  if(imagesList.length==2){
      //   buildingImage=imagesList[0]+','+imagesList[1];
      //  }
      //   if(imagesList.length==3){
      //   buildingImage=imagesList[0]+','+imagesList[1]+','+imagesList[2];
      //  }

      //   if(imageList2.length==1){
      //   buildingImage2=imageList2[0];
      //  }
      //  if(imageList2.length==2){
      //   buildingImage=imageList2[0]+','+imageList2[1];
      //  }
      //   if(imageList2.length==3){
      //   buildingImage=imageList2[0]+','+imageList2[1]+','+imageList2[2];
      //  }
    try {
      var request = await http.post(
          //
          Uri.parse 
          // ('http://10.0.2.2/brokers/buildings/add_building.php'),
         ('https://easy-systems.net/brokers/buildings/add_building.php'),
          headers: {
            // 'Content-Type': 'application/json',
            'Authorization': basicUrl,
          },
          body: json.encode({
            "images": downloadUrls.toString(),
            "image": "[$buildingImage]",
            
            //"[$imageLink, $imageLink2]",
            //images,
            //downloadUrls.toString(),
           // "threeDImages": [buildingImage2[0]].toString(),
           // 'image_user': users.value.image.toString(),
            // "https://content.almalnews.com/wp-content/uploads/2019/10/%D8%A7%D9%84%D8%A7%D8%B3%D9%83%D8%A7%D9%86-1.jpg",
            'id': build.value.id,
            'name': build.value.name,
            'user_id':"Admin",
            'cat': build.value.cat,
            'type': build.value.type,
            'price': build.value.price,
            'location_country': build.value.locationCountry,
            'location_area': build.value.locationArea,
            'address': build.value.address,
            'building_number': build.value.buildNum,
            'floor_number': build.value.buildingSteps,
            'toilet_number': build.value.toilet,
            'monthly_rent': build.value.rentMonthly,
            'rent_time': build.value.rentTime,
            'bank_security': build.value.bankSafe,
            'availability_time': build.value.lettingTime,
            //'images': build.value.image,
            'rooms_number': build.value.rooms,
            'area': build.value.space,
            'item':build.value.item.toString()
          }));
          print("STATUS locations CODE==========${request.statusCode}");
      // var responseBody =jsonDecode(request.body);
      print("STATUS locations CODE==========${request.statusCode}");
      Ui.logError("bodyyyy===xxxxx=======${request.body.contains('true')}");
      if(request.statusCode==200){
        isLoading=false;
        selectedCountry = 'العاصمة'.obs;
        selectedArea = "مدينة جابر الأحمد".obs;
        update();
        Get.offAll(const AdminView());
        appMessage(text: 'تم الحفظ بنجاح', fail:false);
      }
     // request.body.contains('true')
        //  ?
          // Get.showSnackbar(
          //     Ui.SuccessSnackBar(message: 'Submitted Successfully'))
              
          // : Get.showSnackbar(Ui.ErrorSnackBar(message: 'Contact Support'));
    } catch (e) {
      print("ERROR==ADD ITEM=$e");
    }
  }

  void radioButtonChanges(String? value) {
    radioValue = value;
    switch (value) {
      case 'one':
        choice = value;
        break;
      case 'two':
        choice = value;
        break;
      case 'three':
        choice = value;
        break;
      default:
        choice = null;
    }

    update();
    //   print(choice); //Debug the choice in console
  }
}
