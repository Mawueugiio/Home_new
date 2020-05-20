import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Scene extends Equatable {
  final String title;
  final IconData icon;

  const Scene(this.title, this.icon);

  @override
  List<Object> get props => [title, icon];
}
