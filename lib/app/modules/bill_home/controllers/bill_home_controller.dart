import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:wolfizutilityapps/app/data/bill_models/bill_model.dart';
import 'package:wolfizutilityapps/main.dart';

class BillHomeController extends SuperController {
  //TODO: Implement BillHomeController

  TextEditingController wattsController = TextEditingController();
  TextEditingController hoursPerDayController = TextEditingController();
  TextEditingController daysPerMonthController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController unitPriceController = TextEditingController();
  final _bills = RxList<Bill>();

  var totalCurrentBill = 0.0.obs;
  var totalNetBill = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    //[
  }

  List<Bill> get getAllBills => _bills;

  double calculateCurrentBill() {
    totalCurrentBill.value =
        double.parse(wattsController.text.replaceAll(",", "")) *
            double.parse(hoursPerDayController.text.replaceAll(",", "")) *
            double.parse(daysPerMonthController.text.replaceAll(",", "")) *
            double.parse(quantityController.text.replaceAll(",", ""));
    totalCurrentBill.value = totalCurrentBill.value / 1000.0;
    totalCurrentBill.value = totalCurrentBill.value *
        remoteConfig.getDouble('unit_price');

    totalNetBill.value = totalNetBill.value + totalCurrentBill.value;

    return totalCurrentBill.value;
  }

  void addNewBill() {
    Bill bill = Bill(
        watts: double.parse(wattsController.text.replaceAll(",", "")),
        hoursPerDay:
        double.parse(hoursPerDayController.text.replaceAll(",", "")),
        daysPerMonth:
        double.parse(daysPerMonthController.text.replaceAll(",", "")),
        quantity: double.parse(quantityController.text.replaceAll(",", "")),
        // unitPrice: double.parse(unitPriceController.text.replaceAll(",", "")),
        unitPrice: remoteConfig.getDouble('unit_price'),
        totalbill: calculateCurrentBill());

    _bills.add(bill);

    wattsController.clear();
    hoursPerDayController.clear();
    daysPerMonthController.clear();
    quantityController.clear();
    unitPriceController.clear();
  }

  @override
  void onClose() {
    ///[
    super.onClose();
  }

  @override
  void onDetached() {
    // TODO: implement onDetached
  }

  @override
  void onInactive() {
    // TODO: implement onInactive
  }

  @override
  void onPaused() {
    // TODO: implement onPaused
  }

  @override
  void onResumed() {
    // TODO: implement onResumed
  }
}