import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/ktc_colors.dart';

class CorporateSignUpWidget extends StatefulWidget {
  final String email;

  const CorporateSignUpWidget({required this.email, Key? key})
      : super(key: key);

  @override
  State<CorporateSignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<CorporateSignUpWidget> {
  // Default Radio Button Selected Item When App Starts.
  String radioButtonItem = 'Male';

  // Group Value for Radio Button.
  int genderId = 1;
  int employeeType = 1;
  int nationalityId = 1;
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
          padding: const EdgeInsets.fromLTRB(12, 15, 12, 14),
          decoration: const BoxDecoration(
            color: Color(0x9B9B9B82),
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
          child:   Text(
            widget.email,
            textAlign: TextAlign.start,
            style: const TextStyle(
                fontSize: 14,
                color: KTCColors.primaryTextColor,
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
          child: Row(
            children: [
              const Text(
                "Employee Type",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF737373),
                  fontWeight: FontWeight.w600
                ),
              ),
              Radio(
                value: 1,
                groupValue: employeeType,
                onChanged: (val) {
                  setState(() {
                    radioButtonItem = 'Admin';
                    employeeType = 1;
                  });
                },
              ),
              const Text(
                'Admin  ',
                style: TextStyle(
                    fontSize: 14.0, color: KTCColors.secondaryTextColor1),
              ),
              Radio(
                value: 2,
                groupValue: employeeType,
                onChanged: (val) {
                  setState(() {
                    radioButtonItem = 'Employee';
                    employeeType = 2;
                  });
                },
              ),
              const Text(
                'Employee',
                style: TextStyle(
                    fontSize: 14.0, color: KTCColors.secondaryTextColor1),
              ),

            ],
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
              hintStyle: TextStyle(
                  color: KTCColors.secondaryTextColor1
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
              hintStyle: TextStyle(
                  color: KTCColors.secondaryTextColor1
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
            onChanged: (value) {},
            decoration: const InputDecoration(
              hintText: 'Email',
              icon: ImageIcon(
                AssetImage("assets/images/email.png"),
              ),
              hintStyle: TextStyle(
                  color: KTCColors.secondaryTextColor1
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
                  hintStyle: TextStyle(
                      color: KTCColors.secondaryTextColor1
                  ),
                  border: InputBorder.none,
                ),
              ),
            )),
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
                        color: KTCColors.secondaryTextColor1, fontSize: 14),
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
                  style: const TextStyle(
                      color: KTCColors.primaryColor, fontSize: 14),
                  onChanged: (value) {
                    // Call setState to update the UI
                    setState(() {});
                  },
                  decoration: const InputDecoration(
                    hintText: 'Mobile Number',
                    hintStyle: TextStyle(
                      color: KTCColors.secondaryTextColor1
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ],
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
                        color: KTCColors.secondaryTextColor1, fontSize: 14),
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
                  style: const TextStyle(
                      color: KTCColors.primaryColor, fontSize: 14),
                  onChanged: (value) {
                    // Call setState to update the UI
                    setState(() {});
                  },
                  decoration: const InputDecoration(
                    hintText: 'Alternate Mobile Number',
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                        color: KTCColors.secondaryTextColor1
                    ),
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
          child: Row(
            children: [
              const ImageIcon(
                AssetImage("assets/images/wc.png"),
              ),
              Radio(
                value: 1,
                groupValue: genderId,
                onChanged: (val) {
                  setState(() {
                    radioButtonItem = 'ONE';
                    genderId = 1;
                  });
                },
              ),
              const Text(
                'Male',
                style: TextStyle(
                    fontSize: 14.0, color: KTCColors.secondaryTextColor1),
              ),
              Radio(
                value: 2,
                groupValue: genderId,
                onChanged: (val) {
                  setState(() {
                    radioButtonItem = 'Female';
                    genderId = 2;
                  });
                },
              ),
              const Text(
                'Female',
                style: TextStyle(
                    fontSize: 14.0, color: KTCColors.secondaryTextColor1),
              ),
              Radio(
                value: 3,
                groupValue: genderId,
                onChanged: (val) {
                  setState(() {
                    radioButtonItem = 'Other';
                    genderId = 3;
                  });
                },
              ),
              const Text(
                'Other',
                style: TextStyle(
                    fontSize: 14.0, color: KTCColors.secondaryTextColor1),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(16, 0, 16, 37),
          padding: const EdgeInsets.only(left: 12),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
          child: Row(
            children: [
              const ImageIcon(
                AssetImage("assets/images/flag.png"),
              ),
              Radio(
                value: 1,
                groupValue: nationalityId,
                onChanged: (val) {
                  setState(() {
                    radioButtonItem = 'India';
                    nationalityId = 1;
                  });
                },
              ),
              const Text(
                'India',
                style: TextStyle(
                    fontSize: 14.0, color: KTCColors.secondaryTextColor1),
              ),
              Radio(
                value: 2,
                groupValue: nationalityId,
                onChanged: (val) {
                  setState(() {
                    radioButtonItem = 'Other';
                    nationalityId = 2;
                  });
                },
              ),
              const Text(
                'other',
                style: TextStyle(
                    fontSize: 14.0, color: KTCColors.secondaryTextColor1),
              ),

            ],
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
    showDatePicker(
        context: context,
        initialDate: DateTime(1950),
        firstDate: DateTime(1950),
        lastDate: DateTime.now());
  }
}
