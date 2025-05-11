import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        appBar: AppBar(
          leading: Container(
            padding: const EdgeInsets.all(2.0),
            margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 4.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1.5),
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_back),

              onPressed: () {
                print('ok');
              },
            ),
          ),
          actions: [
            Container(
              padding: const EdgeInsets.all(2.0),
              margin: const EdgeInsets.symmetric(
                horizontal: 5.0,
                vertical: 4.0,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1.5),
              ),
              child: IconButton(
                icon: const Icon(Icons.grid_view_outlined),

                onPressed: () {
                  print('ok bro');
                },
              ),
            ),
          ],
        ),

        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 80.0,
                backgroundImage: AssetImage('assets/images/avatar.jpg'),
              ),
              SizedBox(height: 20.0),

              Text(
                'Kiet VAn Le',
                style: TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5.0),

              Text(
                'Thủ Đức, HCM',
                style: TextStyle(fontSize: 25.0, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
