import 'package:flutter/material.dart';
import 'package:flutter_ktc_booking/src/config/routes/ktc_routes.dart';
import 'package:flutter_ktc_booking/src/utils/ktc_colors.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KTCColors.backgroundColor,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: KTCColors.primaryColor,
        title: Center(
          child: Image.asset('assets/images/ktc_logo.png'),
        ),
      ),
      body: Column(
        children: [
          Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 20.0),
              child: GestureDetector(
                child: Card(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4))),
                  shadowColor: const Color.fromARGB(31, 0, 0, 0),
                  child: Column(
                    children: [
                      Container(
                        color: KTCColors.primaryColor,
                        padding: const EdgeInsets.all(8.0),
                        child: const Center(
                          child: Text("Personal",
                              style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white)),
                        ),
                      ),
                      const SizedBox(
                        height: 24.0,
                      ),
                      const Image(
                          image: AssetImage(
                              'assets/images/personnel_home_icon.png')),
                      const SizedBox(
                        height: 12.0,
                      ),
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        child: const Center(
                          child: Text("Chauffeur Driven",
                              style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w600,
                                  color: KTCColors.primaryTextColor)),
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                    ],
                  ),
                ),
                onTap: () =>
                    {Navigator.pushNamed(context, KTCRoutes.personalSignIn)},
              )),
          Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
              child: GestureDetector(
                onTap: () => {
                  Navigator.pushNamed(context, KTCRoutes.corporateSignInWidget)
                },
                child: Card(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4))),
                  shadowColor: const Color.fromARGB(31, 0, 0, 0),
                  child: Column(
                    children: [
                      Container(
                        color: KTCColors.primaryColor,
                        padding: const EdgeInsets.all(8.0),
                        child: const Center(
                          child: Text("Corporate",
                              style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white)),
                        ),
                      ),
                      const SizedBox(
                        height: 24.0,
                      ),
                      const Image(
                          image: AssetImage(
                              'assets/images/corporate_home_icon.png')),
                      const SizedBox(
                        height: 12.0,
                      ),
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        child: const Center(
                          child: Text("Chauffeur Driven",
                              style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w600,
                                  color: KTCColors.primaryTextColor)),
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
