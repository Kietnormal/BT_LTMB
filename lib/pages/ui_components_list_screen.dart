import 'package:flutter/material.dart';
import 'package:myfirstapp/pages/ImageScreen.dart';
import 'package:myfirstapp/pages/PassWordField.dart';
import 'package:myfirstapp/pages/RowComponets.dart';
import 'package:myfirstapp/pages/TextDetail.dart';
import 'package:myfirstapp/pages/TextField.dart';
import 'package:myfirstapp/pages/ColumComponets.dart';
import 'package:myfirstapp/pages/ControlUImore.dart';

class UIComponentsListScreen extends StatelessWidget {
  const UIComponentsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Color appBarItemColor = const Color(0xFF2196F3);

    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Components List'),
        backgroundColor: Colors.white,
        foregroundColor: appBarItemColor,
        centerTitle: true,
        leading:
            Navigator.canPop(context)
                ? IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: () => Navigator.of(context).pop(),
                )
                : null,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Display',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                _buildComponentCard(
                  title: 'Text',
                  description: 'Displays text',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TextDetailScreen(),
                      ),
                    );
                  },
                ),
                _buildComponentCard(
                  title: 'Image',
                  description: 'Displays an image',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ImagesScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),

                const Text(
                  'Input',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                _buildComponentCard(
                  title: 'TextField',
                  description: 'Input field for text',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MirroredTextFieldScreen(),
                      ),
                    );
                  },
                ),
                _buildComponentCard(
                  title: 'PasswordField',
                  description: 'Input field for passwords',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PasswordFieldScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),

                const Text(
                  'Layout',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                _buildComponentCard(
                  title: 'Column',
                  description: 'Arranges elements vertically',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ColumnLayoutScreen(),
                      ),
                    );
                  },
                ),
                _buildComponentCard(
                  title: 'Row',
                  description: 'Arranges elements horizontally',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RowLayoutScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
                _buildComponentCard(
                  title: 'Tự tìm hiểu',
                  description: 'Tìm ra tất cả các thành phần UI Cơ bản',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ControlsDemoScreen(),
                      ),
                    );
                  },
                  cardColor: const Color(0x4DE80400),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildComponentCard({
    required String title,
    required String description,
    Color? cardColor,
    VoidCallback? onTap,
  }) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          decoration: BoxDecoration(
            color: cardColor ?? Colors.blue.shade100,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: const TextStyle(fontSize: 14, color: Colors.black87),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
