import 'package:flutter/material.dart';
import '../models/task.dart'; // Sửa 'your_project_name'

class TaskCard extends StatelessWidget {
  final Task task;
  final int index;

  const TaskCard({super.key, required this.task, required this.index});

  @override
  Widget build(BuildContext context) {
    // Các màu chính xác như trong ảnh
    final colors = [
      const Color(0xFFE3F2FD), // Xanh nhạt
      const Color(0xFFFFEBEE), // Hồng đỏ nhạt
      const Color(0xFFE8F5E9), // Xanh lá nhạt
      const Color(0xFFFCE4EC), // Hồng nhạt
    ];

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: colors[index % colors.length],
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            task.title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black87),
          ),
          const SizedBox(height: 6),
          Text(
            task.description,
            style: const TextStyle(fontSize: 14, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}