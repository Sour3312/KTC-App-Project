import 'package:flutter/material.dart';
import 'package:flutter_ktc_booking/src/presentation/views/car_booking_history_card.dart';

import '../../utils/ktc_colors.dart';
import '../views/car_booking_card.dart';
import '../views/corporate_car_booking_card.dart';

class ApprovalsScreen extends StatefulWidget {
  //--------------- Corporate >>>>> Sign In >>>> Approval ------------------

  const ApprovalsScreen({Key? key}) : super(key: key);

  @override
  State<ApprovalsScreen> createState() => _ApprovalsScreenState();
}

class _ApprovalsScreenState extends State<ApprovalsScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: KTCColors.backgroundColor,
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            bottom: const TabBar(
              indicatorColor: Colors.white,
              tabs: [
                Tab(text: 'Pending'),
                Tab(text: 'Approved'),
              ],
            ),
            title: const Text(
              "Approvals",
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
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                // itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                  return const CorporateCarBookingWidget();
                },
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                // itemCount: 4,
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
