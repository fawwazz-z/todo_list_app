import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list_app/controllers/dashboard_controller.dart';
import 'package:todo_list_app/pages/todo_list_page.dart';
import 'package:todo_list_app/pages/history_page.dart';
import 'package:todo_list_app/pages/profile_page.dart';

class DashboardMobile extends StatelessWidget {
  const DashboardMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final DashboardController controller = Get.find<DashboardController>();
    final pages = [TodoListPage(), HistoryPage(), ProfilePage()];

    return Obx(
      () => Scaffold(
        body: pages[controller.currentIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          onTap: controller.changeTab,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Tugas'),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'History',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
          ],
        ),
      ),
    );
  }
}
