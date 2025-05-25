import 'package:flutter/material.dart';

class ControlsDemoScreen extends StatefulWidget {
  const ControlsDemoScreen({super.key});

  @override
  State<ControlsDemoScreen> createState() => _ControlsDemoScreenState();
}

enum SingingCharacter { option1, option2, option3 }

class _ControlsDemoScreenState extends State<ControlsDemoScreen> {
  bool _isChecked = false;
  bool _isSwitched = false;
  double _sliderValue = 50.0;
  final double _sliderMin = 0.0;
  final double _sliderMax = 100.0;
  SingingCharacter? _selectedCharacter = SingingCharacter.option1;

  @override
  Widget build(BuildContext context) {
    final Color activeControlColor = Colors.blue.shade600;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Controls Demo'),
        leading:
            Navigator.canPop(context)
                ? IconButton(
                  icon: Icon(Icons.arrow_back_ios, color: Colors.blue.shade700),
                  onPressed: () => Navigator.of(context).pop(),
                )
                : null,
        titleTextStyle: TextStyle(
          color: Colors.blue.shade700,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.8,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Checkbox',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Checkbox(
                  value: _isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked = value ?? false;
                    });
                  },
                  activeColor: activeControlColor,
                ),
                const Text('Checkbox'),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              'Radio Buttons:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Column(
              children: <Widget>[
                RadioListTile<SingingCharacter>(
                  title: const Text('option 1'),
                  value: SingingCharacter.option1,
                  groupValue: _selectedCharacter,
                  onChanged: (SingingCharacter? value) {
                    setState(() {
                      _selectedCharacter = value;
                    });
                  },
                  activeColor: activeControlColor,
                  contentPadding: EdgeInsets.zero,
                ),
                RadioListTile<SingingCharacter>(
                  title: const Text('option 2'),
                  value: SingingCharacter.option2,
                  groupValue: _selectedCharacter,
                  onChanged: (SingingCharacter? value) {
                    setState(() {
                      _selectedCharacter = value;
                    });
                  },
                  activeColor: activeControlColor,
                  contentPadding: EdgeInsets.zero,
                ),
                RadioListTile<SingingCharacter>(
                  title: const Text('option 3'),
                  value: SingingCharacter.option3,
                  groupValue: _selectedCharacter,
                  onChanged: (SingingCharacter? value) {
                    setState(() {
                      _selectedCharacter = value;
                    });
                  },
                  activeColor: activeControlColor,
                  contentPadding: EdgeInsets.zero,
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              'Switch (on/off)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Switch(
                  value: _isSwitched,
                  onChanged: (bool value) {
                    setState(() {
                      _isSwitched = value;
                    });
                  },
                  activeColor: activeControlColor,
                ),
                Text(_isSwitched ? 'on' : 'off'),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              'Slider:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Slider(
                    value: _sliderValue,
                    min: _sliderMin,
                    max: _sliderMax,
                    divisions: 100,
                    onChanged: (double value) {
                      setState(() {
                        _sliderValue = value;
                      });
                    },
                    activeColor: activeControlColor,
                    inactiveColor: Colors.grey.shade300,
                    thumbColor: activeControlColor,
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  _sliderValue.round().toString(),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
