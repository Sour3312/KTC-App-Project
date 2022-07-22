import 'package:flutter/material.dart';
import 'package:flutter_ktc_booking/src/presentation/views/corporate_review_list.dart';

import '../../domain/entities/description.dart';
import '../../utils/ktc_colors.dart';

class ReviewBookingDetails extends StatefulWidget {
  const ReviewBookingDetails({Key? key}) : super(key: key);

  @override
  State<ReviewBookingDetails> createState() => _ReviewBookingDetailsState();
}

class _ReviewBookingDetailsState extends State<ReviewBookingDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Review Booking Details"),
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
    return ListView(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      children: [
        Container(

          margin: const EdgeInsets.fromLTRB(16, 16, 16, 24),
          padding: const EdgeInsets.fromLTRB(12, 16, 12, 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(8.0),
              color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Dear Guest",
                style: TextStyle(
                    color: KTCColors.primaryTextColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                "Please review and confirm the below details,",
                style: TextStyle(
                  color: KTCColors.secondaryTextColor1,
                  fontSize: 12,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CorporateReviewList(
                title: 'User Details',
                data: _getUserDetailsList(),
              ),
              const SizedBox(
                height: 20,
              ),
              CorporateReviewList(
                title: 'Reservation Details',
                data: _getReservationDetailsList(),
                titleColor: KTCColors.primaryTextColor,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Additional Information",
                style: TextStyle(
                    color: KTCColors.primaryTextColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                "e-mail copy to",
                style: TextStyle(
                  color: KTCColors.primaryTextColor,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: (){
                  Navigator.of(context).pop();
                },
                child: Container(
                    color: KTCColors.primaryColor,
                    padding:  const EdgeInsets.fromLTRB(0, 13, 0, 13),
                    child: const Center(
                      child: Text(
                        "Edit",
                        style: TextStyle(fontSize: 16.0, color: Colors.white),
                      ),
                    )),
              ),
            ),
            const SizedBox(width: 1,),
            Expanded(
              child: GestureDetector(
                onTap: null,
                child: Container(
                    color: KTCColors.primaryColor,
                    padding:  const EdgeInsets.fromLTRB(0, 13, 0, 13),
                    child: const Center(
                      child: Text(
                        "Confirm",
                        style: TextStyle(fontSize: 16.0, color: Colors.white),
                      ),
                    )),
              ),
            ),
          ],
        )
      ],
    );
  }

  List<Description> _getUserDetailsList() {
    List<Description> myList = <Description>[];
    myList.add(Description(
      title: 'Renter Name',
      description: ': Mr Santosh Jha',
    ));
    myList.add(Description(
      title: 'Organisation Name',
      description: ': CE Info Systems Ltd',
    ));
    myList.add(Description(
      title: 'Mobile',
      description: ': 9999999991',
    ));
    myList.add(Description(
      title: 'Email',
      description: ': snato@ktc.com',
    ));

    return myList;
  }

  List<Description> _getReservationDetailsList() {
    List<Description> myList = <Description>[];
    myList.add(Description(
      title: 'Rental City',
      description: ': Delhi',
    ));
    myList.add(Description(
      title: 'Organisation Name',
      description: ': CE Info Systems Ltd',
    ));
    myList.add(Description(
      title: 'Mobile',
      description: ': 9999999991',
    ));
    myList.add(Description(
      title: 'Email',
      description: ': snato@ktc.com',
    ));
    myList.add(Description(
      title: 'Rental City',
      description: '',
    ));
    myList.add(Description(
      title: 'Organisation Name',
      description: ': CE Info Systems Ltd',
    ));
    myList.add(Description(
      title: 'Mobile',
      description: ': 9999999991',
    ));
    myList.add(Description(
      title: 'Email',
      description: ': snato@ktc.com',
    ));

    return myList;
  }
}
