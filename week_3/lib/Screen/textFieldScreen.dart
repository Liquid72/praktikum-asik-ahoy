import 'package:flutter/material.dart';

class Textfieldscreen extends StatefulWidget {
  const Textfieldscreen({super.key});

  @override
  _TextfieldscreenState createState() => _TextfieldscreenState();
}

class _TextfieldscreenState extends State<Textfieldscreen> {
  final TextEditingController _controller = TextEditingController();
  String _text = '';

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onChanged(String value) {
    setState(() {
      _text = value;
    });
  }

  void _onSubmitted(String value) {
    setState(() {
      _text = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text Field Screen'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 256,
              child: TextField(
                textAlign: TextAlign.center,
                controller: _controller,
                onChanged: _onChanged,
                onSubmitted: _onSubmitted,
                decoration: const InputDecoration(
                  hintText: 'Enter text here',
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text('Anda Memasukan Kata: $_text'),
          ],
        ),
      ),
    );
  }
}
