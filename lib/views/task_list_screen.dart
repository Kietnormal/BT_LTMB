import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/task_viewmodel.dart'; // Sửa 'your_project_name'
import '../views/add_task_screen.dart';   // Sửa 'your_project_name'
import '../widgets/task_card.dart';     // Sửa 'your_project_name'

class TaskListScreen extends StatelessWidget {
  const TaskListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<TaskViewModel>(context);

    void navigateToAddScreen() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const AddTaskScreen()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("List", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        // THAY ĐỔI 1: Tùy chỉnh nút "Back" cho giống ảnh
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              // Thêm hành động nếu cần, ví dụ Navigator.maybePop(context);
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.arrow_back, color: Colors.white),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_circle, color: Colors.red, size: 30),
            onPressed: navigateToAddScreen,
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        itemCount: viewModel.tasks.length,
        itemBuilder: (context, index) {
          final task = viewModel.tasks[index];
          return TaskCard(task: task, index: index);
        },
      ),
      // THAY ĐỔI 2: Thêm thuộc tính `shape` để đổi hình dạng nút "+"
      floatingActionButton: FloatingActionButton(
        onPressed: navigateToAddScreen,
        backgroundColor: Colors.blue,
        // Đổi hình dạng từ tròn sang vuông bo góc
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: const Icon(Icons.add, color: Colors.white, size: 28),
        elevation: 2.0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(icon: const Icon(Icons.home_outlined), color: Colors.grey, onPressed: () {}),
              IconButton(icon: const Icon(Icons.calendar_today_outlined), color: Colors.grey, onPressed: () {}),
              const SizedBox(width: 40), // Khoảng trống cho FAB
              IconButton(icon: const Icon(Icons.file_copy_outlined), color: Colors.grey, onPressed: () {}),
              IconButton(icon: const Icon(Icons.settings_outlined), color: Colors.grey, onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}