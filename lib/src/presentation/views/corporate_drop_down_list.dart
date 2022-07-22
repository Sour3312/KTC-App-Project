import 'package:flutter/material.dart';

class CorporateDropDownList extends StatefulWidget {
  final List<Widget> children;
  final String title;

  const CorporateDropDownList(
      {required this.title, required this.children, Key? key})
      : super(key: key);

  @override
  State<CorporateDropDownList> createState() => _CorporateDropDownListState();
}

class _CorporateDropDownListState extends State<CorporateDropDownList>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      upperBound: 0.5,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(4)),
              border: Border.all(color: const Color(0xFFE5E5E5))),
          child: ListTile(
              title:  Text(
                widget.title,
                style: const TextStyle(
                  color: Color(0xFF737373),
                  fontSize: 14,
                ),
              ),
              trailing: RotationTransition(
                turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
                child: IconButton(
                  icon: Icon(Icons.expand_less),
                  onPressed: () {
                    setState(() {
                      if (_isExpanded) {
                        _controller..reverse(from: 0.5);
                      } else {
                        _controller..forward(from: 0.0);
                      }
                      _isExpanded = !_isExpanded;
                    });
                  },
                ),
              )),
        ),
        Column(children: _isExpanded ? widget.children : [])
      ],
    );
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
