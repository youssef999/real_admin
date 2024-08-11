

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realstateAdmin/core/const/constant.dart';
import 'package:realstateAdmin/core/widgets/Custom_Text.dart';
import 'package:realstateAdmin/core/widgets/Custom_button.dart';
import 'package:realstateAdmin/features/buildings/controller/building_controller.dart';

import 'edit_building.dart';

class ShowBuildingsView extends StatefulWidget {
  const ShowBuildingsView({super.key});

  @override
  State<ShowBuildingsView> createState() => _ShowBuildingsViewState();
}

class _ShowBuildingsViewState extends State<ShowBuildingsView> {
  

 BuildingController controller=Get.put(BuildingController());
 @override
  void initState() {
   controller.getAllBuildings();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body:

      GetBuilder<BuildingController>(
        builder: (_) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              //  shrinkWrap: true,
                itemCount: controller.buildingList.length,
                itemBuilder: (context,index){

                  print("new==="+controller.buildingList.toString());
                   print("new22==="+controller.buildingList[index]['image'].toString());


                  String image=controller.buildingList[index]['image'].toString()
                  .replaceAll('[', '').replaceAll(']', '');

                  List imageList=image.split(',');

                  return Card(
                    color: Colors.white,
                    child:Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(children: [
                        // Text(controller.buildingList[index]['id'],
                        // style:const TextStyle(color:Colors.black,fontSize: 22,
                        // fontWeight:FontWeight.w800
                        // ),
                        // ),
                        SizedBox(
                            width:MediaQuery.of(context).size.width*0.8,
                            child: Image.network(
                              imageList[0],
                              //controller.buildingList[index]['image'],
                              fit:BoxFit.fill,
                            )),
                        Custom_Text(text: controller.buildingList[index]['name'],
                          fontSize: 19,color:Colors.blue,
                        ), 
                        Custom_Text(text: "السعر = "+controller.buildingList[index]['price'].toString()
                            +" " +currency,
                          fontSize: 16,color:Colors.blue,
                        ), Custom_Text(text:"الهاتف : "+ controller.buildingList[index]['phone'].toString()
                           ,
                          fontSize: 16,color:Colors.black,
                        ),Custom_Text(text: "البريد الالكتروني : "+controller.buildingList[index]
                        ['user_email'].toString(),
                          fontSize: 16,color:Colors.black,
                        ),
                        const SizedBox(height: 18,),

                        Row(

                          children: [
                            const SizedBox(width: 60,),
                          CustomButton(text: 'تعديل ',
                              onPressed: (){

                            Get.to(EditBuilding(
                              data: controller.buildingList[index],
                            ));

                              }),
                            const SizedBox(width: 20,),
                          CustomButton(text: 'حذف ',
                              onPressed: (){

                                controller. showDeleteDialog
                                (context,controller.buildingList[index]['id'].toString());

                              })
                        ],),
                        const SizedBox(height: 18,)




                      ],),
                    ),
                  );
                }),
          );
        }
      )
    );
  }
}