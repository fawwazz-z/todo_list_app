import 'package:get/get.dart';
import 'package:todo_list_app/bindings/splashscreen_bindnigs.dart';
import 'package:todo_list_app/pages/login_page.dart';
import 'package:todo_list_app/pages/dashboard_page.dart';
import 'package:todo_list_app/pages/add_todo_page.dart';
import 'package:todo_list_app/pages/profile_page.dart';
import 'package:todo_list_app/pages/splashscreen_page.dart';
import 'package:todo_list_app/pages/todo_list_page.dart';
import 'package:todo_list_app/pages/history_page.dart';
import 'package:todo_list_app/bindings/login_bindings.dart';
import 'package:todo_list_app/bindings/dashboard_bindings.dart';
import 'routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoute.loginPage,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoute.dashboardPage,
      page: () => const DashboardPage(),
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
    GetPage(
      name: AppRoute.splashscreenPage,
      page: () => SplashscreenPage(),
      binding: splashbinding(),
    ),
  ];
}
