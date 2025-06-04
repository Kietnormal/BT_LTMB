import 'package:flutter/material.dart';
import '../../models/book_model.dart';
import '../../data/mock_data.dart';

class BookListTabPage extends StatefulWidget {
  const BookListTabPage({super.key});

  @override
  State<BookListTabPage> createState() => _BookListTabPageState();
}

class _BookListTabPageState extends State<BookListTabPage> {
  late List<Book> _allBooks;

  @override
  void initState() {
    super.initState();
    _allBooks = MockData.getBooks();
  }

  @override
  Widget build(BuildContext context) {
    if (_allBooks.isEmpty) {
      return const Center(
        child: Text(
          'Không có sách nào trong thư viện.',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: _allBooks.length,
      itemBuilder: (context, index) {
        final book = _allBooks[index];
        return Card(
          elevation: 2.0,
          margin: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 4.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: ListTile(
            leading: Icon(
              Icons.menu_book,
              color: Theme.of(context).primaryColor,
              size: 28,
            ),
            title: Text(
              book.title,
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
            subtitle: Text(
              'ID: ${book.id}',
              style: TextStyle(color: Colors.grey[600]),
            ),
            onTap: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('Đã chọn: ${book.title}')));
            },
          ),
        );
      },
    );
  }
}
