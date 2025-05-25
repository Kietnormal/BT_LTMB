import 'package:flutter/material.dart';

class ImagesScreen extends StatelessWidget {
  const ImagesScreen({super.key});

  final Color appBarItemColor = const Color(0xFF5699E5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: appBarItemColor),
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.of(context).pop();
            }
          },
        ),
        title: Text(
          'Images',
          style: TextStyle(color: appBarItemColor, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 1.0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          _buildImageItem(
            imageContent: Image.asset(
              'assets/image 5.png',
              fit: BoxFit.cover,
              height: 220,
              width: double.infinity,
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: Text(
              'https://giaothongvantaitphcm.edu.vn/wp-content/uploads/2025/01/Logo-GTVT.png',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ),
          const SizedBox(height: 16),
          _buildImageItem(
            imageContent: Image.asset(
              'assets/uth_bg_05 1.png',
              fit: BoxFit.cover,
              height: 220,
              width: double.infinity,
            ),
          ),
          const SizedBox(height: 24),
          const Center(
            child: Text(
              'In app',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildImageItem({required Widget imageContent}) {
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      clipBehavior: Clip.antiAlias,
      child: imageContent,
    );
  }
}
