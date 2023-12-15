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
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
          margin: const EdgeInsets.fromLTRB(0, 0, 4, 0),
          padding: const EdgeInsets.all(7),
          child: Text(
            (index < 10 ? '0$index' : index.toString()),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 7, 0, 0),
            child: Text(
              question,
              textAlign: TextAlign.justify,
            ),
          ),
        ),
      ],
    );
  }
}
