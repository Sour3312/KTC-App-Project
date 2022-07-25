import 'package:flutter/material.dart';
import 'package:flutter_ktc_booking/src/presentation/views/car_booking_history_card.dart';

import '../../utils/ktc_colors.dart';
import '../views/car_booking_card.dart';

class MyBooking extends StatefulWidget {
  //--------------- Corporate >> Sign In >> My Bookings ------------------

  const MyBooking({Key? key}) : super(key: key);

  @override
  State<MyBooking> createState() => _MyBookingState();
}

class _MyBookingState extends State<MyBooking> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: KTCColors.backgroundColor,
          resizeToAvoidBottomInset: false,
          //===========Appbar===========
          appBar: AppBar(
            bottom: const TabBar(
              indicatorColor: Colors.greenAccent,
              tabs: [
                Tab(text: 'Upcoming'),
                Tab(text: 'History'),
              ],
            ),
            title: const Text(
              "My Booking",
              style: TextStyle(color: Colors.white),
            ),
            leading: IconButton(
              icon: Image.asset('assets/images/ic_back_arrow.png'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            automaticallyImplyLeading: false,
            backgroundColor: KTCColors.primaryColor,
          ),
          body: TabBarView(
            //=========== Two screens code here ===========
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemCount: 2,
                itemBuilder: (BuildContext context, int index) {
                  return const CarBookingWidget();
                },
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                // itemCount: 1,
                itemBuilder: (BuildContext context, int index) {
                  return const CarBookingHistoryWidget();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
