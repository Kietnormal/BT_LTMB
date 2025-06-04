import '../models/book_model.dart';
import '../models/student_model.dart';

class MockData {
  static List<Book> getBooks() {
    return [
      Book(id: 'b1', title: 'Sách 01'),
      Book(id: 'b2', title: 'Sách 02'),
      Book(id: 'b3', title: 'Sách 03'),
      Book(id: 'b4', title: 'Sách 04'),
    ];
  }

  static List<Student> getStudents() {
    return [
      Student(
        id: 's1',
        name: 'Nguyen Van A',
        initialSelectedBookIds: {'b1', 'b2'},
      ),
      Student(id: 's2', name: 'Nguyen Thi B', initialSelectedBookIds: {'b1'}),
      Student(id: 's3', name: 'Nguyen Van C', initialSelectedBookIds: {}),
    ];
  }
}
