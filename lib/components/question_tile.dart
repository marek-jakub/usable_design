import 'package:flutter/material.dart';

class QuestionTile extends StatelessWidget {
  final int index;
  final String question;

  const QuestionTile({
    Key? key,
    required this.index,
    required this.question,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(index.toString()),
          const SizedBox(width: 8.0),
          Expanded(
            child: Text(
              question,
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}
