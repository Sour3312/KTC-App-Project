import 'package:flutter/material.dart';
import 'package:flutter_ktc_booking/src/config/routes/ktc_routes.dart';
import 'package:flutter_ktc_booking/src/core/resources/data_state.dart';
import 'package:flutter_ktc_booking/src/injector.dart';
import 'package:flutter_ktc_booking/src/utils/ktc_colors.dart';
import 'package:flutter_ktc_booking/src/domain/usecase/version_check_use_case.dart';

class SplashWidget extends StatelessWidget {
  const SplashWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Future.delayed(const Duration(seconds: 3), () {
    //   Navigator.popAndPushNamed(context, KTCRoutes.home);
    // });
    _callVersionCheck(context);
    return _buildSplash();
  }

  Widget _buildSplash() {
    return Stack(
      children: [
        Container(
          color: KTCColors.primaryColor,
          child: const Center(
            // Center is a layout widget. It takes a single child and positions it
            // in the middle of the parent.
            child: Image(
              image: AssetImage("assets/images/splash_logo.png"),
            ),
          ),
        ),
        // _versionCheckBloc()
      ],
    );
  }

  void _callVersionCheck(BuildContext context) async {
    // final useCase = injector<VersionCheckUseCase>();
    // final dataStor = await useCase.call(params: "1.0");
    // if (dataStor is DataSuccess) {
    //   print(dataStor.data);
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.popAndPushNamed(context, KTCRoutes.home);
    });
    // }
  }
}

// class _SplashWidgetState extends State {
//   @override
//   void initState() {
//     super.initState();
//     Future.delayed(const Duration(seconds: 3), () {
//       Navigator.popAndPushNamed(context, KTCRoutes.home);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return _buildSplash();
//   }
//
//   //TODO Remove
//   // Widget _blocProvider() {
//   //   return BlocProvider<VersionCheckBloc>(
//   //     create: (_) => injector<VersionCheckBloc>()..add(const VersionCheck("1.0")),
//   //     child: _buildSplash(),
//   //   );
//   // }
//
//
//
//   //TODO Remove
//   // Widget _versionCheckBloc() {
//   //   return BlocBuilder<VersionCheckBloc, VersionCheckState>(builder: (_, state) {
//   //     if(state is VersionCheckSuccess) {
//   //       print(state.versionDetail);
//   //     }
//   //     if(state is VersionCheckLoading) {
//   //       return const Center(child: CircularProgressIndicator(),);
//   //     } else {
//   //       return Container();
//   //     }
//   //   });
//   // }
//
//   // void checkVersion() {
//   //   final blocProvider = BlocProvider.of<VersionCheckBloc>(context);
//   //   blocProvider.add(const VersionCheck("1.0"));
//   // }
//
//   void callVersioncheck() async {
//     final useCase = injector<VersionCheckUseCase>();
//     final dataStor = await useCase.call(params: "1.0");
//     if (dataStor is DataSuccess) {
//       print(dataStor.data);
//     }
//   }
// }
