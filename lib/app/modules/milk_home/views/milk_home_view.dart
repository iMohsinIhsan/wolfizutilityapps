import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wolfizutilityapps/main.dart';

import '../controllers/milk_home_controller.dart';

class MilkHomeView extends GetView<MilkHomeController> {
  const MilkHomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Milk Recorder'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: 300.w,
            width: double.maxFinite,

            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(remoteConfig.getString('milk_image'))
              )
            ),
          ),
          Container(
            height: 50.w,
            width: double.maxFinite,
          )
        ],
      ),
    );
  }
}
