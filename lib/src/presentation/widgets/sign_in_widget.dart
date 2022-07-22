import 'package:flutter/material.dart';
import 'package:flutter_ktc_booking/src/config/routes/ktc_routes.dart';
import 'package:flutter_ktc_booking/src/utils/ktc_colors.dart';

class SignInWidget extends StatefulWidget {
  const SignInWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SignInState();
  }
}

class _SignInState extends State {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final passwordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: KTCColors.backgroundColor,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text(
            "Sign In",
            style: TextStyle(fontSize: 20.0, color: Colors.white),
          ),
          automaticallyImplyLeading: false,
          backgroundColor: KTCColors.primaryColor,
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, KTCRoutes.createBookingScreen);
                },
                child: const Text(
                  "SKIP",
                  style: TextStyle(fontSize: 14.0, color: Colors.white),
                ))
          ],
        ),
        body: _buildSignIn());
  }

  Widget _buildSignIn() {
    return Column(
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
          child: TextField(
            controller: emailController,
            cursorColor: Colors.black54,
            textInputAction: TextInputAction.next,
            onSubmitted: (_) {
              FocusScope.of(context).requestFocus(passwordFocus);
            },
            autofocus: false,
            decoration: const InputDecoration(
                hintText: "Email ID or Mobile",
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
          child: TextField(
            controller: passwordController,
            cursorColor: Colors.black54,
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.done,
            focusNode: passwordFocus,
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            decoration: const InputDecoration(
                hintText: "Password",
                alignLabelWithHint: true,
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(12.0)),
            style: const TextStyle(fontSize: 14.0),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
          child: TextButton(
              onPressed: _login,
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
                "Sign In",
                style: TextStyle(fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.w600),
              )),
        ),
        const SizedBox(
          height: 8.0,
        ),
        Container(
            margin: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
            child: Row(
              children: [
                GestureDetector(
                  onTap: _forgotPassword,
                  child: const Text(
                    "Forgot Password?",
                    style: TextStyle(fontSize: 12.0, color: KTCColors.primaryColor, fontWeight: FontWeight.w600),
                  ),
                )
              ],
            )),
        const SizedBox(
          height: 8.0,
        ),
        Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
            child: Row(
              children: const [
                Expanded(
                    child: Center(
                  child: Divider(
                    color: KTCColors.secondaryTextColor1,
                  ),
                )),
                SizedBox(
                  width: 4.0,
                ),
                Text(
                  "OR",
                  style: TextStyle(fontSize: 12.0, color: KTCColors.primaryTextColor),
                ),
                SizedBox(
                  width: 4.0,
                ),
                Expanded(
                    child: Center(
                  child: Divider(
                    color: KTCColors.secondaryTextColor1,
                  ),
                )),
              ],
            )),
        const SizedBox(
          height: 8.0,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
          child: TextButton(
            onPressed: () {
              Navigator.pushNamed(context, KTCRoutes.signUpScreen);
            },
            style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsets>(
                  const EdgeInsets.all(12.0)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                  side: const BorderSide(color: KTCColors.darkBlueColor))),
            ),
              child: const Text(
                "Create New Account",
                style: TextStyle(fontSize: 16.0, color: KTCColors.primaryColor, fontWeight: FontWeight.w600),
              ),
            ),
          ),
      ],
    );
  }

  void _forgotPassword() {
  
    Navigator.pushNamed(context, KTCRoutes.forgotPasswordScreen);

  }

  void _login() {
    FocusManager.instance.primaryFocus?.unfocus();
    if (emailController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please Enter Email or Mobile")));
      return;
    }
    if (passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Please Enter Password")));
      return;
    }
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
}
