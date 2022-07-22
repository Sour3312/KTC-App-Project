import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_ktc_booking/src/presentation/views/otp_text_view.dart';
import 'package:flutter_ktc_booking/src/presentation/views/otp_view.dart';

import '../../config/routes/ktc_routes.dart';
import '../../utils/ktc_colors.dart';

class ForgetPassOTP extends StatefulWidget {
  final String email;

  const ForgetPassOTP({
    Key? key,
    required this.email,
  }) : super(key: key);

  @override
  State<ForgetPassOTP> createState() => _ForgetPassOTPState();
}

class _ForgetPassOTPState extends State<ForgetPassOTP>
    with SingleTickerProviderStateMixin {
  final int time = 30;
  late AnimationController _controller;

  late Timer timer;
  late int totalTimeInSeconds;
  late bool _hideResendButton;

  final TextEditingController controllerOne = TextEditingController();
  final TextEditingController controllerTwo = TextEditingController();
  final TextEditingController controllerThree = TextEditingController();
  final TextEditingController controllerFour = TextEditingController();

  @override
  void initState() {
    totalTimeInSeconds = time;
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: time))
          ..addStatusListener((status) {
            if (status == AnimationStatus.dismissed) {
              setState(() {
                _hideResendButton = !_hideResendButton;
              });
            }
          });
    _controller.reverse(
        from: _controller.value == 0.0 ? 1.0 : _controller.value);
    _startCountdown();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppbar,
      backgroundColor: KTCColors.backgroundColor,
      body: _buildBody,
    );
  }

  get _getAppbar {
    return AppBar(
      title: const Text(
        "Forgot Password",
        style: TextStyle(color: Colors.white),
      ),
      automaticallyImplyLeading: false,
      backgroundColor: KTCColors.primaryColor,
    );
  }

  // Returns "OTP" input part
  get _buildBody {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.fromLTRB(24, 24, 24, 32),
          child: Text(
              "Please enter the OTP received on your registered email address.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: KTCColors.primaryTextColor,
                fontSize: 14,
              )),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          OtpTextView(
            autofocus: true,
            controller: controllerOne,
          ),
          OtpTextView(
            controller: controllerTwo,
          ),
          OtpTextView(
            controller: controllerThree,
          ),
          OtpTextView(
            controller: controllerFour,
          ),
        ]),
        Container(
          margin: const EdgeInsets.fromLTRB(16.0, 37, 16.0, 8.0),
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
        const Padding(
          padding: EdgeInsets.only(top: 32),
          child: Text("Didn't receive the OTP?",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: KTCColors.primaryTextColor,
                fontSize: 14,
              )),
        ),
        const SizedBox(
          height: 7,
        ),
        _hideResendButton
            ? OtpTimer(_controller)
            : TextButton(
                onPressed: () {},
                child: const Text(
                  "Resend code",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 14,
                      color: KTCColors.primaryTextColor,
                      fontWeight: FontWeight.w600),
                ),
              ),
      ],
    );
  }

  void _startCountdown() {
    setState(() {
      _hideResendButton = true;
      totalTimeInSeconds = time;
    });
    _controller.reverse(
        from: _controller.value == 0.0 ? 1.0 : _controller.value);
  }

  void _next() {
    if (controllerOne.text.trim().isEmpty ||
        controllerTwo.text.trim().isEmpty ||
        controllerThree.text.trim().isEmpty ||
        controllerFour.text.trim().isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Please Enter OTP")));
      return;
    }
    Navigator.pushNamed(context, KTCRoutes.newPassword);
  }
}

class OtpTimer extends StatelessWidget {
  final AnimationController controller;

  const OtpTimer(this.controller, {Key? key}) : super(key: key);

  String get timerString {
    Duration duration = controller.duration! * controller.value;
    if (duration.inHours > 0) {
      return '${duration.inHours}:${duration.inMinutes % 60}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
    }
    return '${duration.inMinutes % 60}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  Duration? get duration {
    Duration? duration = controller.duration;
    return duration;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget? child) {
        return Text(
          "Resend code in $timerString",
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontSize: 14,
              color: KTCColors.secondaryTextColor,
              fontWeight: FontWeight.w600),
        );
      },
    );
  }
}
