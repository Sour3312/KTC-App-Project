import 'package:flutter/material.dart';

class CorporateBookingCard extends StatefulWidget {
    //--------------- Corporate >>>>> Sign In >>>> Home(used here) ------------------

  final List<Widget> children;
  final String title;

  const CorporateBookingCard(
      {required this.title, required this.children, Key? key})
      : super(key: key);

  @override
  State<CorporateBookingCard> createState() => _CorporateBookingCardState();
}

class _CorporateBookingCardState extends State<CorporateBookingCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Container(
            decoration: const BoxDecoration(
              color: Color(0xFF374852),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(4),
                topRight: Radius.circular(4),
              ),
            ),
            padding: const EdgeInsets.fromLTRB(12, 8, 0, 7),
            child: Text(
              widget.title,
              textAlign: TextAlign.start,
              style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Column(
            children: widget.children,
          )
        ]));
  }

}
