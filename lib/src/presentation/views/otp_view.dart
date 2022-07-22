
import 'package:flutter/material.dart';
import 'package:flutter_ktc_booking/src/presentation/views/otp_text_view.dart';

class OTPView extends StatefulWidget{
  OTPView({required this.numberOfFields, Key? key}) : super(key: key);

  final int numberOfFields;

  String otpText = '';

  @override
  State<StatefulWidget> createState()  => _OTPViewState();
}

class _OTPViewState extends State<OTPView> {

  final TextEditingController controllerOne = TextEditingController();
  final TextEditingController controllerTwo = TextEditingController();
  final TextEditingController controllerThree = TextEditingController();
  final TextEditingController controllerFour = TextEditingController();

  @override
  void initState() {
    super.initState();
    if(widget.otpText.isNotEmpty) {
      controllerOne.text = widget.otpText.characters.elementAt(0);
    }
    if(widget.otpText.length == 2) {

    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        OtpTextView(autofocus: widget.otpText.isEmpty, controller: controllerOne,),
        OtpTextView(autofocus: widget.otpText.length == 1, controller: controllerTwo,),
        OtpTextView(autofocus: widget.otpText.length == 2, controller: controllerThree,),
        OtpTextView(autofocus: widget.otpText.length >= 3, controller: controllerFour,),
      ],
    );
  }



}