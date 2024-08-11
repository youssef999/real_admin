

// ignore_for_file: must_be_immutable

 import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realstateAdmin/core/widgets/Custom_Text.dart';
import 'package:realstateAdmin/core/widgets/Custom_button.dart';
import 'package:realstateAdmin/core/widgets/custom_app_bar.dart';
import 'package:realstateAdmin/core/widgets/custom_textformfield.dart';
import 'package:realstateAdmin/features/buildings/controller/edit_building_controller.dart';

class EditBuilding extends StatelessWidget {
  Map<String,dynamic>data;

   EditBuilding({super.key,required this.data});

  @override
  Widget build(BuildContext context) {

    EditBuildingController controller =Get.put(EditBuildingController());

    return Scaffold(
      appBar: CustomAppBar('', context, false),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(children: [
          const Custom_Text(text: 'اسم المبني',
          fontSize: 20,color:Colors.black,
          ),
          const SizedBox(height: 10,),
          CustomTextFormField(hint: data['name'],
              obs: false, controller: controller.buiildingController),

        
          const Custom_Text(text: 'السعر',
            fontSize: 20,color:Colors.black,
          ),
          const SizedBox(height: 10,),
          CustomTextFormField(hint: data['price'],
              obs: false, controller: controller.priceController),

           const Custom_Text(text: 'الهاتف',
            fontSize: 20,color:Colors.black,
          ),
          const SizedBox(height: 10,),
          CustomTextFormField(hint: data['phone'],
              obs: false, controller: controller.phoneController),

          const SizedBox(height: 11,),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomButton(text: 'تعديل', onPressed:(){

              controller.updateBuilding(data);

            } ),
          )


        ],),
      ),
    );
  }
}
