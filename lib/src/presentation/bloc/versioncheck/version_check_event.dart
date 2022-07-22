
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class VersionCheckEvent extends Equatable {
  final String version;

  const VersionCheckEvent(this.version);

  @override
  List<Object?> get props => [];
}

@immutable
class VersionCheck extends VersionCheckEvent {
  const VersionCheck(String version) : super(version);
}
