import 'package:flutter/material.dart';
import 'package:price_tracker/view/price_tracker_page.dart';

class PriceTrackerApp extends StatelessWidget {
  const PriceTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'Price tracker';
    return const MaterialApp(
      title: title,
      home: MaterialApp(
        title: title,
        home: PriceTrackerPage(),
      ),
    );
  }
}
