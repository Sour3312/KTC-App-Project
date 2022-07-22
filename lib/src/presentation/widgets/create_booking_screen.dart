// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_ktc_booking/src/calendar/calendar.dart';
import 'package:flutter_ktc_booking/src/utils/ktc_colors.dart';

import '../../config/routes/ktc_routes.dart';

class CreateBookingScreen extends StatefulWidget {
  const CreateBookingScreen({Key? key}) : super(key: key);

  @override
  State<CreateBookingScreen> createState() => _CreateBookingScreenState();
}

class _CreateBookingScreenState extends State<CreateBookingScreen> {
  // Initial Selected Value
  String dropdownvalue = 'Rental Type';

  bool tripStart = true;

  // List of items in our dropdown menu
  var items = [
    'Rental Type',
    'Local Run - Full day',
    'Local Run - Half day',
    'Transfers (Airport)',
    'Outstation',
  ];

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
      // crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(16, 16, 16, 17),
          padding: const EdgeInsets.fromLTRB(15, 15, 8, 15),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
          child: Row(
            children: [
              Image.asset('assets/images/ic_place.png'),
              const SizedBox(
                width: 8,
              ),
              const Text(
                "Delhi NCR",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: KTCColors.secondaryTextColor, fontSize: 14),
              ),
              const Spacer(),
              Image.asset('assets/images/navigate_next.png')
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          padding: const EdgeInsets.fromLTRB(15, 15, 8, 15),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
          child: const Text(
            "MapmyIndia Head Office New Delhi, 237, Okh. efdh ai vu sbdviushbdvisbdivubsivbaiupsbvisuadbviusbvuisebvusbubvsuibv ipzdcbkjdvsidvisdbvibibsduiv",
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(
              color: KTCColors.secondaryTextColor,
              fontSize: 14,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          padding: const EdgeInsets.fromLTRB(15, 0, 8, 0),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
          child: DropdownButton(
            // Initial Value
            value: dropdownvalue,
            isExpanded: true,
            underline: SizedBox(),
            icon: const Icon(Icons.keyboard_arrow_down),
            items: items.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                dropdownvalue = newValue!;
              });
            },
            style: const TextStyle(
                color: KTCColors.secondaryTextColor, fontSize: 14),
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(16, 16, 16, 12),
          padding: const EdgeInsets.fromLTRB(12, 16, 12, 9),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        tripStart = true;
                      });
                    },
                    child: Row(
                      children: [
                        Image.asset('assets/images/start_trip.png'),
                        const SizedBox(
                          width: 12,
                        ),
                        Text(
                          "Start Trip",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 14,
                              color: tripStart
                                  ? KTCColors.primaryColor
                                  : KTCColors.lightPrimaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  const Image(
                    image: AssetImage('assets/images/navigate_next.png'),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        tripStart = false;
                      });
                    },
                    child: Row(
                      children: [
                        Text(
                          "End Trip",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 14,
                              color: tripStart
                                  ? KTCColors.lightPrimaryColor
                                  : KTCColors.primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Image.asset('assets/images/end_trip.png')
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              CalendarView(
                defaultDateTime: DateTime.now(),
                minDateTime: DateTime.now(),
                onDateTimeSelected: (date) {},
                selectedDateTime: DateTime(2022, 5, 12, 14, 30),
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
    Navigator.pushNamed(context, KTCRoutes.carGroup);
    print("carGroup called");
  }
}
