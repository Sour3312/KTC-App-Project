import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../utils/ktc_colors.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({Key? key}) : super(key: key);

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  //======== Payment Code here =============
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
    return const WebView(
      initialUrl:
          'https://dribbble.com/shots/17065240-Payment-Gateway-Light-Version',
    );
  }
}
