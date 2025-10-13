import 'package:get/get.dart';
import 'package:todo_list_app/routes/routes.dart';
import 'package:todo_list_app/bindings/login_bindings.dart';
import 'package:todo_list_app/bindings/dashboard_bindings.dart';
import 'package:todo_list_app/bindings/splashscreen_bindnigs.dart';
import 'package:todo_list_app/pages/splashscreen_page.dart';
import 'package:todo_list_app/pages/transform/dashboard_transform.dart';
import 'package:todo_list_app/pages/add_todo_page.dart';
import 'package:todo_list_app/pages/profile_page.dart';
import 'package:todo_list_app/pages/todo_list_page.dart';
import 'package:todo_list_app/pages/history_page.dart';
import 'package:todo_list_app/pages/transform/login_transform.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoute.splashscreenPage,
      page: () => SplashscreenPage(),
      binding: Splashbinding(),
    ),
    GetPage(
      name: AppRoute.loginPage,
      page: () => LoginTransform(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoute.dashboardPage,
      page: () => DashboardTransform(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: AppRoute.addPage,
      page: () => AddTodoPage(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: AppRoute.profilePage,
      page: () => const ProfilePage(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: AppRoute.todoListPage,
      page: () => TodoListPage(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: AppRoute.historyPage,
      page: () => HistoryPage(),
      binding: DashboardBinding(),
    ),
  ];
}
