import 'package:flutter/material.dart';

class FilledButtonActionWidget extends StatelessWidget {
  const FilledButtonActionWidget(
      {super.key,
      required this.title,      
      required this.action});

  final String title;
  final Function action;
  @override
  Widget build(BuildContext context) {
    return FilledButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => action(),
              ));
        },
        child: Text(title));
  }
}
