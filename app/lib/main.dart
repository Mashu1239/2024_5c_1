import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String Tekst = "Przycisk nie zostal wcisniety";
  bool InProgress = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Apka'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.add_alert),
              tooltip: 'Show Snackbar',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('This is a snackbar')));
              },
            ),
            IconButton(
              icon: const Icon(Icons.accessible_forward_rounded),
              tooltip: 'Show Snackbar',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('This is a snackbar')));
              },
            ),
          ],
        ),
        body: Builder(
          builder: (BuildContext context) {
            return Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(Tekst),
                  ElevatedButton(
                    onPressed: _ChangeText,
                    child: InProgress
                        ? CircularProgressIndicator()
                        : Text("Zmien tekst"),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void _ChangeText() {
    setState(() {
      InProgress = true;
      Future.delayed(Duration(milliseconds: 3000), () {
        setState(() {
          InProgress = false;
          Tekst = "Przycisko zostal nacisniety";
        });
      });
    });
  }
}
