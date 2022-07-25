import 'package:flutter/material.dart';

import '../../utils/ktc_colors.dart';

class CorporateCarBookingWidget extends StatefulWidget {
  //--------------- Corporate >>>>> Sign In >>>> Approval >> pending  ------------------

  const CorporateCarBookingWidget({Key? key}) : super(key: key);

  @override
  State<CorporateCarBookingWidget> createState() =>
      _CorporateCarBookingWidgetState();
}

class _CorporateCarBookingWidgetState extends State<CorporateCarBookingWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      padding: const EdgeInsets.fromLTRB(8, 12, 8, 10),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Expanded(
              child: Image(
            image: AssetImage("assets/images/car.png"),
          )),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                "Santosh Jha",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 14,
                    color: KTCColors.primaryTextColor,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                "Mercedes Benz CLS",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 12,
                    color: KTCColors.primaryTextColor,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 12, 0, 4),
                child: Row(
                  children: const [
                    Text(
                      "Booked On: ",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF555555),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "17/01/2022",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF555555),
                      ),
                    ),
                  ],
                ),
              ),
              const Text(
                "santosh@ktc.com",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF555555),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(4)),
                            border: Border.all(color: const Color(0xFFE5E5E5))),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 3, 0, 4),
                          child: Text(
                            "Reject",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 12.0,
                                color: KTCColors.primaryTextColor),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Expanded(
                    child: GestureDetector(
                      child: Container(
                        decoration: BoxDecoration(
                            color: KTCColors.primaryColor,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(4)),
                            border: Border.all(color: const Color(0xFFE5E5E5))),
                        child: const Padding(
                          padding: EdgeInsets.fromLTRB(0, 3, 0, 4),
                          child: Text(
                            "Accept",
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(fontSize: 12.0, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ))
        ],
      ),
    );
  }
}
