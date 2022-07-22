import 'package:flutter/material.dart';

import '../../utils/ktc_colors.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  bool editable = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        leading: null,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              setState(() {
                editable = true;
              });
            },
          ),
        ],
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
            enabled: editable,
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
              hintText: 'test',
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
            enabled: editable,
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
              hintText: 'test',
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
            enabled: editable,
            textInputAction: TextInputAction.next,
            style: const TextStyle(color: Colors.black, fontSize: 14),
            keyboardType: TextInputType.emailAddress,
            onChanged: (value) {},
            decoration: const InputDecoration(
              hintText: 'user@gmail.com',
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
              onTap: editable ? _openDatePicker : null,
              child: TextField(
                enabled: editable,
                keyboardType: TextInputType.datetime,
                style: const TextStyle(color: Colors.black, fontSize: 14),
                onChanged: (value) {
                  // Call setState to update the UI
                  setState(() {});
                },
                decoration: const InputDecoration(
                  hintText: '16-01-1988',
                  icon: ImageIcon(
                    AssetImage("assets/images/cake.png"),
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
                  enabled: editable,
                  //  cursorColor: KTCColors.primaryColor,
                  style: const TextStyle(
                      color: KTCColors.primaryColor, fontSize: 14),
                  onChanged: (value) {
                    // Call setState to update the UI
                    setState(() {});
                  },
                  decoration: const InputDecoration(
                    hintText: '971966478522',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ],
        ),
        editable
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    editable = false;
                  });
                },
                child: Container(
                  color: KTCColors.primaryColor,
                  padding: const EdgeInsets.all(13),
                  child: const Center(
                      child: Text(
                    "Save",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  )),
                ),
              )
            : Container()
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
