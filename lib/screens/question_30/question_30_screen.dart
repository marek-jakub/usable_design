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
          title: const Text('Question 30'),
        ),
        body: const Text('Question 30 screen'));
  }
}