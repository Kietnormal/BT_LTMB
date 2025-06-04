import 'package:flutter/material.dart';
import '../../models/student_model.dart';
import '../../data/mock_data.dart';

class StudentListTabPage extends StatefulWidget {
  const StudentListTabPage({super.key});

  @override
  State<StudentListTabPage> createState() => _StudentListTabPageState();
}

class _StudentListTabPageState extends State<StudentListTabPage> {
  late List<Student> _allStudents;

  @override
  void initState() {
    super.initState();
    _allStudents = MockData.getStudents();
  }

  @override
  Widget build(BuildContext context) {
    if (_allStudents.isEmpty) {
      return const Center(
        child: Text(
          'Không có thông tin sinh viên nào.',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: _allStudents.length,
      itemBuilder: (context, index) {
        final student = _allStudents[index];
        return Card(
          elevation: 2.0,
          margin: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 4.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: ListTile(
            leading: Icon(
              Icons.person_outline_rounded,
              color: Theme.of(context).primaryColor,
              size: 28,
            ),
            title: Text(
              student.name,
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
            subtitle: Text(
              'ID: ${student.id}',
              style: TextStyle(color: Colors.grey[600]),
            ),
            // trailing: Icon(Icons.arrow_forward_ios_rounded, size: 16, color: Colors.grey[400]), // Ví dụ: thêm icon điều hướng
            onTap: () {
              // Bạn có thể thêm hành động khi nhấn vào một sinh viên,
              // ví dụ: hiển thị chi tiết thông tin sinh viên hoặc các sách đã mượn
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Đã chọn sinh viên: ${student.name}')),
              );
            },
          ),
        );
      },
    );
  }
}
