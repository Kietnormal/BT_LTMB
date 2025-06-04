import 'package:flutter/material.dart';
import 'management_tab/management_page.dart';
import 'book_list_tab/book_list_page.dart';
import 'student_tab/student_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const ManagementPage(),
    const BookListTabPage(),
    const StudentListTabPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final appBarTheme = Theme.of(context).appBarTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Hệ thống\nQuản lý Thư viện",
          textAlign: TextAlign.center,
          style: appBarTheme.titleTextStyle?.copyWith(
            height: 1.2,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        backgroundColor: appBarTheme.backgroundColor,
        foregroundColor: appBarTheme.foregroundColor,
        elevation: appBarTheme.elevation,
      ),
      body: IndexedStack(index: _selectedIndex, children: _widgetOptions),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_applications),
            label: 'Quản lý',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'DS Sách',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_search_outlined),
            label: 'Sinh viên',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
