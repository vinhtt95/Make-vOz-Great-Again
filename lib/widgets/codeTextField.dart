import 'package:flutter/material.dart';

Widget codeTextField(
    {required TextEditingController controller,
    required FocusNode focusNode,
    required Function onTap}) {
  String hintText = "Mã thẻ";

  return Row(
    children: [
      Expanded(
        child: TextFormField(
          minLines: 1,
          maxLines: 5,
          controller: controller,
          focusNode: focusNode,
          decoration: InputDecoration(
            labelText: hintText,
            hintText: hintText,
            fillColor: Colors.white,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: Colors.red,
                width: 2.0,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: Colors.white,
                width: 2.0,
              ),
            ),
          ),
          keyboardType: TextInputType.number,
          onFieldSubmitted: (_) {
            onTap();
          },
          //     (_) {
          //   if (code.text.isNotEmpty) {
          //     sendText(code.text);
          //   }
          // },
        ),
      ),
    ],
  );
}
