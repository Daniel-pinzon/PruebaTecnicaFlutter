import 'package:flutter/material.dart';

class TablaWidget extends StatelessWidget {
  final String title;
  final List<String> items;

  const TablaWidget({
    super.key,
    required this.title,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(items[index]),
        );
      },
    );
  }
}