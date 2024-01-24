import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:usable_design/main.dart';
import 'package:usable_design/screens/question_30/state_dropdown_field.dart';

Future<void> addDelay(int ms) async {
  await Future<void>.delayed(Duration(milliseconds: ms));
}

void main() {
  testWidgets('Entering app with welcome screen showing usability questions',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const UsabilityDesign());
    tester.printToConsole('Starting app...');
    //await addDelay(4000);
    await tester.pumpAndSettle();

    // Verify that the title is shown.
    tester.printToConsole('Welcome screen testing...');
    expect(find.text('Usability Questions'), findsOneWidget);
    expect(find.text('1'), findsNothing);
    await tester.pumpAndSettle();

    // Verify existing questions
    tester.printToConsole('Test visible questions.');
    final instances = find.byType(Text);
    expect(instances, findsAtLeast(10));

    // Scroll down the list of questions
    tester.printToConsole('Scrolling down...');
    final lastQuestionFinder = find.byKey(const Key('question 30'));
    await tester.scrollUntilVisible(
      lastQuestionFinder,
      500,
      duration: const Duration(milliseconds: 1000),
    );
    final lastQuestion = lastQuestionFinder.evaluate().first;
    expect(lastQuestion.widget.key, const ValueKey('question 30'));

    await tester.tap(find.byKey(const ValueKey('question 30')));
    await tester.pumpAndSettle();

    // Verify the expected screen title.
    tester.printToConsole('Question 30 screen testing.');
    expect(find.text('Question 30'), findsOneWidget);
    expect(find.text('30'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Test checkbox list tile
    tester.printToConsole('Testing checkbox...');
    expect(find.byKey(const Key('EU_member')), findsOneWidget);

    // Find the checkbox list tile
    final checkboxTileFinder = find.byKey(const Key('EU_member'));

    // Check if the checkbox is checked
    final isCheckboxChecked =
        await tester.widget<CheckboxListTile>(checkboxTileFinder).value;

    expect(isCheckboxChecked, false);

    // Tap on the checkbox
    await tester.tap(checkboxTileFinder);
    await tester.pumpAndSettle();

    // Check if the checkbox is now checked
    final isCheckboxCheckedAfterTap =
        await tester.widget<CheckboxListTile>(checkboxTileFinder).value;

    expect(isCheckboxCheckedAfterTap, true);

    // Test state dropdown field
    tester.printToConsole('Testing state dropdown...');
    expect(find.byKey(const Key('country')), findsOneWidget);
  });
}
