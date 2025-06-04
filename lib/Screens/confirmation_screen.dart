import 'package:flutter/material.dart';
// Đảm bảo đường dẫn import AppLogo và DoneScreen là chính xác
import 'package:smart_task/Screens/widget/app_logo.dart';
import 'package:smart_task/screens/done_screen.dart'; // << THÊM IMPORT CHO DONE_SCREEN

class ConfirmationScreen extends StatefulWidget {
  final String email;
  final String otp;
  final String newPassword;

  const ConfirmationScreen({
    super.key,
    required this.email,
    required this.otp,
    required this.newPassword,
  });

  @override
  State<ConfirmationScreen> createState() => _ConfirmationScreenState();
}

class _ConfirmationScreenState extends State<ConfirmationScreen> {
  bool _isPasswordOnConfirmVisible = true;

  void _submitAndNavigate(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Processing request...'),
        duration: Duration(milliseconds: 500),
      ),
    );

    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const DoneScreen()),
      (Route<dynamic> route) => false,
    );
  }

  Widget _buildInfoField(BuildContext context, IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey.shade600, size: 22),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: 16, color: Colors.grey.shade800),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPasswordInfoField(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          Icon(Icons.lock_outline, color: Colors.grey.shade600, size: 22),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              _isPasswordOnConfirmVisible
                  ? widget.newPassword
                  : '●' * widget.newPassword.length,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade800,
                height: 1.5,
              ),
            ),
          ),
          IconButton(
            icon: Icon(
              _isPasswordOnConfirmVisible
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined,
              color: Colors.grey.shade600,
            ),
            onPressed: () {
              setState(() {
                _isPasswordOnConfirmVisible = !_isPasswordOnConfirmVisible;
              });
            },
            splashRadius: 20,
            padding: EdgeInsets.zero,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final canPop = Navigator.canPop(context);

    return Scaffold(
      appBar: AppBar(
        leading:
            canPop
                ? IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
                : null,
        automaticallyImplyLeading: canPop,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const AppLogo(),
              const SizedBox(height: 40),
              const Text(
                'Confirm',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'We are here to help you!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 30),
              _buildInfoField(context, Icons.email_outlined, widget.email),
              const SizedBox(height: 20),
              _buildInfoField(context, Icons.email_outlined, widget.otp),
              const SizedBox(height: 20),
              _buildPasswordInfoField(context),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () => _submitAndNavigate(context),
                child: const Text(
                  'Submit',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
