import 'package:flutter/material.dart';

import '../components/question_tile.dart';
import '../data/questions.dart';

class QuestionListScreen extends StatelessWidget {
  const QuestionListScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usabilityQuestions = UsabilityQuestions().getQuestions;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Usability Questions'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
          itemCount: usabilityQuestions.length,
          itemBuilder: (context, index) {
            final question = usabilityQuestions[index];
            return Padding(
              padding: const EdgeInsets.all(1.0),
              child: InkWell(
                child: QuestionTile(index: index + 1, question: question),
                onTap: () =>
                    Navigator.pushNamed(context, '/question_${index + 1}'),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(height: 8.0);
          },
        ),
      ),
    );
  }
}
