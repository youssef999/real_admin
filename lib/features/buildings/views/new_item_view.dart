import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:realstateAdmin/features/buildings/controller/item_controller.dart';
import 'package:realstateAdmin/features/buildings/widgets/custom_radio.dart';
import '../../../Core/widgets/Custom_Text.dart';
import '../../../core/resources/app_colors.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../controller/new_item_controller.dart';



 class ItemView extends StatefulWidget {
//GetView<ItemController> {
  const ItemView({Key? key}) : super(key: key);

  @override
  State<ItemView> createState() => _ItemViewState();
}

class _ItemViewState extends State<ItemView> {
  NewItemController controller = Get.put(NewItemController(), permanent: true);
  @override
  void initState() {
    try {
      final box = GetStorage();
      // controller.users.value =
      //     Users.fromJson(box.read('current_user') ?? <String, dynamic>{});
   //   print('yyyyyyyeeeeesssss ${controller.users.value.roleId}');
      Future.delayed(const Duration(seconds: 1)).then((value) {
        // controller.users.value.roleId == '1' ||
        //         controller.users.value.roleId == '2'
        //     ? null
        //     : Get.showSnackbar(Ui.ErrorSnackBar(message: 'Please Login First'));
      });
    } catch (e) {
     // Ui.logSuccess(e);
    }
    // controller.radioValue = "one";
    // controller.selectedListArea.value = controller.firstArea;
    controller.pickedImageXFiles = [];
    controller.pickedImageXFiles2 = [];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
        backgroundColor: AppColors.mainly,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text("اضافة عقار",style: GoogleFonts.cairo(color: Colors.white),),
        ),
        body: GetBuilder<NewItemController>(
          builder: (_) {
            return DefaultTabController(
                length: 3,
                child: SingleChildScrollView(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Obx(() {
                      return Form(
                        key: formKey,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 50.0, bottom: 10),
                              child: Text(
                                'ما نوع المراد ادراجه؟',
                                style: GoogleFonts.cairo(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.darkColor),
                              ),
                            ),
                            Row(
                              children: [
                                customRadioButton("بيع", 1),
                                customRadioButton("ايجار", 2),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 50.0, bottom: 5),
                              child: Text(
                                'ما نوع العقار الذي تريده؟',
                                style: GoogleFonts.cairo(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.darkColor),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                  top: 10, left: 90, bottom: 5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5)),
                              child: TabBar(

                                  unselectedLabelColor: AppColors.darkColor,
                                  indicatorSize: TabBarIndicatorSize.tab,
                                  labelColor: AppColors.primaryBGLightColor,
                                  labelStyle: GoogleFonts.cairo(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                  indicatorWeight: 5,
                                  indicator: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color.fromARGB(78, 7, 95, 154)),
                                  dividerHeight: 00,
                                  tabs: const [
                                    Tab(
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text("سكني"),
                                      ),
                                    ),
                                    Tab(
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text("تجاري"),
                                      ),
                                    ),
                                    Tab(
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text("اخري"),
                                      ),
                                    ),
                                  ]),
                            ),
                            SizedBox(
                              height: 150,
                              child: TabBarView(
                                children: [
                                  firstTabBar(),
                                  // Content for the second tab
                                  secoundTabBar(),
                                  // Content for the second tab
                                  thirdTabBar()
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 15.0),
                              child: Text(
                                'اين يقع عقارك؟',
                                style: GoogleFonts.cairo(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.darkColor),
                              ),
                            ),

                            dropDown('محافظه', controller.selectedCountry.value,
                                (String? newValue) {
                              if (newValue != null) {
                                controller.changeFilterCountry(newValue);
                                controller.build.value.locationCountry = newValue;
                              }
                            }, controller.countryNames),
                            //    dropDown('اختر المدينه'),

                            dropDown('منطقه', controller.selectedArea.value,
                                (String? newValuex) {
                              if (newValuex != null) {
                                controller.changeFilterArea(newValuex);
                                controller.build.value.locationArea = newValuex;
                              }
                            }, controller.selectedListArea),
                            const SizedBox(
                              height: 15,
                            ),
                            txtForm(formKey, 'عنوان العقار',
                                    2,
                                    (v) {
                              controller.build.value.name = v;
                            }, TextInputType.text,true),

                            txtForm(formKey, 'ادخل تفاصيل عنوان العقار',
                                    3,
                                    (v) {
                              controller.build.value.address = v;
                            }, TextInputType.text,false),
                            txtForm(formKey, 'رقم المبني',
                                    1,
                                    (v) {
                              controller.build.value.buildNum = v;
                            }, const TextInputType.numberWithOptions(),false),
                            txtForm(formKey, 'عدد دورات المياه',
                                    1,
                                    (v) {
                              controller.build.value.toilet = v;
                            }, const TextInputType.numberWithOptions(),true),
                            txtForm(formKey, 'عدد غرف النوم',

                                    1,
                                    (v) {
                              controller.build.value.rooms = v;
                            }, const TextInputType.numberWithOptions(),true),
                            txtForm(formKey, 'عدد ادوار المبني',
                                    1,
                                    (v) {
                              controller.build.value.buildingSteps = v;
                            }, const TextInputType.numberWithOptions(),true),
                            txtForm(formKey, 'مساحه البناء',

                                    2,
                                    (v) {
                              controller.build.value.space = v;
                            }, const TextInputType.numberWithOptions(),true),
                            txtForm(formKey, 'الايجار الشهري',
                                    2,
                                    (v) {
                              controller.build.value.rentMonthly = v;
                            }, const TextInputType.numberWithOptions(),true),
                            txtForm(formKey, 'مبلغ التامين',

                                    2,
                                    (v) {
                              controller.build.value.bankSafe = v;
                            }, const TextInputType.numberWithOptions(),false),
                            txtForm(formKey, 'مده الايجار',
                                    1,

                                    (v) {
                              controller.build.value.rentTime = v;
                            }, const TextInputType.numberWithOptions(),false),

                            txtForm(
                                formKey, 'فتره السماح',
                                    0,
                                    (v) {
                              controller.build.value.lettingTime = v;
                            }, const TextInputType.numberWithOptions(),false),
                            Padding(
                              padding: const EdgeInsets.only(top: 50.0, bottom: 10),
                              child: Text(
                                'اضف الوسائط الخاصه بك',
                                style: GoogleFonts.cairo(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.darkColor),
                              ),
                            ),

                            GetBuilder<NewItemController>(builder: (_) {
                              return Container(
                                  height: 280,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Column(
                                    children: [
                                      const Custom_Text(
                                        text: 'تحميل الصور ',
                                        color: Colors.black,
                                        fontSize: 32,
                                        alignment: Alignment.center,
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      (controller.pickedImageXFiles != null &&
                                              controller
                                                  .pickedImageXFiles!.isNotEmpty)
                                          ? SizedBox(
                                              width: double.infinity,
                                              height: 200,
                                              child: ListView(
                                                  shrinkWrap: true,
                                                  scrollDirection: Axis.horizontal,
                                                  children: [
                                                    for (int i = 0;
                                                        i <
                                                            controller
                                                                .pickedImageXFiles!
                                                                .length;
                                                        i++)
                                                      InkWell(
                                                        child: Container(
                                                          margin:
                                                              const EdgeInsets.only(
                                                                  left: 10,
                                                                  right: 10),
                                                          clipBehavior:
                                                              Clip.antiAlias,
                                                          width: 220,
                                                          decoration: BoxDecoration(
                                                              image: DecorationImage(
                                                                  image: FileImage(
                                                                      File(controller
                                                                          .pickedImageXFiles![
                                                                              i]
                                                                          .path)),
                                                                  fit:
                                                                      BoxFit.fill)),
                                                        ),
                                                        onTap: () {
                                                          controller
                                                              .pickMultiImage();
                                                        },
                                                      ),
                                                  ]),
                                            )
                                          : DottedBorder(
                                              color: AppColors.primaryBGLightColor,
                                              radius: const Radius.circular(25),
                                              borderType: BorderType.RRect,
                                              dashPattern: const [5, 6],
                                              child: GestureDetector(
                                                  onTap: () {
                                                    controller.pickMultiImage();
                                                  },
                                                  child: Container(
                                                    width: 350,
                                                    height: 100,
                                                    decoration: BoxDecoration(
                                                        color: const Color.fromARGB(
                                                            255, 236, 236, 236),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                25)),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.center,
                                                      children: [
                                                        const Icon(
                                                          Icons.flip_camera_ios,
                                                          color: Colors.red,
                                                        ),
                                                        const SizedBox(
                                                          width: 8,
                                                        ),
                                                        Text('تحميل الصور',
                                                            style:
                                                                GoogleFonts.cairo(
                                                                    color:
                                                                        Colors.red,
                                                                    fontSize: 16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold)),
                                                      ],
                                                    ),
                                                  ))),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                    ],
                                  ));
                            }),

                            Padding(
                              padding: const EdgeInsets.only(top: 50.0, bottom: 10),
                              child: Text(
                                'ارفع المخطط الخاص بك',
                                style: GoogleFonts.cairo(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.darkColor),
                              ),
                            ),

                            GetBuilder<NewItemController>(builder: (_) {
                              return Container(
                                  height: 280,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Column(
                                    children: [
                                      const Custom_Text(
                                        text: 'تحميل المخطط ',
                                        color: Colors.black,
                                        fontSize: 32,
                                        alignment: Alignment.center,
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      (controller.pickedImageXFiles2 != null &&
                                              controller
                                                  .pickedImageXFiles2!.isNotEmpty)
                                          ? SizedBox(
                                              width: double.infinity,
                                              height: 200,
                                              child: ListView(
                                                  shrinkWrap: true,
                                                  scrollDirection: Axis.horizontal,
                                                  //  padding: EdgeInsets.all(10),
                                                  children: [
                                                    for (int i = 0;
                                                        i <
                                                            controller
                                                                .pickedImageXFiles2!
                                                                .length;
                                                        i++)
                                                      InkWell(
                                                        child: Container(
                                                          margin:
                                                              const EdgeInsets.only(
                                                                  left: 10,
                                                                  right: 10),
                                                          clipBehavior:
                                                              Clip.antiAlias,
                                                          decoration: BoxDecoration(
                                                              image: DecorationImage(
                                                                  image: FileImage(
                                                                      File(controller
                                                                          .pickedImageXFiles2![
                                                                              i]
                                                                          .path)),
                                                                  fit: BoxFit.fill),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                    color: Get.theme
                                                                        .focusColor
                                                                        .withOpacity(
                                                                            0.1),
                                                                    blurRadius: 10,
                                                                    offset:
                                                                        const Offset(
                                                                            0, 5)),
                                                              ],
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                          //  height: 100,
                                                          width: 220,
                                                        ),
                                                        onTap: () {
                                                          controller
                                                              .pickMultiImage2();
                                                        },
                                                      ),
                                                  ]),
                                            )
                                          : DottedBorder(
                                              color: AppColors.primaryBGLightColor,
                                              radius: const Radius.circular(25),
                                              borderType: BorderType.RRect,
                                              dashPattern: const [5, 6],
                                              child: GestureDetector(
                                                  onTap: () {
                                                    controller.pickMultiImage2();
                                                  },
                                                  child: Container(
                                                    width: 350,
                                                    height: 100,
                                                    decoration: BoxDecoration(
                                                        color: const Color.fromARGB(
                                                            255, 236, 236, 236),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                25)),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.center,
                                                      children: [
                                                        const Icon(
                                                          Icons.flip_camera_ios,
                                                          color: Colors.red,
                                                        ),
                                                        const SizedBox(
                                                          width: 8,
                                                        ),
                                                        Text('تحميل المخطط',
                                                            style:
                                                                GoogleFonts.cairo(
                                                                    color:
                                                                        Colors.red,
                                                                    fontSize: 16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold)),
                                                      ],
                                                    ),
                                                  ))),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                    ],
                                  ));
                            }),

                            (controller.isLoading==false)?
                            InkWell(
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                margin: const EdgeInsets.only(top: 31),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Text('اضف عقار',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.cairo(
                                        fontSize: 30, color: AppColors.mainly)),
                              ),
                              onTap: () async {
                                  
                                  List<String> images = [];
                                 
                                  List<String>images2=[];

                                  if(controller.pickedImageXFiles!.isNotEmpty){

                                     for(int i=0;i<controller.pickedImageXFiles!.length;i++){
                                    images.add(controller.pickedImageXFiles![i].path);
                                  }
                                  }

                                  if(controller.pickedImageXFiles2!.isNotEmpty){
                                     for(int i=0;i<controller.pickedImageXFiles2!.length;i++){
                                    images2.add(controller.pickedImageXFiles2![i].path);
                                  }
                                  }
                                 if (formKey.currentState!.validate() ==
                                            false)
                                          {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                content:
                                                    Text('يرجى تعبئة البيانات'),
                                                backgroundColor: Colors.red,
                                              ),
                                            );
                                          }
                                        else
                                          {
                                         await controller.uploadMultiImageToServer(images).then((value) {
                                           if(controller.pickedImageXFiles2!.isNotEmpty){
                                              controller
                                                  .uploadMultiImageToServer2(images2
                                                      )
                                                      .catchError((e) {
                                                        print("ERROR==$e");
                                                      })
                                                  .then((value) {
                                                    //if(controller.isAllUpload==true){
                                                      Future.delayed(
                                                          const Duration(seconds: 3))
                                                          .then((v) {
                                                        controller.addNewItem();
                                                      });
                                                   // }

                                              });

                                           }    else{
                                             Future.delayed(
                                                 const Duration(seconds: 3))
                                                 .then((v) {
                                                 //  if(controller.isAllUpload==true){
                                                     controller.addNewItem();
                                                   //}
                                             });
                                           }
                                          });
                                          }
                              },
                            ):const Center(child:  CircularProgressIndicator(),),
                            const SizedBox(
                              height: 110,
                            )
                          ],
                        ),
                      );
                    })));
          }
        ));
  }
}
