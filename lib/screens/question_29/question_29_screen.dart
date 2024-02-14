import 'package:flutter/material.dart';

import '../../data/questions.dart' as uq;
import '../../screens/question_29/custom_form_field.dart';

class QuestionTwentyNine extends StatefulWidget {
  const QuestionTwentyNine({Key? key}) : super(key: key);

  @override
  State<QuestionTwentyNine> createState() => _QuestionTwentyNineState();
}

class _QuestionTwentyNineState extends State<QuestionTwentyNine> {
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
              padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
              child: CustomTextFormField(
                key: const ValueKey('text_field'),
                txtLabel: 'Textual input',
                keyboard: 'text',
                controller: _textController,
                focusNode: _textNode,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
              child: CustomTextFormField(
                key: const ValueKey('number_field'),
                txtLabel: 'Numerical input',
                keyboard: 'number',
                controller: _numberController,
                focusNode: _numberNode,
              ),
            ),
            Align(
              alignment: FractionalOffset.centerRight,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 30, 8),
                child: TextButton(
                  key: const ValueKey('clear_button'),
                  onPressed: () {
                    setState(() {
                      _textController.clear();
                      _numberController.clear();
                    });
                  },
                  child: const Text('Clear'),
                ),
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
    String introduction =
        'As Lacey (2018) asserts, input is the main thrust behind user interface '
        'design. Users are more likely to abandon form input process in cases '
        'where there is a requirement of manual switching between input modes '
        'during data entry. The disruptive pattern is more pronounced in use '
        'of mobile devices, where e.g. input mode can be assisted by on-screen '
        'features, such as keyboard or date/time pickers.';

    return introduction;
  }

  String _getDescription() {
    String description =
        'As an example to counter such patterns, the following form stub shows '
        'an example of two form fields, with one asking for textual and one for '
        'numerical information. The mobile on-screen keyboard should recognize '
        'input type and render appropriate input interface.';

    return description;
  }

  String _getSummary() {
    String description =
        'As can be seen, setting input mode automatically frees the user from '
        'having to recognize the type needed, and set the input mode manually. '
        'This allows users effortless input, with focus on information itself '
        'rather than its characteristics. An application with forms recognizing '
        'type of user input is described as sophisticated and effortless to use. '
        'Such application is predicted to offer joyous experience with users '
        'returning to its use.';

    // In string placed in triple ' remove extra whitespace and newlines
    // final extraWhiteSpace = RegExp(r'(?! )\s+| \s+');
    // description = description.replaceAll('\n', '');
    // description = description.replaceAll(extraWhiteSpace, ' ');

    return description;
  }
}
