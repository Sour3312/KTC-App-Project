import 'package:flutter/material.dart';

class OtpTextView extends StatelessWidget {
  final bool autofocus;
  final TextEditingController? controller;
  const OtpTextView({this.autofocus = false, this.controller, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery
          .of(context)
          .size
          .shortestSide * 0.13,

      child: AspectRatio(
        aspectRatio: 1,
        child: TextField(
          autofocus: autofocus,
          showCursor: false,
          controller: controller,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(counterText: ""),
          style: const TextStyle(),
          maxLines: 1,
          maxLength: 1,
          onChanged: (value) {
            if (value.length == 1) {
              FocusScope.of(context).nextFocus();
            } else {
              FocusScope.of(context).previousFocus();
            }
          },
        ),
      ),
    );
  }

}