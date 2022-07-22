import 'package:flutter/material.dart';

import '../../domain/entities/description.dart';
import '../../utils/ktc_colors.dart';

class CorporateReviewList extends StatefulWidget {
  final List<Description> data;
  final String title;
  final Color? titleColor;
  final Color? descriptionColor;

  const CorporateReviewList(
      {required this.title,
      required this.data,
      Key? key,
      this.titleColor,
      this.descriptionColor})
      : super(key: key);

  @override
  State<CorporateReviewList> createState() => _CorporateReviewListState();
}

class _CorporateReviewListState extends State<CorporateReviewList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: const TextStyle(
              color: KTCColors.primaryTextColor,
              fontSize: 14,
              fontWeight: FontWeight.w600),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemCount: widget.data.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.data[index].title,
                      style: TextStyle(
                        color:
                            widget.titleColor ?? KTCColors.secondaryTextColor1,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      widget.data[index].description,
                      style: TextStyle(
                          color:
                              widget.titleColor ?? KTCColors.primaryTextColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
