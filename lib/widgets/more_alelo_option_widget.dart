import 'package:flutter/material.dart';

class MoreAleloOptionWidget extends StatelessWidget {
  final Color textColor;
  final Color color;
  final String description;

  const MoreAleloOptionWidget({
    Key key,
    this.textColor,
    this.color,
    this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 95,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            constraints: BoxConstraints(maxWidth: 100),
            child: Text(
              description,
              style: Theme.of(context)
                  .textTheme
                  .bodyText2
                  .copyWith(color: textColor, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}
