import 'package:beta_project/data/models/user.dart';

class Contact extends User {
  final String relation;

  const Contact(String name, String token, String pin, String avatar,
      int lastSeen, this.relation)
      : super(name, token, pin, avatar, lastSeen);
}
