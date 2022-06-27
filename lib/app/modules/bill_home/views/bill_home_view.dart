import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:wolfizutilityapps/app/data/bill_models/bill_model.dart';

import '../controllers/bill_home_controller.dart';

class BillHomeView extends GetView<BillHomeController> {
  const BillHomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Electric Bill Calculator'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Obx(
                () => controller.getAllBills.isEmpty
                ? const Center(
              child: Text('No Bills Added...'),
            )
                : ListView.builder(
                itemCount: controller.getAllBills.length,
                itemBuilder: (context, index) {
                  Bill bill = controller.getAllBills[index];
                  return index == 0
                      ? Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          color: Colors.greenAccent.shade100,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              "Total Net Bill : ${controller.totalNetBill.value}",
                              style: TextStyle(fontSize: 20.sp),
                            ),
                          ),
                        ),
                      ),
                      BillCard(
                          bill: bill,
                          controller: controller,
                          index: index),
                    ],
                  )
                      : BillCard(
                      bill: bill, controller: controller, index: index);
                }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: AlertDialog(
                    insetPadding: EdgeInsets.zero,
                    title: Center(
                      child: Text('Add New Bill'),
                    ),
                    content: Form(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            BillFormField(
                              hintText: 'Watts e.g 100',
                              billFromFieldController:
                              controller.wattsController,
                            ),
                            BillFormField(
                              hintText: 'Hours/Day e.g 15',
                              billFromFieldController:
                              controller.hoursPerDayController,
                            ),
                            BillFormField(
                              hintText: 'Days/Month e.g 20',
                              billFromFieldController:
                              controller.daysPerMonthController,
                            ),
                            BillFormField(
                              hintText: 'Quantity e.g 10',
                              billFromFieldController:
                              controller.quantityController,
                            ),
                            // BillFormField(
                            //   hintText: 'Unit Price e.g 21',
                            //   billFromFieldController:
                            //   controller.unitPriceController,
                            // ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16.0, horizontal: 16),
                              child: SizedBox(
                                width: double.maxFinite,
                                height: 50.h,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: StadiumBorder(),
                                    ),
                                    onPressed: () {
                                      controller.addNewBill();
                                      Get.back();
                                    },
                                    child: Text('Add Bill')),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class BillCard extends StatelessWidget {
  const BillCard({
    Key? key,
    required this.bill,
    required this.controller,
    required this.index,
  }) : super(key: key);

  final Bill bill;
  final BillHomeController controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.deepPurple.shade50,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(children: [
                Expanded(
                    child: Center(
                        child: Text(
                          'Type: ${index + 1}',
                          style: TextStyle(fontSize: 18.sp),
                        ))),
                // IconButton(
                //   onPressed: () {},
                //   icon: Icon(
                //     Icons.delete,
                //     color: Colors.red,
                //     size: 30.r,
                //   ),
                // ),
                SizedBox(
                  width: 20.w,
                )
              ]),
              Row(
                children: [
                  customContainer(
                    textWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Watts",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${bill.watts.toInt()}",
                        ),
                      ],
                    ),
                  ),
                  customContainer(
                    textWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Hours/Day",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${bill.hoursPerDay.toInt()}",
                        ),
                      ],
                    ),
                  ),
                  customContainer(
                    textWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Days/Month",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${bill.daysPerMonth.toInt()}",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  customContainer(
                    textWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Quantity",
                        ),
                        Text(
                          "${bill.quantity.toInt()}",
                        ),
                      ],
                    ),
                  ),
                  customContainer(
                    textWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Unit price",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${bill.unitPrice.toInt()}",
                        ),
                      ],
                    ),
                  ),
                  customContainer(
                    textWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Total Bill",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple.shade700),
                        ),
                        Text(
                          "${bill.totalbill.toInt()}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class customContainer extends StatelessWidget {
  const customContainer({
    Key? key,
    required this.textWidget,
  }) : super(key: key);

  final Widget textWidget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        width: 105.w,
        height: 50.w,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: textWidget,
        ),
        decoration: BoxDecoration(
            color: Colors.deepPurple.shade50,
            borderRadius: BorderRadius.all(Radius.circular(5)),
            border: Border.all(color: Colors.black26)),
      ),
    );
  }
}

class BillFormField extends StatelessWidget {
  const BillFormField({
    Key? key,
    required this.hintText,
    required this.billFromFieldController,
  }) : super(key: key);

  final String hintText;
  final TextEditingController billFromFieldController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: TextFormField(
        controller: billFromFieldController,
        keyboardType: TextInputType.numberWithOptions(decimal: true),
        inputFormatters: [
          FilteringTextInputFormatter.allow(
            RegExp('[0-9.]'),
          ),
        ],
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }
}