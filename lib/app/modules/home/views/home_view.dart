import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import 'package:get/get.dart';
import 'package:wolfizutilityapps/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My FLutter Apps'),
        centerTitle: true,
      ),
      body: GridView(gridDelegate: gridDelegate)
    );
  }
}

class HomeCustomButtons extends StatelessWidget {
  final String label;
  final Function()? routeName;
  const HomeCustomButtons({
    Key? key, required this.label, required this.routeName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 100.h,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: routeName,
            child: Card(
              color: Colors.blue.shade50,
              child: Center(
                child: Text(
                  '$label',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Column(
// children: [
// Row(
// children: [
// HomeCustomButtons(label: 'Todo App', routeName: (){
// Get.toNamed(Routes.TODO_HOME);
// },),
// HomeCustomButtons(label: 'Bill Calculator App', routeName: (){
// Get.toNamed(Routes.BILL_HOME);
// },),
// ],
// ),
// Row(
// children: [
// HomeCustomButtons(label: 'Milk Recorder App', routeName: (){
// Get.toNamed(Routes.MILK_HOME);
// },),
// ],
// ),
// ],
// ),