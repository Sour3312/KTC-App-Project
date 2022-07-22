import 'package:flutter/material.dart';
import 'package:flutter_ktc_booking/src/config/routes/ktc_routes.dart';
import 'package:flutter_ktc_booking/src/utils/ktc_colors.dart';

class PasswordChangeDialog extends StatefulWidget {
  const PasswordChangeDialog({Key? key}) : super(key: key);

  @override
  State<PasswordChangeDialog> createState() => _PasswordChangeDialogState();
}

class _PasswordChangeDialogState extends State<PasswordChangeDialog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KTCColors.primaryTextColor,
      body: SafeArea(child: _buildBody()),
    );
  }

  Widget _buildBody() {
    return Container(
      margin: const EdgeInsets.fromLTRB(8, 91, 8, 91.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(16.0),
          color: KTCColors.backgroundColor),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Image(
            height: 64,
            width: 64,
            image: AssetImage('assets/images/ic_check_green.png'),
          ),
          const SizedBox(
            height: 22,
          ),
          const Text(
            "Your Password has been set Successfully",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: KTCColors.primaryTextColor,
              fontSize: 16
            ),
          ),
          const SizedBox(
            height: 9,
          ),
          const Text(
            "Please login using the set Password",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: KTCColors.primaryTextColor,
                fontSize: 16
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(55, 24, 55, 0),
            child: TextButton(
                onPressed: () {
                  setState(() {
                    Navigator.pushNamedAndRemoveUntil(context, KTCRoutes.personalSignIn, (r) => false);
                  });
                },
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
                  "Login Now",
                  style: TextStyle(fontSize: 16.0, color: Colors.white),
                )),
          ),
        ],
      ),
    );
  }
}
