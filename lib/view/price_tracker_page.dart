import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class PriceTrackerPage extends StatelessWidget {
  const PriceTrackerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Price tracker')),
      body: const Center(child: Text('main view')),
    );
  }
}
