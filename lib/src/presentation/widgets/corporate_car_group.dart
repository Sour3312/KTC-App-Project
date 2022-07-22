import 'package:flutter/material.dart';

import '../../config/routes/ktc_routes.dart';
import '../../utils/ktc_colors.dart';

class CorporateCarGroup extends StatefulWidget {
  const CorporateCarGroup({Key? key}) : super(key: key);

  @override
  State<CorporateCarGroup> createState() => _CorporateCarGroupState();
}

class _CorporateCarGroupState extends State<CorporateCarGroup> {
  List<String> dataList = _getDataList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Car Group"),
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
        ListView.builder(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemCount: dataList.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: (){
                Navigator.of(context).pop(dataList[index]);
                },
              child: Container(
                margin: const EdgeInsets.fromLTRB(0, 1, 0, 1),
                padding: const EdgeInsets.fromLTRB(15, 15, 8, 15),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                ),
                child: Row(
                  children: [
                     Text(
                      dataList[index],
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          color: KTCColors.secondaryTextColor, fontSize: 14),
                    ),

                  ],
                ),
              ),
            );
          },
        )
      ],
    );
  }


}

List<String> _getDataList() {
  List<String> myList = <String>[];
  myList.add("Mercedes Benz Or Similar");
  myList.add("BMW 6 Series Or Similar");
  myList.add("Toyota Camry Or Similar");
  myList.add("Honda HR-V Or Similar");
  myList.add("Toyota Fortuner Or Similar");
  return myList;
}
