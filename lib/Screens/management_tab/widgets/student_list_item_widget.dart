import 'package:flutter/material.dart';
import '../../../models/student_model.dart';

class StudentListItemWidget extends StatelessWidget {
  final Student student;
  final bool isSelected;
  final VoidCallback onTap;

  const StudentListItemWidget({
    super.key,
    required this.student,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 0),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue.withOpacity(0.1) : Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          border:
              isSelected
                  ? Border.all(color: Colors.blue.shade300, width: 1.5)
                  : null,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(
              Icons.person_outline_rounded,
              color: isSelected ? Colors.blue.shade700 : Colors.grey[700],
              size: 22,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                student.name,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  color: isSelected ? Colors.blue.shade700 : Colors.black87,
                ),
              ),
            ),
            if (isSelected)
              Icon(
                Icons.check_circle_outline_rounded,
                color: Colors.blue.shade700,
                size: 22,
              ),
          ],
        ),
      ),
    );
  }
}
