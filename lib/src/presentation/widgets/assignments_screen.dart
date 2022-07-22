import 'package:flutter/material.dart';

import '../../utils/ktc_colors.dart';

class AssignmentScreen extends StatefulWidget {
  const AssignmentScreen({Key? key}) : super(key: key);

  @override
  State<AssignmentScreen> createState() => _AssignmentScreenState();
}

class _AssignmentScreenState extends State<AssignmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment"),
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
    var list= getList();
    return ListView.builder(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: const EdgeInsets.fromLTRB(16, 12, 16, 0),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(4)),
              border: Border.all(color: const Color(0xFFE5E5E5))),
          child: GestureDetector(
            onTap: ()  {
              Navigator.of(context).pop(list[index]);
              },
            child:  ListTile(
                title: Text(
                  list[index],
                  style: const TextStyle(
                    color: Color(0xFF737373),
                    fontSize: 14,
                  ),
                ),
     ),
          ),
        );
      },
    );
  }

  List<String> getList() {
    List<String> myList = <String>[];
    myList.add("Local Run-Full day");
    myList.add("Local Run-half day");
    myList.add("Transfers(Airport)");
    myList.add("Outstation");
    return myList;
  }



}
