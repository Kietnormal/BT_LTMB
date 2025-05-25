import 'package:flutter/material.dart';

class RowLayoutScreen extends StatelessWidget {
  const RowLayoutScreen({super.key});

  final Color lightBlueColor = const Color(0xFFD1E3F6);
  final Color darkBlueColor = const Color(0xFF5699E5);
  final Color greyWrapperBackgroundColor = const Color(0xFFF0F0F0);

  final double boxHeight = 70.0;
  final double boxWidth = 100.0;
  final double boxBorderRadius = 12.0;
  final double greyWrapperBorderRadius = 16.0;

  final double verticalSpacing = 16.0;
  final double screenPadding = 20.0;

  Widget _buildRoundedBox(Color color) {
    return Container(
      width: boxWidth,
      height: boxHeight,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(boxBorderRadius),
      ),
    );
  }

  Widget _buildInternalRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _buildRoundedBox(lightBlueColor),
        _buildRoundedBox(darkBlueColor),
        _buildRoundedBox(lightBlueColor),
      ],
    );
  }

  Widget _buildARowWithGreyBackground() {
    return Container(
      padding: const EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        color: greyWrapperBackgroundColor,
        borderRadius: BorderRadius.circular(greyWrapperBorderRadius),
      ),
      child: _buildInternalRow(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: darkBlueColor),
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.of(context).pop();
            }
          },
        ),
        title: Text(
          'Row Layout',
          style: TextStyle(color: darkBlueColor, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.8,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(screenPadding),
        child: Column(
          children: <Widget>[
            _buildARowWithGreyBackground(),
            SizedBox(height: verticalSpacing),
            _buildARowWithGreyBackground(),
            SizedBox(height: verticalSpacing),
            _buildARowWithGreyBackground(),
            SizedBox(height: verticalSpacing),
            Container(
              padding: const EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  greyWrapperBorderRadius + 4.0,
                ),
              ),
              child: _buildARowWithGreyBackground(),
            ),
          ],
        ),
      ),
    );
  }
}
