import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ktc_booking/src/presentation/views/car_conformation_card.dart';

import '../../config/routes/ktc_routes.dart';
import '../../utils/ktc_colors.dart';

class BookingConformation extends StatefulWidget {
  const BookingConformation({Key? key}) : super(key: key);

  @override
  State<BookingConformation> createState() => _BookingConformationState();
}

class _BookingConformationState extends State<BookingConformation>
    with SingleTickerProviderStateMixin {
  String radioButtonItem = 'Male';
  int id = 1;

  late AnimationController _controller;

  bool _expanded = true;

  var value = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
      upperBound: 0.5,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Booking Confirmation"),
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
      children: [
        const CarConformationCard(),
        const Padding(
          padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: Text(
            "Please select either of the Guest Check out or Sign-In/Sign-Up to continue Booking ",
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 12,
              color: Color(0xFF737373),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(16, 16, 16, 12),
          padding: const EdgeInsets.all(12),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
          child: Row(
            children: [
              Radio(
                value: 1,
                groupValue: id,
                onChanged: (val) {
                  setState(() {
                    radioButtonItem = 'Book As Guest';
                    id = 1;
                  });
                },
              ),
              const Text(
                'Book As Guest',
                style: TextStyle(
                    fontSize: 14.0,
                    color: KTCColors.secondaryTextColor1,
                    fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Radio(
                value: 2,
                groupValue: id,
                onChanged: (val) {
                  setState(() {
                    radioButtonItem = 'Sign Up/ Sign In';
                    id = 2;
                  });
                },
              ),
              const Text(
                'Sign Up/ Sign In',
                style: TextStyle(
                    fontSize: 14.0,
                    color: KTCColors.secondaryTextColor1,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(16, 0, 16, 12),
          padding: const EdgeInsets.all(15),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
          child: const Center(
            child: Text(
              "Flight",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF737373),
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(16, 0, 16, 12),
          padding: const EdgeInsets.all(15),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
          child: const Center(
            child: Text(
              "Add-On(s)?",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF555555),
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(16, 0, 16, 2),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
          child: ListTile(
              title: Text("Rental Amount: ₹20,402"),
              trailing: RotationTransition(
                turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
                child: IconButton(
                  icon: Icon(Icons.expand_less),
                  onPressed: () {
                    setState(() {
                      if (_expanded) {
                        _controller..reverse(from: 0.5);
                      } else {
                        _controller..forward(from: 0.0);
                      }
                      _expanded = !_expanded;
                    });
                  },
                ),
              )),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(16, 0, 16, 26),
          child: _expanded
              ? ListView(
                  shrinkWrap: true,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                      ),
                      child: const Text(
                        "My Order Summary",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 14,
                            color: KTCColors.primaryTextColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemCount: 4,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                            padding: const EdgeInsets.fromLTRB(12, 8, 16, 8),
                            margin: const EdgeInsets.fromLTRB(0, 1, 0, 1),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                            ),
                            child: Row(
                              children: const [
                                Text(
                                  "Basic Rental: ",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: KTCColors.secondaryTextColor1,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  "₹1,627",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: KTCColors.secondaryTextColor1,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ));
                      },
                    )
                  ],
                )
              : null,
        ),
        Row(
          children: [
            Checkbox(
              value: this.value,
              onChanged: (bool? value) {
                setState(() {
                  this.value = value!;
                });
              },
            ),
            const SizedBox(
              width: 8,
            ),
            RichText(
              text: TextSpan(
                style: const TextStyle(
                  fontSize: 14,
                  color: KTCColors.secondaryTextColor1,
                ),
                children: <TextSpan>[
                  TextSpan(text: 'I Agree to the '),
                  TextSpan(
                      text: 'Terms and Conditions',
                      style: const TextStyle(
                        fontSize: 14,
                        color: KTCColors.primaryColor,
                          decoration: TextDecoration.underline
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          print('Terms and Conditions');
                        }),
                ],
              ),
            )
          ],
        ),
        const SizedBox(
          height: 27,
        ),
        GestureDetector(
          onTap: _payment,
          child: Container(
              color: KTCColors.primaryColor,
              padding: const EdgeInsets.fromLTRB(0, 13, 0, 13),
              child: const Center(
                child: Text(
                  "Proceed to Payment",
                  style: TextStyle(fontSize: 16.0, color: Colors.white),
                ),
              )),
        )
      ],
    );
  }

  void _payment() {
    Navigator.pushNamed(context, KTCRoutes.paymentMethod);
  }
}
