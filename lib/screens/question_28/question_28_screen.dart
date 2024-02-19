import 'package:flutter/material.dart';

import '../../data/questions.dart' as uq;

class QuestionTwentyEight extends StatefulWidget {
  const QuestionTwentyEight({Key? key}) : super(key: key);

  @override
  State<QuestionTwentyEight> createState() => _QuestionTwentyEightState();
}

class _QuestionTwentyEightState extends State<QuestionTwentyEight> {
  final TextEditingController _textController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();

  final FocusNode _textNode = FocusNode();
  final FocusNode _numberNode = FocusNode();

  @override
  void dispose() {
    _textController.dispose();
    _numberController.dispose();
    _textNode.dispose();
    _numberNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Question 28'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
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
                    child: const Text('28'),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 7, 0, 0),
                      child: Text.rich(
                        TextSpan(
                          text: uq.UsabilityQuestions().getQuestions[27],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 5, 14, 10),
              child: Text(
                _getIntro(),
                textAlign: TextAlign.justify,
              ),
            ),
            Padding(
              key: const ValueKey('description'),
              padding: const EdgeInsets.fromLTRB(14, 5, 14, 10),
              child: Text(
                _getDescription(),
                textAlign: TextAlign.justify,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 5, 14, 10),
              child: Text(
                _getSummary(),
                textAlign: TextAlign.justify,
              ),
            ),
            TextButton(
              onPressed: () => Navigator.pushNamed(context, '/references'),
              child: const Text('References'),
            ),
          ],
        ),
      ),
    );
  }

  String _getIntro() {
    String introduction = '';

    return introduction;
  }

  String _getDescription() {
    String description = '';

    return description;
  }

  String _getSummary() {
    String summary = '';

    return summary;
  }
}
