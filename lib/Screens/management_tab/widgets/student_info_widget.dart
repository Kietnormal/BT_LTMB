import 'package:flutter/material.dart';

class StudentInfoWidget extends StatelessWidget {
  final String studentName;
  final VoidCallback onChangePressed;

  const StudentInfoWidget({
    super.key,
    required this.studentName,
    required this.onChangePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Sinh viên',
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey[300]!),
                ),
                child: Text(studentName, style: const TextStyle(fontSize: 16)),
              ),
            ),
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed: onChangePressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Thay đổi',
                style: TextStyle(color: Colors.white, fontFamily: 'Arial'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
