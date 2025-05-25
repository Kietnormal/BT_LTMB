import 'package:flutter/material.dart';

class MirroredTextFieldScreen extends StatefulWidget {
  const MirroredTextFieldScreen({super.key});

  @override
  State<MirroredTextFieldScreen> createState() =>
      _MirroredTextFieldScreenState();
}

class _MirroredTextFieldScreenState extends State<MirroredTextFieldScreen> {
  final TextEditingController _mainInputController = TextEditingController();
  String _mirroredText = "";

  @override
  void initState() {
    super.initState();
    _mainInputController.addListener(() {
      setState(() {
        _mirroredText = _mainInputController.text;
      });
    });
  }

  @override
  void dispose() {
    _mainInputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color appBarItemColor = Colors.blue.shade700;
    final Color redLabelColor = Colors.red;
    final Color textFieldBorderColor = Colors.grey.shade400;

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
          'TextField',
          style: TextStyle(color: appBarItemColor, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.5,
      ),
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 24.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextField(
                        controller: _mainInputController,
                        decoration: InputDecoration(
                          hintText: 'Thông tin nhập',
                          hintStyle: TextStyle(
                            color: Colors.grey[500],
                            fontSize: 16,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: textFieldBorderColor,
                              width: 1.2,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: 1.5,
                            ),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 14.0,
                          ),
                        ),
                        style: const TextStyle(fontSize: 16.0),
                        maxLines: null,
                        minLines: 1,
                      ),
                      const SizedBox(height: 12.0),
                      Text(
                        'Tự động cập nhật dữ liệu theo textfield:',
                        style: TextStyle(color: redLabelColor, fontSize: 13.0),
                      ),
                      const SizedBox(height: 8.0),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          vertical: 12.0,
                          horizontal: 8.0,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey[50],
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        constraints: const BoxConstraints(minHeight: 50),
                        child: Text(
                          _mirroredText.isEmpty ? '' : _mirroredText,
                          style: TextStyle(
                            color:
                                _mirroredText.isEmpty
                                    ? Colors.grey.shade700
                                    : Colors.black87,
                            fontSize: 16.0,
                            fontWeight:
                                _mirroredText.isEmpty
                                    ? FontWeight.normal
                                    : FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
