import 'package:equatable/equatable.dart';

class Room extends Equatable {
  final String name;
  final String image;
  final int devices;

  const Room(this.name, this.image, this.devices);

  @override
  List<Object> get props => [name, image, devices];
}
