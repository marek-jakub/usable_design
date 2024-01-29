import 'package:flutter/material.dart';

import '../../data/europe.dart';

import 'state_dropdown_field.dart';

class QuestionThirty extends StatefulWidget {
  const QuestionThirty({Key? key}) : super(key: key);

  @override
  State<QuestionThirty> createState() => _QuestionThirtyState();
}

class _QuestionThirtyState extends State<QuestionThirty> {
  // EU member checkbox value
  bool _euMember = false;

  // List containing values for Country dropdown field.
  List<String> _countries = Europe().euMembership.keys.toList();

  // Text controllers for form fields
  final TextEditingController _state = TextEditingController();

  @override
  void dispose() {
    _state.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Question 30'),
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
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 5, 14, 10),
              child: Text(
                _getIntro(),
                textAlign: TextAlign.justify,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 7, 10, 7),
              child: CheckboxListTile(
                  key: const ValueKey('EU_member'),
                  title: const Text(
                      'Is the country of origin a member of European Union?'),
                  value: _euMember,
                  onChanged: (bool? value) {
                    setState(() {
                      _euMember = value!;
                      _state.text = '';
                      _updateCountries(value);
                    });
                  }),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 5, 14, 10),
              child: Text(
                _getDescription(),
                textAlign: TextAlign.justify,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 7, 10, 7),
              child: StateDropdownField(
                key: const ValueKey('country'),
                controller: _state,
                txtLabel: 'Country',
                listValues: _countries,
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

  String _getQuestion30() {
    String question =
        'Users dislike typing, is information computed for the users where '
        'applicable?';

    return question;
  }

  String _getIntro() {
    String introduction =
        'According to Lacey (2018), users are less likely to fill in forms where '
        'their effort is needed to search for information before inputting it. '
        'This applies even more strongly to information, which is publicly '
        'available. As an example, to following form stub asks European users '
        'to confirm their origin is within the European Union (EU).';

    return introduction;
  }

  String _getDescription() {
    String description =
        'Based on this information, follow up queries should compute available '
        'information based on information provided by users, giving either all '
        'European countries or only countries of the EU.';

    return description;
  }

  String _getSummary() {
    String description =
        'As can be seen, computing information based on user input makes it easier '
        'to fill in form, speeds up information input and lowers the probability '
        'of user entering erroneous data. One drawback, however, is that the '
        'computing logic has to be based on latest and valid information. Keeping '
        'software up to date is of paramount importance, and this responsibility '
        "is on developers' shoulders, not users'!";

    // In string placed in triple ' remove extra whitespace and newlines
    // final extraWhiteSpace = RegExp(r'(?! )\s+| \s+');
    // description = description.replaceAll('\n', '');
    // description = description.replaceAll(extraWhiteSpace, ' ');

    return description;
  }

  void _updateCountries(bool selected) {
    Map<String, bool> euCountries;
    Map<String, bool> europeanCountries = Europe().europeCountries;

    if (selected) {
      euCountries = Map.from(europeanCountries)
        ..removeWhere((key, isMember) => !isMember);
      _countries = euCountries.keys.toList();
    } else {
      _countries = europeanCountries.keys.toList();
    }
  }
}
