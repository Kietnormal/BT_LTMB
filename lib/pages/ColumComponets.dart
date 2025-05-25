import 'package:flutter/material.dart';

class ColumnLayoutScreen extends StatelessWidget {
  const ColumnLayoutScreen({super.key});

  final Color appBarTextColor = const Color(0xFF007AFF);
  final Color lightGreenColor = const Color(0xFFD7F0D8);
  final Color darkGreenColor = const Color(0xFF77DD77);
  final Color greyContainerBackground = const Color(0xFFF5F5F5);

  final double boxHeight = 150.0;
  final double boxBorderRadius = 20.0;
  final double greyContainerBorderRadius = 24.0;

  final double verticalSpacing = 20.0;
  final double screenPadding = 20.0;
  final double internalContainerPadding = 20.0;

  Widget _buildRoundedGreenBox(Color color) {
    return Container(
      height: boxHeight,
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(boxBorderRadius),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: appBarTextColor),
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.of(context).pop();
            }
          },
        ),
        title: Text(
          'Column Layout',
          style: TextStyle(color: appBarTextColor, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.8,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(screenPadding),
        child: Container(
          padding: EdgeInsets.all(internalContainerPadding),
          decoration: BoxDecoration(
            color: greyContainerBackground,
            borderRadius: BorderRadius.circular(greyContainerBorderRadius),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _buildRoundedGreenBox(lightGreenColor),
              SizedBox(height: verticalSpacing),
              _buildRoundedGreenBox(darkGreenColor),
              SizedBox(height: verticalSpacing),
              _buildRoundedGreenBox(lightGreenColor),
            ],
          ),
        ),
      ),
    );
  }
}
