import 'package:flutter/material.dart';

class TextDetailScreen extends StatelessWidget {
  const TextDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Color appBarItemColor = Colors.blue.shade700;

    return Scaffold(
      appBar: AppBar(
        leading:
            Navigator.canPop(context)
                ? IconButton(
                  icon: Icon(Icons.arrow_back_ios, color: appBarItemColor),
                  onPressed: () => Navigator.of(context).pop(),
                )
                : null,
        title: Text(
          'Text Detail',
          style: TextStyle(color: appBarItemColor, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 1.0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: const TextSpan(
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.black,
                    height: 1.2,
                  ),
                  children: <TextSpan>[
                    TextSpan(text: 'The '),
                    TextSpan(
                      text: 'quick ',
                      style: TextStyle(decoration: TextDecoration.underline),
                    ),
                    TextSpan(
                      text: 'Brown',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFE89A00),
                      ),
                    ),
                  ],
                ),
              ),
              RichText(
                text: const TextSpan(
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.black,
                    height: 1.2,
                  ),
                  children: <TextSpan>[
                    TextSpan(text: 'fox j u m p s '),
                    TextSpan(
                      text: 'over',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              RichText(
                text: const TextSpan(
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.black,
                    height: 1.2,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'the ',
                      style: TextStyle(decoration: TextDecoration.underline),
                    ),
                    TextSpan(
                      text: 'lazy ',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                    TextSpan(text: ' dog.'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
