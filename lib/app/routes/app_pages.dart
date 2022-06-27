import 'package:get/get.dart';

import '../modules/bill_home/bindings/bill_home_binding.dart';
import '../modules/bill_home/views/bill_home_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/milk_home/bindings/milk_home_binding.dart';
import '../modules/milk_home/views/milk_home_view.dart';
import '../modules/todo_home/bindings/todo_home_binding.dart';
import '../modules/todo_home/views/todo_home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.BILL_HOME,
      page: () => const BillHomeView(),
      binding: BillHomeBinding(),
    ),
    GetPage(
      name: _Paths.TODO_HOME,
      page: () => const TodoHomeView(),
      binding: TodoHomeBinding(),
    ),
    GetPage(
      name: _Paths.MILK_HOME,
      page: () => const MilkHomeView(),
      binding: MilkHomeBinding(),
    ),
  ];
}
