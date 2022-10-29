import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({
    super.key,
  });
  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    notifi(String path, text) {
      return Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.all(10.0),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.all(5.0),
                child: Image.asset(
                  path,
                  height: 30.0,
                ),
              ),
              Expanded(
                child: Text(text),
              ),
              IconButton(onPressed: () => {}, icon: const Icon(Icons.close)),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: const Color(0xFFF2F2F2),
        title: const Text(
          "NOTIFICATIONS",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () => {},
                  child: const Text(
                    'New',
                    style: TextStyle(color: Colors.black45),
                  ),
                ),
                TextButton(
                  onPressed: () => {},
                  child: const Text('CLEAR ALL'),
                ),
              ],
            ),
            notifi(
                'assets/icons/warning.png', 'A product item has been expired'),
            notifi('assets/icons/caution.png', 'A product is about to expire'),
            notifi(
                'assets/icons/tick-mark.png', 'Your report has been approved'),
            notifi(
                'assets/icons/tick-mark.png', 'Your report has been approved'),
            notifi('assets/icons/caution.png', 'A product is about to expire'),
            notifi(
                'assets/icons/warning.png', 'A product item has been expired'),
          ],
        ),
      ),
      backgroundColor: const Color(0xFFF2F2F2),
    );
  }
}
