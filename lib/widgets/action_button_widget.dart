import 'package:flutter/material.dart';

class ActionButtonWidget extends StatelessWidget {
  final IconData icon;
  final String text;

  const ActionButtonWidget({Key key, this.icon, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(children: [
        Icon(
          icon,
          color: Theme.of(context).primaryColor,
        ),
        SizedBox(height: 5),
        Text(
          text,
          style: Theme.of(context)
              .textTheme
              .bodyText1
              .copyWith(color: Colors.grey[600], fontWeight: FontWeight.w300),
        ),
        SizedBox(height: 5),
      ]),
    );
  }
}
