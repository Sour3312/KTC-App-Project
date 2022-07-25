import 'package:flutter/material.dart';

import '../../utils/ktc_colors.dart';

class CarBookingWidget extends StatefulWidget {
  const CarBookingWidget({Key? key}) : super(key: key);

  @override
  State<CarBookingWidget> createState() => _CarBookingWidgetState();
}

class _CarBookingWidgetState extends State<CarBookingWidget> {
  @override
  Widget build(BuildContext context) {
    // ========== Upcoming section code from My booking ==========
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
              Container(
                margin: const EdgeInsets.only(right: 4),
                child: TextButton(
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.all(12.0)),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            KTCColors.primaryColor),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4.0),
                                    side: const BorderSide()))),
                    onPressed: () {},
                    child: const Text(
                      "Track Chauffeur",
                      style: TextStyle(fontSize: 12.0, color: Colors.white),
                    )),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
