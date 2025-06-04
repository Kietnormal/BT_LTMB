import 'package:flutter/material.dart';
import '../../models/student_model.dart';
import '../../models/book_model.dart';
import '../../data/mock_data.dart';
import 'widgets/student_info_widget.dart';
import 'widgets/book_list_widget.dart';
import 'widgets/student_list_item_widget.dart';

class ManagementPage extends StatefulWidget {
  const ManagementPage({super.key});

  @override
  State<ManagementPage> createState() => _ManagementPageState();
}

class _ManagementPageState extends State<ManagementPage> {
  late List<Student> _students;
  late List<Book> _allBooks;
  Student? _currentStudent;
  Set<String> _temporarilySelectedBookIds = {};
  bool _forceDisplayBookList = false;

  @override
  void initState() {
    super.initState();
    _students = MockData.getStudents();
    _allBooks = MockData.getBooks();
    if (_students.isNotEmpty) {
      _selectStudent(_students.first);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _selectStudent(Student student) {
    setState(() {
      _currentStudent = student;
      _temporarilySelectedBookIds = Set<String>.from(
        _currentStudent!.selectedBookIds,
      );
      _forceDisplayBookList = false;
    });
  }

  void _showStudentSelectionDialog() {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Chọn sinh viên'),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          contentPadding: const EdgeInsets.only(
            top: 16.0,
            bottom: 8.0,
            left: 8.0,
            right: 8.0,
          ),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _students.length,
              itemBuilder: (BuildContext context, int index) {
                final student = _students[index];
                return StudentListItemWidget(
                  student: student,
                  isSelected: _currentStudent?.id == student.id,
                  onTap: () {
                    _selectStudent(student);
                    Navigator.of(dialogContext).pop();
                  },
                );
              },
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Đóng', style: TextStyle(color: Colors.blue)),
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _onBookSelectionChanged(String bookId, bool isSelected) {
    setState(() {
      if (_currentStudent != null) {
        if (isSelected) {
          _currentStudent!.selectedBookIds.add(bookId);
        } else {
          _currentStudent!.selectedBookIds.remove(bookId);
        }
        _temporarilySelectedBookIds = Set<String>.from(
          _currentStudent!.selectedBookIds,
        );
        if (_temporarilySelectedBookIds.isNotEmpty) {
          _forceDisplayBookList = false;
        }
      }
    });
  }

  void _handleAddAction() {
    if (_currentStudent == null) return;

    if (_currentStudent!.selectedBookIds.isEmpty) {
      if (!_forceDisplayBookList) {
        setState(() {
          _forceDisplayBookList = true;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Vui lòng chọn sách từ danh sách để thêm.'),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Bạn vẫn chưa chọn quyển sách nào từ danh sách.',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.orangeAccent,
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Đã xử lý cho SV: ${_currentStudent!.name} với sách IDs: ${_currentStudent!.selectedBookIds}',
          ),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_currentStudent == null) {
      return const Center(child: Text('Không có thông tin sinh viên.'));
    }
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          StudentInfoWidget(
            studentName: _currentStudent!.name,
            onChangePressed: _showStudentSelectionDialog,
          ),
          const SizedBox(height: 24),
          Text(
            'Danh sách sách',
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          BookListWidget(
            allBooks: _allBooks,
            selectedBookIds: _temporarilySelectedBookIds,
            onSelectionChanged: _onBookSelectionChanged,
            forceShowListWhenSelectionsEmpty: _forceDisplayBookList,
          ),
          const SizedBox(height: 32),
          Center(
            child: ElevatedButton(
              onPressed: _handleAddAction,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(
                  horizontal: 50,
                  vertical: 15,
                ),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              ),
              child: const Text(
                'Thêm',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Arial',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
