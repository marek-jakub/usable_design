import 'package:flutter/material.dart';

/// A text form field.
///
/// Requires text controller [controller], a label [txtLabel],
/// a focus node [focusNode], a string signifying what keyboard
/// type to show [keyboard].
class CustomTextFormField extends TextFormField {
  CustomTextFormField({
    super.key,
    required TextEditingController controller,
    required FocusNode focusNode,
    required String txtLabel,
    required String keyboard,
  }) : super(
          controller: controller,
          focusNode: focusNode,
          keyboardType:
              keyboard == 'text' ? TextInputType.text : TextInputType.number,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            label: Text(txtLabel),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Field cannot be empty';
            }
            return null;
          },
        );
}
