

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realstateAdmin/core/widgets/Custom_button.dart';
import 'package:realstateAdmin/core/widgets/custom_app_bar.dart';
import 'package:realstateAdmin/core/widgets/custom_textformfield.dart';
import 'package:realstateAdmin/features/buildings/controller/item_controller.dart';

class AddBuildingsView extends StatefulWidget {
  const AddBuildingsView({super.key});

  @override
  State<AddBuildingsView> createState() => _AddBuildingsViewState();
}

class _AddBuildingsViewState extends State<AddBuildingsView> {

  ItemController controller=Get.put(ItemController());



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar('', context, false),
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView(children: [
            const SizedBox(height: 10,),
            CustomTextFormField(hint: 'اسم المبنى',
             obs: false, controller: controller.nameController),
          
             const SizedBox(height: 10,),
            CustomTextFormField(hint: 'اسم الموقع',
             obs: false, controller: controller.locationNameController),
          
             const SizedBox(height: 10,),
            CustomTextFormField(hint: 'السعر ',
             obs: false, controller: controller.priceController),
          
             const SizedBox(height: 10,),
            CustomTextFormField(hint: 'رقم الهاتف ',
             obs: false, controller: controller.phoneController),
          
             const SizedBox(height: 10,),
            CustomTextFormField(hint: 'المدينة ',
             obs: false, controller: controller.locationCountry),
          
             const SizedBox(height: 10,),
            CustomTextFormField(hint: 'مساحة المبنى ',
             obs: false, controller: controller.locationArea),
          
             const SizedBox(height: 10,),
            CustomTextFormField(hint: 'رقم المبني ',
             obs: false, controller: controller.buildingNumberController),
          
             const SizedBox(height: 10,),
          
            CustomTextFormField(hint: 'عدد الحمامات ',
             obs: false, controller: controller.toiletController),
          
          
             const SizedBox(height: 10,),
            CustomTextFormField(hint: 'اسم المبنى',
             obs: false, controller: controller.roomsController),
          
             const SizedBox(height: 10,),
            CustomTextFormField(hint: 'رقم الشقة ',
             obs: false, controller: controller.floorNumControoler),
          
             const SizedBox(height: 10,),
            CustomTextFormField(hint: 'السعر الشهري ',
             obs: false, controller: controller.monthlyRentController),
          
             const SizedBox(height: 10,),
            CustomTextFormField(hint: 'تامين البنك ',
             obs: false, controller: controller.bankSecurityController),
          
             const SizedBox(height: 10,),
            CustomTextFormField(hint: 'الايجار الشهري ',
             obs: false, controller: controller.rentTimeController),
          
             const SizedBox(height: 10,),
            CustomTextFormField(hint: 'امكانية الوجود ',
             obs: false, controller: controller.availabilityTimeController),
          
              const SizedBox(height: 20,),
           
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: CustomButton(text: 'حفظ', onPressed: (){
              
                controller.addNewItem();
              
              }),
            ),

               const SizedBox(height: 30,),
           
           
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          ],),
        ),
      ),
    );
  }
}