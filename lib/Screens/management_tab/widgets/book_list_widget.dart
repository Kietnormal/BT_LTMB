import 'package:flutter/material.dart';
import '../../../models/book_model.dart';

class BookListWidget extends StatelessWidget {
  final List<Book> allBooks;
  final Set<String> selectedBookIds;
  final Function(String bookId, bool isSelected) onSelectionChanged;
  final bool forceShowListWhenSelectionsEmpty;

  const BookListWidget({
    super.key,
    required this.allBooks,
    required this.selectedBookIds,
    required this.onSelectionChanged,
    this.forceShowListWhenSelectionsEmpty = false,
  });

  @override
  Widget build(BuildContext context) {
    final placeholderDecoration = BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          spreadRadius: 1,
          blurRadius: 3,
          offset: const Offset(0, 1),
        ),
      ],
    );
    const placeholderPadding = EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 60,
    );
    const placeholderTextStyle = TextStyle(fontSize: 16, color: Colors.grey);

    if (allBooks.isEmpty) {
      return Container(
        width: double.infinity,
        padding: placeholderPadding,
        decoration: placeholderDecoration,
        child: const Center(
          child: Text(
            'Thư viện hiện không có sách nào.',
            textAlign: TextAlign.center,
            style: placeholderTextStyle,
          ),
        ),
      );
    }

    if (selectedBookIds.isEmpty && !forceShowListWhenSelectionsEmpty) {
      return Container(
        width: double.infinity,
        padding: placeholderPadding,
        decoration: placeholderDecoration,
        child: const Text(
          'Bạn chưa mượn quyển sách nào\nNhấn \'Thêm\' để bắt đầu hành trình đọc sách!',
          textAlign: TextAlign.center,
          style: placeholderTextStyle,
        ),
      );
    }

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: allBooks.length,
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        itemBuilder: (context, index) {
          final book = allBooks[index];
          final isSelected = selectedBookIds.contains(book.id);
          return InkWell(
            onTap: () {
              onSelectionChanged(book.id, !isSelected);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 8.0,
              ),
              child: Row(
                children: [
                  Checkbox(
                    value: isSelected,
                    onChanged: (bool? value) {
                      onSelectionChanged(book.id, value ?? false);
                    },
                    visualDensity: VisualDensity.compact,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      book.title,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const Divider(
            height: 1,
            thickness: 1,
            indent: 16,
            endIndent: 16,
          );
        },
      ),
    );
  }
}
