import 'package:flutter/material.dart';
import 'package:flutter_ktc_booking/src/presentation/views/car_selection_card.dart';

import '../../config/routes/ktc_routes.dart';
import '../../utils/ktc_colors.dart';

class CarSelection extends StatefulWidget {
  const CarSelection({Key? key}) : super(key: key);

  @override
  State<CarSelection> createState() => _CarSelectionState();
}

class _CarSelectionState extends State<CarSelection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Car Selection "),
        leading: IconButton(
          icon: Image.asset('assets/images/ic_back_arrow.png'),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      backgroundColor: KTCColors.backgroundColor,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    //===============Car Selection code here================
    return ListView(
      shrinkWrap: true,
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          padding: const EdgeInsets.fromLTRB(12, 12, 0, 10),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "City",
                style: TextStyle(
                    fontSize: 12,
                    color: KTCColors.secondaryTextColor1,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 28,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Delhi/NCR",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 12,
                          color: KTCColors.secondaryTextColor1,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "Mapmyindia Head Office, 237, Okhla Industrial Estate Phase 3, Near Modi Mill, New Delhi, Delhi, 110020",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 12, color: KTCColors.secondaryTextColor1),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(16, 0, 16, 8),
          padding: const EdgeInsets.fromLTRB(12, 12, 0, 10),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Text(
                          "Start Date: ",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 12,
                              color: KTCColors.secondaryTextColor1,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "12-Jan-2022",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 12,
                              color: KTCColors.secondaryTextColor1),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: const [
                        Text(
                          "Start Time: ",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 12,
                              color: KTCColors.secondaryTextColor1,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "07:00PM",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 12,
                              color: KTCColors.secondaryTextColor1),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Text(
                          "End Date: ",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 12,
                              color: KTCColors.secondaryTextColor1,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "14-Jan-2022",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 12,
                              color: KTCColors.secondaryTextColor1),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: const [
                        Text(
                          "End Time: ",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 12,
                              color: KTCColors.secondaryTextColor1,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "02:00AM",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 12,
                              color: KTCColors.secondaryTextColor1),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        ListView(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                return const CarBookingWidget();
              },
            )
          ],
        ),
        GestureDetector(
          onTap: _continue,
          child: Container(
              color: KTCColors.primaryColor,
              padding: const EdgeInsets.fromLTRB(0, 13, 0, 13),
              child: const Center(
                child: Text(
                  "Continue",
                  style: TextStyle(fontSize: 16.0, color: Colors.white),
                ),
              )),
        ),
      ],
    );
  }

//---------- Function ----------
  void _continue() {
    Navigator.pushNamed(context, KTCRoutes.bookingConformation);
  }
}
