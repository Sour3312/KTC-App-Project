import 'package:flutter/material.dart';
import 'package:flutter_ktc_booking/src/presentation/widgets/home_widget.dart';
import 'package:flutter_ktc_booking/src/presentation/widgets/sign_in_widget.dart';

import '../../presentation/widgets/approvals.dart';
import '../../presentation/widgets/assignments_screen.dart';
import '../../presentation/widgets/booking_conformation.dart';
import '../../presentation/widgets/car_group.dart';
import '../../presentation/widgets/car_selection.dart';
import '../../presentation/widgets/corporate_booking_screen.dart';
import '../../presentation/widgets/corporate_car_group.dart';
import '../../presentation/widgets/corporate_sign_in_widget.dart';
import '../../presentation/widgets/corporate_sign_up.dart';
import '../../presentation/widgets/create_booking_screen.dart';
import '../../presentation/widgets/forget_pass_otp-screen.dart';
import '../../presentation/widgets/forgot_password.dart';
import '../../presentation/widgets/my_booking.dart';
import '../../presentation/widgets/new_password_screen.dart';
import '../../presentation/widgets/password_changed_dialog.dart';
import '../../presentation/widgets/payment_method.dart';
import '../../presentation/widgets/review_booking_details.dart';
import '../../presentation/widgets/sign_up_widget.dart';
import '../../presentation/widgets/user_profie.dart';

class KTCRoutes {
  static const String signUpScreen = "/SignUpScreen";
  static const String home = "/HomeWidget";
  static const String personalSignIn = "/PersonalSignIn";
  static const String createBookingScreen = "/CreateBookingScreen";
  static const String forgotPasswordScreen = "/ForgotPasswordScreen";
  static const String forgetPassOTP = "/ForgetPassOTP";
  static const String newPassword = "/NewPassword";
  static const String passwordChangeDialog = "/PasswordChangeDialog";
  static const String carGroup = "/CarGroup";
  static const String carSelection = "/CarSelection";
  static const String bookingConformation = "/BookingConformation";
  static const String userProfile = "/UserProfile";
  static const String myBooking = "/MyBooking";
  static const String corporateSignInWidget = "/CorporateSignInWidget";
  static const String corporateSignUpWidget = "/CorporateSignUpWidget";
  static const String corporateBookingScreen = "/CorporateBookingScreen";
  static const String assignmentScreen = "/AssignmentScreen";
  static const String corporateCarGroup = "/CorporateCarGroup";
  static const String paymentMethod = "/PaymentMethod";
  static const String approvalsScreen = "/ApprovalsScreen";
  static const String reviewBookingDetails = "/ReviewBookingDetails";

  static Route? onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case signUpScreen:
        return _materialRoute(const SignUpWidget());

      case home:
        return _materialRoute(const HomeWidget());

      case personalSignIn:
        return _materialRoute(const SignInWidget());

      case createBookingScreen:
        return _materialRoute(const CreateBookingScreen());

      case forgotPasswordScreen:
        return _materialRoute(const ForgotPasswordScreen());

      case forgetPassOTP:
        return _materialRoute(ForgetPassOTP(
          email: settings.arguments as String,
        ));

      case passwordChangeDialog:
        return _materialRoute(const PasswordChangeDialog());

      case newPassword:
        return _materialRoute(const NewPassword());

      case carGroup:
        return _materialRoute(const CarGroup());

      case carSelection:
        return _materialRoute(const CarSelection());

      case bookingConformation:
        return _materialRoute(const BookingConformation());

      case userProfile:
        return _materialRoute(const UserProfile());

      case myBooking:
        return _materialRoute(const MyBooking());

      case corporateSignInWidget:
        return _materialRoute(const CorporateSignInWidget());

      case corporateSignUpWidget:
        return _materialRoute(CorporateSignUpWidget(
          email: settings.arguments as String,
        ));

      case corporateBookingScreen:
        return _materialRoute(const CorporateBookingScreen());

      case assignmentScreen:
        return _materialRoute(const AssignmentScreen());

      case corporateCarGroup:
        return _materialRoute(const CorporateCarGroup());

      case paymentMethod:
        return _materialRoute(const PaymentMethod());

      case approvalsScreen:
        return _materialRoute(const ApprovalsScreen());

      case reviewBookingDetails:
        return _materialRoute(const ReviewBookingDetails());

      default:
        return null;
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
