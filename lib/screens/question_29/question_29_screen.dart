import 'package:flutter/material.dart';

import '../../data/questions.dart' as uq;

class QuestionTwentyNine extends StatefulWidget {
  const QuestionTwentyNine({Key? key}) : super(key: key);

  @override
  State<QuestionTwentyNine> createState() => _QuestionTwentyNineState();
}

class _QuestionTwentyNineState extends State<QuestionTwentyNine> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Question 29'),
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
                    child: const Text('29'),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 7, 0, 0),
                      child: Text.rich(
                        TextSpan(
                          text: uq.UsabilityQuestions().getQuestions[28],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(14, 5, 14, 10),
              child: Text(
                'Insert introduction here',
                textAlign: TextAlign.justify,
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(14, 5, 14, 10),
              child: Text(
                'Insert summary here',
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
}
