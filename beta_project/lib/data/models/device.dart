import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Device extends Equatable {
  final String name;
  final IconData icon;
  final bool isEnabled;
  final String metadata;

  const Device(this.name, this.icon, this.isEnabled, {this.metadata = "n/a"});

  @override
  List<Object> get props => [name, icon];
}
