import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:universal_io/io.dart';

class GenericAppIcons {
  static final IconData back =
      Platform.isAndroid ? Icons.arrow_back : CupertinoIcons.back;
  static final IconData profile =
      Platform.isAndroid ? Icons.person : CupertinoIcons.person_alt;
  static final IconData add =
      Platform.isAndroid ? Icons.add : CupertinoIcons.add;
  static final IconData camera =
      Platform.isAndroid ? Icons.camera : CupertinoIcons.camera;
  static final IconData delete =
      Platform.isAndroid ? Icons.delete : CupertinoIcons.delete_solid;
  static final IconData edit =
      Platform.isAndroid ? Icons.edit : CupertinoIcons.pencil;
  static final IconData leftChevron =
      Platform.isAndroid ? Icons.chevron_left : CupertinoIcons.left_chevron;
  static final IconData rightChevron =
      Platform.isAndroid ? Icons.chevron_right : CupertinoIcons.right_chevron;
  static final IconData close =
      Platform.isAndroid ? Icons.close : CupertinoIcons.xmark;
  static final IconData search =
      Platform.isAndroid ? Icons.search : CupertinoIcons.search;
  static final IconData chevronDown = Platform.isAndroid
      ? CupertinoIcons.chevron_down
      : CupertinoIcons.chevron_down;
  static const IconData arrowDropDown = Icons.arrow_drop_down;
  static final IconData star =
      Platform.isAndroid ? Icons.star : CupertinoIcons.star;
}
