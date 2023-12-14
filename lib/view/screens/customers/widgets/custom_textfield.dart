import 'package:flutter/material.dart';
import 'package:technaureus_machine_test/core/core.dart';

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final bool isNum;
  final bool isLast;
  final TextEditingController textController;
  const CustomTextFormField({
    super.key,
    required this.labelText,
    this.isNum = false,
    this.isLast = false,
    required this.textController,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: kBodyLarge!.copyWith(
            color: Colors.black38,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: size.height * 0.042,
          child: TextFormField(
            // onFieldSubmitted: (value) {
            //   textController.text =value;
            // },
            textInputAction:
                isLast ? TextInputAction.done : TextInputAction.next,
            controller: textController,
            cursorColor: Colors.black87,
            style: kBodyMedium!.copyWith(
              fontWeight: FontWeight.bold,
            ),
            keyboardType: isNum ? TextInputType.number : TextInputType.text,
            onTapOutside: (event) {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  vertical: 2.0,
                  horizontal: 6.0,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black38,
                  ),
                )),
          ),
        ),
      ],
    );
  }
}
