import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomeScreen());
  }
}

class HomeScreen extends StatelessWidget {
  // Function to show different bottom sheets based on the button clicked
  void showBottomSheet(BuildContext context, String title, String content) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(content, textAlign: TextAlign.center),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Close the modal
                },
                child: Text('Close'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Multiple Bottom Sheets')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed:
                  () => showBottomSheet(
                    context,
                    'Sheet 1',
                    'This is the first bottom sheet!',
                  ),
              child: Text('Show Sheet 1'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed:
                  () => showBottomSheet(
                    context,
                    'Sheet 2',
                    'This is the second bottom sheet!',
                  ),
              child: Text('Show Sheet 2'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed:
                  () => showBottomSheet(
                    context,
                    'Sheet 3',
                    'This is the third bottom sheet!',
                  ),
              child: Text('Show Sheet 3'),
            ),
          ],
        ),
      ),
    );
  }
}
