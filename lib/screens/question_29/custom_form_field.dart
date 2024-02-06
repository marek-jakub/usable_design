import 'package:flutter/material.dart';

/// A text form field.
///
/// Requires text controller [_controller], a label [_label],
/// a string signifying what keyboard to show [_keyboard].
class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required TextEditingController controller,
    required FocusNode focusNode,
    required String txtLabel,
    required String keyboard,
  })  : _controller = controller,
        _focusNode = focusNode,
        _label = txtLabel,
        _keyboard = keyboard;

  final TextEditingController _controller;
  final FocusNode _focusNode;
  final String _label;
  final String _keyboard;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: TextFormField(
        controller: widget._controller,
        focusNode: widget._focusNode,
        keyboardType: widget._keyboard == 'text'
            ? TextInputType.text
            : TextInputType.number,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          label: Text(widget._label),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Field cannot be empty';
          }
          return null;
        },
      ),
    );
  }
}
