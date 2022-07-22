import 'package:flutter/material.dart';

import '../../config/routes/ktc_routes.dart';
import '../../utils/ktc_colors.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KTCColors.backgroundColor,
      appBar: AppBar(
        title: const Text(
          "Forgot Password",
          style: TextStyle(color: Colors.white),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: KTCColors.primaryColor,
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, KTCRoutes.createBookingScreen);
              },
              child: const Text(
                "SKIP",
                style: TextStyle(fontSize: 14.0, color: Colors.white),
              ))
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 96.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(4.0),
              border:
                  Border.all(color: const Color.fromARGB(255, 229, 229, 229)),
              color: Colors.white),
          child: TextFormField(
            controller: emailController,
            cursorColor: Colors.black54,
            autofocus: true,
            decoration: const InputDecoration(
                hintText: "Enter your registered email ID",
                alignLabelWithHint: true,
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(12.0)),
            style: const TextStyle(fontSize: 14.0),
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
          child: TextButton(
              onPressed: _next,
              style: ButtonStyle(
                  padding:
                      MaterialStateProperty.all(const EdgeInsets.all(12.0)),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(KTCColors.primaryColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          side: const BorderSide()))),
              child: const Text(
                "Next",
                style: TextStyle(fontSize: 16.0, color: Colors.white),
              )),
        ),
      ],
    );
  }

  void _next() {
    if (emailController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please Enter Email or Mobile")));
      return;
    }

    Navigator.pushNamed(context, KTCRoutes.forgetPassOTP,
        arguments: emailController.text);
  }
}
