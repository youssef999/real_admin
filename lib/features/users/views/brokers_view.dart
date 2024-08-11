
 import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realstateAdmin/core/widgets/Custom_Text.dart';
import 'package:realstateAdmin/core/widgets/custom_app_bar.dart';
import 'package:realstateAdmin/features/users/controller/user_controller.dart';

class BrokersView extends StatefulWidget {
  const BrokersView({super.key});

  @override
  State<BrokersView> createState() => _UsersViewState();
}

class _UsersViewState extends State<BrokersView> {

UserController controller = Get.put(UserController());

  @override
  void initState() {
   controller.getBrokers();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(
      builder: (_) {
        return Scaffold(
          appBar: CustomAppBar('', context, false),
          body: UsersWidget()
        );
      }
    );
  }

  Widget UsersWidget(){
    return ListView.builder(
      itemCount: controller.brokerList.length,
      itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(children: [
              const SizedBox(height: 5,),

            SizedBox(
              height: 100,
              child: Image.asset('assets/images/user.png',)),

              Custom_Text(text: controller.brokerList[index]['user_name'],
              fontSize: 19,color:Colors.black,
              ),

             const SizedBox(height: 7,),

              Custom_Text(text: controller.brokerList[index]['user_email'],
              fontSize: 19,color:Colors.black,
              ),

              const SizedBox(height: 7,),

               CircleAvatar(
                radius: 35,
                 child: Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: IconButton(onPressed: (){
                   
                    controller.deleteUser(controller.brokerList[index]['user_id']);
                   
                   }, icon: const Icon(Icons.delete,color: Colors.red,)),
                 ),
               ),

                const SizedBox(height: 7,),


              
            ],),
          ),
        ),
      );
    });
  }
}
