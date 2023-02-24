import 'package:flutter/material.dart';

class Notice {
  @required
  String title;
  @required
  String description;
  @required
  DateTime date;
  @required
  bool unread;
  Image displayImage;

  Notice(
      this.title, this.description, this.date, this.unread, this.displayImage);
}
