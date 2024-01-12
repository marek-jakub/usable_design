import 'package:flutter/material.dart';

import '../../data/references.dart';

class ReferencesScreen extends StatelessWidget {
  const ReferencesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final references = References().getReferences;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('References'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
          itemCount: references.length,
          itemBuilder: (context, index) {
            final reference = references[index];
            return Padding(
              padding: const EdgeInsets.all(1.0),
              child: Text(_formatText(reference)),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(height: 15.0);
          },
        ),
      ),
    );
  }

  String _formatText(String question) {
    final extraWhiteSpace = RegExp(r'(?! )\s+| \s+');
    question = question.replaceAll('\n', '');
    question = question.replaceAll(extraWhiteSpace, ' ');

    return question;
  }
}
