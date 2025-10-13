import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list_app/controllers/dashboard_controller.dart';
import 'package:todo_list_app/pages/todo_list_page.dart';
import 'package:todo_list_app/pages/history_page.dart';
import 'package:todo_list_app/pages/profile_page.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final DashboardController controller = Get.find<DashboardController>();
    final pages = [TodoListPage(), HistoryPage(), ProfilePage()];

    return Obx(
      () => Scaffold(
        body: Row(
          children: [
            NavigationRail(
              selectedIndex: controller.currentIndex.value,
              onDestinationSelected: controller.changeTab,
              labelType: NavigationRailLabelType.all,
              destinations: const [
                NavigationRailDestination(
                  icon: Icon(Icons.list),
                  label: Text('Tugas'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.history),
                  label: Text('History'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.person),
                  label: Text('Profil'),
                ),
              ],
            ),
            const VerticalDivider(thickness: 1, width: 1),
            Expanded(child: pages[controller.currentIndex.value]),
          ],
        ),
      ),
    );
  }
}
