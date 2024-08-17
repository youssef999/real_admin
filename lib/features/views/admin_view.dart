

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realstateAdmin/core/widgets/Custom_button.dart';
import 'package:realstateAdmin/features/buildings/views/show_buildings_view.dart';
import 'package:realstateAdmin/features/users/views/brokers_view.dart';
import 'package:realstateAdmin/features/users/views/users_view.dart';

import '../buildings/views/add_buildings_view.dart';
import '../buildings/views/new_item_view.dart';

class AdminView extends StatelessWidget {
  const AdminView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Padding(
        padding: const EdgeInsets.all(14.0),
        child: ListView(
          children: [
            const SizedBox(height: 30,),
            CustomButton(text: 'اضف مبني جديد ', onPressed:(){

Get.to(const ItemView());
              //Get.to(const AddBuildingsView());
              
            }),
            const SizedBox(height: 20,),
            CustomButton(text: 'جميع المباني', onPressed:(){
              Get.to(const ShowBuildingsView());
            }),
             const SizedBox(height: 20,),
            CustomButton(text: 'جميع المستخدمين', onPressed:(){

              Get.to(const UsersView());
            }),
             const SizedBox(height: 20,),
            CustomButton(text: 'جميع السماسرة ', onPressed:(){
              Get.to(const BrokersView());
            }),
          ],
        ),
      )
      
    );
  }
}