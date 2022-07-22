import 'package:flutter/material.dart';

import '../../utils/ktc_colors.dart';

class CarConformationCard extends StatefulWidget {
  const CarConformationCard({Key? key}) : super(key: key);

  @override
  State<CarConformationCard> createState() => _CarConformationCardState();
}

class _CarConformationCardState extends State<CarConformationCard> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: const EdgeInsets.fromLTRB(16, 8, 16, 12),
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
                  Row(
                    children: [
                      const Expanded(
                        child: Text(
                          "Mercedes Benz CLS",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 14,
                              color: KTCColors.primaryTextColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Spacer(),
                      Image.asset("assets/images/info.png")
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 12, 0, 4),
                    child: Row(
                      children: const [
                        Text(
                          "Basic Rental: ",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 12,
                            color: KTCColors.secondaryTextColor1,
                          ),
                        ),
                        Text(
                          "₹1,627",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 12,
                              color: KTCColors.secondaryTextColor1,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 12),
                    child: Row(
                      children: const [
                        Text(
                          "You Save: ",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 12,
                            color: KTCColors.secondaryTextColor1,
                          ),
                        ),
                        Text(
                          "₹18,128",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 12,
                              color: KTCColors.secondaryTextColor1,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 4),
                    child: TextButton(
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.all(12.0)),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                KTCColors.primaryColor),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4.0),
                                    side: const BorderSide()))),
                        onPressed: () {},
                        child: const Text(
                          "Book Now",
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
