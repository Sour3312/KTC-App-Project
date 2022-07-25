import 'package:flutter/material.dart';
import 'package:flutter_ktc_booking/src/calendar/calendar.dart';
import 'package:flutter_ktc_booking/src/presentation/views/corporate_drop_down_list.dart';
import 'package:flutter_ktc_booking/src/utils/ktc_colors.dart';

import '../../config/routes/ktc_routes.dart';
import '../views/corporate_booking_card.dart';

class CorporateBookingScreen extends StatefulWidget {
  //--------------- Corporate >>>>> Sign In >>>> Home ------------------

  const CorporateBookingScreen({Key? key}) : super(key: key);

  @override
  State<CorporateBookingScreen> createState() => _CreateBookingScreenState();
}

class _CreateBookingScreenState extends State<CorporateBookingScreen>
    with TickerProviderStateMixin {
  late String assignments = "Assignments";
  late String carGroups = "Car Groups";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Image.asset('assets/images/ktc_logo.png', fit: BoxFit.cover),
        ),
        backgroundColor: KTCColors.backgroundColor,
        body: _buildBody(),
        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
                color: KTCColors.primaryColor,
                child: Row(
                  children: [
                    Image.asset('assets/images/ktc_logo.png',
                        fit: BoxFit.cover),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              ListTile(
                title: const Text(
                  'Home',
                  style: TextStyle(
                      fontSize: 16, color: KTCColors.secondaryTextColor1),
                ),
                leading:
                    Image.asset('assets/images/home.png', fit: BoxFit.cover),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text(
                  'My Profile',
                  style: TextStyle(
                      fontSize: 16, color: KTCColors.secondaryTextColor1),
                ),
                leading: Image.asset('assets/images/account_circle.png',
                    fit: BoxFit.cover),
                onTap: () {
                  Navigator.pop(context);
                  setState(() {
                    Navigator.pushNamed(context, KTCRoutes.userProfile);
                  });
                },
              ),
              ListTile(
                title: const Text(
                  'My bookings',
                  style: TextStyle(
                      fontSize: 16, color: KTCColors.secondaryTextColor1),
                ),
                leading: Image.asset('assets/images/task_alt.png',
                    fit: BoxFit.cover),
                onTap: () {
                  Navigator.pop(context);
                  setState(() {
                    Navigator.pushNamed(context, KTCRoutes.myBooking);
                  });
                },
              ),
              ListTile(
                title: const Text(
                  'Approval',
                  style: TextStyle(
                      fontSize: 16, color: KTCColors.secondaryTextColor1),
                ),
                leading: Image.asset('assets/images/ic_check_circle.png',
                    fit: BoxFit.cover),
                onTap: () {
                  Navigator.pop(context);
                  setState(() {
                    Navigator.pushNamed(context, KTCRoutes.approvalsScreen);
                  });
                },
              ),
              ListTile(
                title: const Text(
                  'Notification',
                  style: TextStyle(
                      fontSize: 16, color: KTCColors.secondaryTextColor1),
                ),
                leading: Image.asset('assets/images/notifications.png',
                    fit: BoxFit.cover),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text(
                  'Logout',
                  style: TextStyle(
                      fontSize: 16, color: KTCColors.secondaryTextColor1),
                ),
                leading:
                    Image.asset('assets/images/logout.png', fit: BoxFit.cover),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return ListView(
      children: [
        //CorporateBookingCard created by me
        CorporateBookingCard(
          title: 'Other Information',
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(8, 12, 8, 12),
              margin: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(4)),
                  border: Border.all(color: const Color(0xFFE5E5E5))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/start_trip.png'),
                      const SizedBox(
                        width: 12,
                      ),
                      const Text(
                        "Start Date & Reporting Time",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14,
                            decoration: TextDecoration.underline,
                            color: KTCColors.primaryColor,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  CalendarView(
                    defaultDateTime: DateTime.now(),
                    minDateTime: DateTime.now(),
                    onDateTimeSelected: (date) {},
                    // selectedDateTime: DateTime(2022, 5, 12, 14, 30),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    "Slide to Select Date and Time",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF737373),
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ],
        ),
        CorporateBookingCard(
          title: 'Other Information',
          children: [
            const Text(
              "Car Reservation Details",
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
            CorporateDropDownList(title: "City", children: [
              Container(
                margin: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                    border: Border.all(color: const Color(0xFFE5E5E5))),
                child: GestureDetector(
                  onTap: () async {
                    final String? assis = await openAssignment();
                    if (assis != null) {
                      setState(() {
                        assignments = assis;
                      });
                    }
                    // else {
                    //   CircularProgressIndicator();
                    // }
                    print(assignments);
                  },
                  child: ListTile(
                      title: Text(
                        (assignments.isNotEmpty) ? assignments : "assignments",
                        style: const TextStyle(
                          color: Color(0xFF737373),
                          fontSize: 14,
                        ),
                      ),
                      trailing: Icon(Icons.navigate_next_outlined)),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  final String? assis = await openCarGroup();
                  if (assis != null) {
                    setState(() {
                      carGroups = assis;
                    });
                  }
                },
                //==============================
                child: Container(
                  margin: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(Radius.circular(4)),
                      border: Border.all(color: const Color(0xFFE5E5E5))),
                  child: ListTile(
                      title: Text(
                        (carGroups.isNotEmpty) ? carGroups : "Car Groups",
                        style: const TextStyle(
                          color: Color(0xFF737373),
                          fontSize: 14,
                        ),
                      ),
                      trailing: Icon(Icons.navigate_next_outlined)),
                ),
              )
            ]),
            CorporateDropDownList(
              title: "Pickup Address",
              children: [
                Container(
                    margin: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(4)),
                        border: Border.all(color: const Color(0xFFE5E5E5))),
                    child: const TextField(
                      controller: null,
                      cursorColor: Colors.black54,
                      textInputAction: TextInputAction.next,
                      autofocus: false,
                      decoration: InputDecoration(
                          hintText: "Reporting Landmark (Optional)",
                          alignLabelWithHint: true,
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            color: Color(0xFF737373),
                            fontSize: 14,
                          ),
                          contentPadding: EdgeInsets.all(12.0)),
                      style: TextStyle(fontSize: 14.0),
                    )),
              ],
            ),
          ],
        ),
        CorporateBookingCard(
          title: 'Other Information',
          children: [
            Container(
                margin: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                    border: Border.all(color: const Color(0xFFE5E5E5))),
                child: const TextField(
                  controller: null,
                  cursorColor: Colors.black54,
                  textInputAction: TextInputAction.next,
                  autofocus: false,
                  decoration: InputDecoration(
                      hintText: "Flight/Train info",
                      alignLabelWithHint: true,
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        color: Color(0xFF737373),
                        fontSize: 14,
                      ),
                      contentPadding: EdgeInsets.all(12.0)),
                  style: TextStyle(fontSize: 14.0),
                )),
            Container(
                margin: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                    border: Border.all(color: const Color(0xFFE5E5E5))),
                child: const TextField(
                  controller: null,
                  cursorColor: Colors.black54,
                  textInputAction: TextInputAction.next,
                  autofocus: false,
                  decoration: InputDecoration(
                      hintText: "Special Instruction (Optional)",
                      alignLabelWithHint: true,
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        color: Color(0xFF737373),
                        fontSize: 14,
                      ),
                      contentPadding: EdgeInsets.all(12.0)),
                  style: TextStyle(fontSize: 14.0),
                )),
            CorporateDropDownList(title: "Payment Mode", children: [
              Container(
                  margin: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(Radius.circular(4)),
                      border: Border.all(color: const Color(0xFFE5E5E5))),
                  child: const TextField(
                    controller: null,
                    cursorColor: Colors.black54,
                    textInputAction: TextInputAction.next,
                    autofocus: false,
                    decoration: InputDecoration(
                        hintText: "e-mail copy to (Optional)",
                        alignLabelWithHint: true,
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                          color: Color(0xFF737373),
                          fontSize: 14,
                        ),
                        contentPadding: EdgeInsets.all(12.0)),
                    style: TextStyle(fontSize: 14.0),
                  )),
            ]),
          ],
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
          child: TextButton(
              onPressed: _continue,
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
                "Continue",
                style: TextStyle(fontSize: 16.0, color: Colors.white),
              )),
        ),
      ],
    );
  }

  void _continue() {
    Navigator.pushNamed(context, KTCRoutes.reviewBookingDetails);
  }

  Future openAssignment() {
    return Navigator.pushNamed(
      context,
      KTCRoutes.assignmentScreen,
    );
  }

  Future openCarGroup() {
    return Navigator.pushNamed(
      context,
      KTCRoutes.corporateCarGroup,
    );
  }
}
