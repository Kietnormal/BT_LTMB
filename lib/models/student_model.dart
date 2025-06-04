class Student {
  final String id;
  final String name;
  Set<String> selectedBookIds;
  Student({
    required this.id,
    required this.name,
    Set<String>? initialSelectedBookIds,
  }) : selectedBookIds = initialSelectedBookIds ?? {};
}
