
import 'package:flutter_ktc_booking/src/core/resources/data_state.dart';

abstract class VersionCheckRepository {
  Future<DataState<String>> versionCheck(String version);
}