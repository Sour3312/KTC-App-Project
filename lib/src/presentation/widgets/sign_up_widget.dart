import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/ktc_colors.dart';

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({Key? key}) : super(key: key);

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  // Default Radio Button Selected Item When App Starts.
  String radioButtonItem = 'Male';

  // Group Value for Radio Button.
  int id = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up Detail'),
        leading: null,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: KTCColors.backgroundColor,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return ListView(
      children: [
        Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.only(left: 12),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
          child: TextField(
            autofocus: false,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.name,
            style: const TextStyle(color: Colors.black, fontSize: 14),
            onSubmitted: (_) {
              FocusScope.of(context).nextFocus();
            },
            onChanged: (value) {
              // Call setState to update the UI
              setState(() {});
            },
            decoration: const InputDecoration(
              hintText: 'First Name',
              icon: ImageIcon(
                AssetImage("assets/images/account_circle.png"),
              ),
              border: InputBorder.none,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          padding: const EdgeInsets.only(left: 12),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
          child: TextField(
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
            style: const TextStyle(color: Colors.black, fontSize: 14),
            onSubmitted: (_) {
              FocusScope.of(context).nextFocus();
            },
            onChanged: (value) {
              // Call setState to update the UI
              setState(() {});
            },
            decoration: const InputDecoration(
              hintText: 'Last Name',
              icon: ImageIcon(
                AssetImage("assets/images/account_circle.png"),
              ),
              border: InputBorder.none,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          padding: const EdgeInsets.only(left: 12),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
          child: TextField(
            textInputAction: TextInputAction.next,
            style: const TextStyle(color: Colors.black, fontSize: 14),
            keyboardType: TextInputType.emailAddress,
            onChanged: (value) {

            },
            decoration: const InputDecoration(
              hintText: 'Email',
              icon: ImageIcon(
                AssetImage("assets/images/email.png"),
              ),
              border: InputBorder.none,
            ),
          ),
        ),
        Container(
            margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            padding: const EdgeInsets.only(left: 12),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
            child: GestureDetector(
              onTap: _openDatePicker,
              child: TextField(
                keyboardType: TextInputType.datetime,
                style: const TextStyle(color: Colors.black, fontSize: 14),
                enabled: false,
                onChanged: (value) {
                  // Call setState to update the UI
                  setState(() {});
                },
                decoration: const InputDecoration(
                  hintText: 'DOB',
                  icon: ImageIcon(
                    AssetImage("assets/images/cake.png"),
                  ),
                  border: InputBorder.none,
                ),
              ),
            )),
        Container(
          margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          padding: const EdgeInsets.only(left: 12),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
          child: Row(
            children: [
              const ImageIcon(
                AssetImage("assets/images/wc.png"),
              ),
              Radio(
                value: 1,
                groupValue: id,
                onChanged: (val) {
                  setState(() {
                    radioButtonItem = 'ONE';
                    id = 1;
                  });
                },
              ),
              const Text(
                'Male',
                style: TextStyle(
                    fontSize: 14.0, color: KTCColors.primaryTextColor),
              ),
              Radio(
                value: 2,
                groupValue: id,
                onChanged: (val) {
                  setState(() {
                    radioButtonItem = 'Female';
                    id = 2;
                  });
                },
              ),
              const Text(
                'Female',
                style: TextStyle(
                    fontSize: 14.0, color: KTCColors.primaryTextColor),
              ),
              Radio(
                value: 3,
                groupValue: id,
                onChanged: (val) {
                  setState(() {
                    radioButtonItem = 'Other';
                    id = 3;
                  });
                },
              ),
              const Text(
                'Other',
                style: TextStyle(
                    fontSize: 14.0, color: KTCColors.primaryTextColor),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(16, 0, 4, 16),
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(4)),
              ),
              child: Row(
                children: [
                  Image.asset('assets/images/smartphone.png',
                      fit: BoxFit.cover),
                  const SizedBox(
                    width: 8,
                  ),
                  const Text(
                    "+91 ",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: KTCColors.primaryTextColor, fontSize: 14),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 16, 16),
                padding: const EdgeInsets.only(left: 12),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                ),
                child: TextField(
                  //  cursorColor: KTCColors.primaryColor,
                  style: const TextStyle(color:  KTCColors.primaryColor, fontSize: 14),
                  onChanged: (value) {
                    // Call setState to update the UI
                    setState(() {});
                  },
                  decoration: const InputDecoration(
                    hintText: 'Mobile Number',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          padding: const EdgeInsets.only(left: 12),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
          child: TextField(
            //  cursorColor: KTCColors.primaryColor,
            style: const TextStyle(color:  KTCColors.primaryColor, fontSize: 14),
            onChanged: (value) {
              // Call setState to update the UI
              setState(() {});
            },
            decoration: const InputDecoration(
              hintText: 'Password',
              icon: ImageIcon(
                AssetImage("assets/images/lock.png"),
              ),
              border: InputBorder.none,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          padding: const EdgeInsets.only(left: 12),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
          child: TextField(
            //  cursorColor: KTCColors.primaryColor,
            style: const TextStyle(color:  KTCColors.primaryColor, fontSize: 14),
            onChanged: (value) {
              // Call setState to update the UI
              setState(() {});
            },
            decoration: const InputDecoration(
              hintText: 'Confirm Password',
              icon: ImageIcon(
                AssetImage("assets/images/lock.png"),
              ),
              border: InputBorder.none,
            ),
          ),
        ),
        GestureDetector(
          child: Container(
            color: KTCColors.primaryColor,
            padding: const EdgeInsets.all(13),
            child: const Center(
                child: Text(
              "Sign Up",
              style: TextStyle(color: Colors.white, fontSize: 16),
            )),
          ),
        )
      ],
    );
  }

  void _openDatePicker() {
    showDatePicker(context: context, initialDate: DateTime(1950), firstDate: DateTime(1950), lastDate: DateTime.now());
  }
}
