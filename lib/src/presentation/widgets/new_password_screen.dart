import 'package:flutter/material.dart';

import '../../config/routes/ktc_routes.dart';
import '../../utils/ktc_colors.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({Key? key}) : super(key: key);

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KTCColors.backgroundColor,
      appBar: AppBar(
        title: const Text(
          "Reset Password",
          style: TextStyle(color: Colors.white),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: KTCColors.primaryColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(4.0),
                border:
                    Border.all(color: const Color.fromARGB(255, 229, 229, 229)),
                color: Colors.white),
            child: TextFormField(
              controller: _passwordController,
              cursorColor: Colors.black54,
              autofocus: true,
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              decoration: const InputDecoration(
                  hintText: "New Password",
                  alignLabelWithHint: true,
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(12.0)),
              style: const TextStyle(fontSize: 14.0),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(4.0),
                border:
                    Border.all(color: const Color.fromARGB(255, 229, 229, 229)),
                color: Colors.white),
            child: TextFormField(
              controller: _confirmPasswordController,
              cursorColor: Colors.black54,
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              decoration: const InputDecoration(
                  hintText: "Confirm Password",
                  alignLabelWithHint: true,
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(12.0)),
              style: const TextStyle(fontSize: 14.0),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
            child: TextButton(
                onPressed: _submit,
                style: ButtonStyle(
                    padding:
                        MaterialStateProperty.all(const EdgeInsets.all(12.0)),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        KTCColors.primaryColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0),
                            side: const BorderSide()))),
                child: const Text(
                  "Submit",
                  style: TextStyle(fontSize: 16.0, color: Colors.white),
                )),
          ),
          const SizedBox(
            height: 8.0,
          ),
        ],
      ),
    );
  }

  void _login() {

  }
  void _submit() {
    Navigator.pushNamed(context, KTCRoutes.passwordChangeDialog);
  }
}
