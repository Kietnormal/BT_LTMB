import 'package:flutter/material.dart';
import 'package:myfirstapp/pages/ui_components_list_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'LÊ VĂn Kiệt',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '045205007200',
                        style: TextStyle(fontSize: 14, color: Colors.black87),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Image.asset('assets/image 1.png', height: 200),
            ),
            const SizedBox(height: 20),
            const Text(
              'Jetpack Compose',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Text(
                'Jetpack Compose is a modern UI toolkit for building native Android applications using a declarative programming approach.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const UIComponentsListScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 14,
                    horizontal: 60,
                  ),
                ),
                child: const Text(
                  "I'm ready",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
