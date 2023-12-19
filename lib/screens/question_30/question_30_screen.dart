import 'package:flutter/material.dart';

class QuestionThirtyScreen extends StatefulWidget {
  const QuestionThirtyScreen({Key? key}) : super(key: key);

  @override
  State<QuestionThirtyScreen> createState() => _QuestionThirtyScreenState();
}

class _QuestionThirtyScreenState extends State<QuestionThirtyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Question 30'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.grey),
              margin: const EdgeInsets.fromLTRB(0, 0, 4, 0),
              padding: const EdgeInsets.all(7),
              child: const Text('30'),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 7, 0, 0),
                child: Text.rich(
                  TextSpan(
                    text: _getQuestion30(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getQuestion30() {
    String question = '''Users dislike typing, is information computed
                   for the users where applicable?''';

    final extraWhiteSpace = RegExp(r'(?! )\s+| \s+');
    question = question.replaceAll('\n', '');
    question = question.replaceAll(extraWhiteSpace, ' ');

    return question;
  }
}
