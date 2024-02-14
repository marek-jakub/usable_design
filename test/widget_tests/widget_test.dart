import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:usable_design/main.dart';

Future<void> addDelay(int ms) async {
  await Future<void>.delayed(Duration(milliseconds: ms));
}

void main() {
  group(
    "Validate QuestionThirty screen",
    () {
      testWidgets('Qustion 30 screen', (WidgetTester tester) async {
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
            tester.widget<CheckboxListTile>(checkboxTileFinder).value;
        expect(isCheckboxChecked, false);
        // Tap on the checkbox
        await tester.tap(checkboxTileFinder);
        await tester.pumpAndSettle();
        // Check if the checkbox is now checked
        final isCheckboxCheckedAfterTap =
            tester.widget<CheckboxListTile>(checkboxTileFinder).value;
        expect(isCheckboxCheckedAfterTap, true);

        // Test state dropdown field
        tester.printToConsole('Testing state dropdown...');
        expect(find.byKey(const Key('country')), findsOneWidget);

        // Test state dropdown field
        tester.printToConsole('Testing state dropdown first item is Austria.');
        expect(find.byKey(const Key('country')), findsOneWidget);
        final stateDropdown = find.byKey(const Key('country'));
        await tester.ensureVisible(stateDropdown);
        await tester.tap(stateDropdown);
        await tester.pumpAndSettle();
        final dropdownItem = find.text('Austria');
        expect(dropdownItem, findsOneWidget);
        // Tap on the dropdown item
        await tester.tap(dropdownItem);
        await tester.pumpAndSettle();

        // Uncheck the checkbox list tile
        tester.printToConsole('Uncheck text box.');
        await tester.tap(checkboxTileFinder);
        await tester.pumpAndSettle();

        // Check if the checkbox is now checked
        expect(
            tester.widget<CheckboxListTile>(checkboxTileFinder).value, false);

        // Test state dropdown field
        tester.printToConsole('Testing state dropdown first item is Albania.');
        expect(find.byKey(const Key('country')), findsOneWidget);
        await tester.tap(stateDropdown);
        await tester.pumpAndSettle();
        expect(find.text('Albania'), findsOneWidget);

        // Return to home screen
        tester.printToConsole('Returning to home screen.');
        // First tap out of dropdown field to close it
        const location = Offset(100, 200);
        await tester.tapAt(location);
        await tester.pumpAndSettle();
        //await addDelay(2000);
        // Tap back button
        await tester.tap(find.byType(IconButton));
        await tester.pumpAndSettle();
        //await addDelay(2000);
      });
    },
  );

  group(
    "Validate QuestionTwentyNine screen",
    () {
      testWidgets('Question 29 screen', (WidgetTester tester) async {
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
        tester.printToConsole('Looking for question 29...');
        final question29Finder = find.byKey(const Key('question 29'));
        await tester.scrollUntilVisible(
          question29Finder,
          500,
          duration: const Duration(milliseconds: 1000),
        );
        final lastQuestion = question29Finder.evaluate().first;
        expect(lastQuestion.widget.key, const ValueKey('question 29'));

        await tester.tap(find.byKey(const ValueKey('question 29')));
        await tester.pumpAndSettle();

        // Verify the expected screen title.
        tester.printToConsole('Question 29 screen testing.');
        expect(find.text('Question 29'), findsOneWidget);
        expect(find.text('29'), findsOneWidget);
        expect(find.text('1'), findsNothing);

        // Test form fields
        tester.printToConsole('Testing form fields...');
        expect(find.byKey(const Key('text_field')), findsOneWidget);
        expect(find.byKey(const Key('number_field')), findsOneWidget);

        // Test button
        tester.printToConsole('Testing "Clear" button...');
        expect(find.byKey(const Key('clear_button')), findsOneWidget);

        // Test text input field
        tester.printToConsole('Testing textual input.');
        await tester.enterText(
            find.byKey(const ValueKey('text_field')), 'Test text');
        await tester.pumpAndSettle();

        // Verify text field contains text
        expect(find.text('Test text'), findsOneWidget);
        final textField =
            tester.widget<TextFormField>(find.byKey(const Key('text_field')));
        expect(textField.controller!.text, 'Test text');
        await tester.pumpAndSettle();

        // Test number input field
        tester.printToConsole('Testing numerical input.');
        await tester.enterText(
            find.byKey(const ValueKey('number_field')), '12345');
        await tester.pumpAndSettle();

        // Verify text field contains text
        tester.printToConsole('Looking for numerical input.');
        expect(find.text('12345'), findsOneWidget);
        final numberField =
            tester.widget<TextFormField>(find.byKey(const Key('number_field')));
        expect(numberField.controller!.text, '12345');
        await tester.pumpAndSettle();

        // Verify clearing of form fields
        // First tap out of the text field
        tester.printToConsole('Tapping clear button.');
        const location = Offset(100, 200);
        await tester.tapAt(location);
        await tester.pumpAndSettle();
        final clearButton = find.byKey(const Key('clear_button'));
        await tester.ensureVisible(clearButton);
        expect(clearButton, findsOneWidget);
        await tester.tap(clearButton);
        await tester.pumpAndSettle();

        // Verify form fields are empty
        tester.printToConsole('Verify form fields are empty.');
        expect(textField.controller!.text, '');
        expect(numberField.controller!.text, '');
      });
    },
  );
}
