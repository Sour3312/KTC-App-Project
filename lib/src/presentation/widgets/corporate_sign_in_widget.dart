import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ktc_booking/src/config/routes/ktc_routes.dart';
import 'package:flutter_ktc_booking/src/utils/ktc_colors.dart';

class CorporateSignInWidget extends StatefulWidget {
  const CorporateSignInWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SignInState();
  }
}

class _SignInState extends State {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController regEmailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final passwordFocus = FocusNode();

  bool _isObscure = false;

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
        ),
        body: _buildSignIn());
  }

  Widget _buildSignIn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
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
            obscureText: !_isObscure,
            enableSuggestions: false,
            autocorrect: false,
            decoration: InputDecoration(
                hintText: "Password",
                suffixIcon: IconButton(
                  icon: Icon(
                    _isObscure
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: KTCColors.secondaryTextColor1,
                  ),
                  onPressed: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                ),
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
                style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              )),
        ),
        const SizedBox(
          height: 24.0,
        ),
        const Text(
          "Registered user can Sign in with existing credentials",
          style:
              TextStyle(fontSize: 12.0, color: KTCColors.secondaryTextColor1),
        ),
        const SizedBox(
          height: 16.0,
        ),
        GestureDetector(
          onTap: () async {
            final String? email = await openDialog();
            _forgotPassword(email);
          },
          child: const Text(
            "Forgot Password?",
            style: TextStyle(
                fontSize: 12.0,
                color: KTCColors.primaryColor,
                fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        RichText(
          text: TextSpan(
            style: const TextStyle(
              fontSize: 14,
              color: KTCColors.secondaryTextColor1,
            ),
            children: <TextSpan>[
              TextSpan(text: "Don't have account? "),
              TextSpan(
                  text: 'Register',
                  style: const TextStyle(
                      fontSize: 12,
                      color: KTCColors.primaryColor,
                      decoration: TextDecoration.underline),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () async {
                      final String? email = await openDialog();
                      _next(email);
                    }),
            ],
          ),
        )
      ],
    );
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

    Navigator.pushNamed(
      context,
      KTCRoutes.corporateBookingScreen,
    );
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  Future openDialog() => showDialog(
      context: context,
      builder: (context) => Dialog(
            child: Container(
              height: 185,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(4)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: KTCColors.primaryColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4),
                        topRight: Radius.circular(4),
                      ),
                    ),
                    child: Row(
                      children: [
                        const Spacer(),
                        const Text(
                          "Register",
                          style: TextStyle(fontSize: 14.0, color: Colors.white),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            submit();
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 6, 12, 6),
                            child: Image.asset('assets/images/ic_close.png'),
                          ),
                        )
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(12, 14, 0, 12),
                    child: Text(
                      "Enter your official Email ID",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 14.0,
                        color: KTCColors.secondaryTextColor,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(12.0, 0.0, 12.0, 20.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(4.0),
                        border: Border.all(color: const Color(0xFFE5E5E5)),
                        color: Colors.white),
                    child: TextField(
                      controller: regEmailController,
                      cursorColor: Colors.black54,
                      textInputAction: TextInputAction.done,
                      onSubmitted: (_) {
                        submit();
                      },
                      autofocus: true,
                      decoration: const InputDecoration(
                          hintText: "Official Email ID",
                          alignLabelWithHint: true,
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(12.0)),
                      style: const TextStyle(fontSize: 14.0),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      submit();
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        color: KTCColors.primaryColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(4),
                          bottomRight: Radius.circular(4),
                        ),
                      ),
                      padding: const EdgeInsets.fromLTRB(0, 9, 0, 8),
                      child: const Text(
                        "Submit",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14.0, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ));

  void submit() {
    Navigator.of(context).pop(regEmailController.text);
  }

  void _next(String? email) {
    if (email == null || email.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Please Enter Email")));
      return;
    }
    if (email.contains('@')) {
      Navigator.pushNamed(context, KTCRoutes.corporateSignUpWidget,
          arguments: regEmailController.text);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please Enter valid Email")));
      return;
    }
  }

  void _forgotPassword(String? email) {
    if (email == null || email.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Please Enter Email")));
      return;
    }
    if (email.contains('@')) {
      //todo send mail
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please Enter valid Email")));
      return;
    }
  }
}
