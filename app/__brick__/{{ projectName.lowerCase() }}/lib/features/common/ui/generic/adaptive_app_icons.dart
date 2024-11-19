import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:universal_io/io.dart';

class AdaptiveAppIcons {
  AdaptiveAppIcons._();

  static final IconData back =
      isDarwin ? CupertinoIcons.back : Icons.arrow_back;
  static final IconData profile =
      isDarwin ? CupertinoIcons.person_alt : Icons.person;
  static final IconData add = isDarwin ? CupertinoIcons.add : Icons.add;
  static final IconData camera =
      isDarwin ? CupertinoIcons.camera : Icons.camera;
  static final IconData delete =
      Platform.isIOS ? CupertinoIcons.delete_solid : Icons.delete;
  static IconData deleteForever =
      isDarwin ? CupertinoIcons.delete_simple : Icons.delete_forever;
  static final IconData edit = isDarwin ? CupertinoIcons.pencil : Icons.edit;
  static final IconData chevronLeft =
      isDarwin ? CupertinoIcons.left_chevron : Icons.chevron_left;
  static final IconData chevronRight =
      isDarwin ? CupertinoIcons.right_chevron : Icons.chevron_right;
  static final IconData chevronDown =
      isDarwin ? CupertinoIcons.chevron_down : CupertinoIcons.chevron_down;
  static final IconData close = isDarwin ? CupertinoIcons.xmark : Icons.close;
  static final IconData search =
      isDarwin ? CupertinoIcons.search : Icons.search;
  static final IconData star = isDarwin ? CupertinoIcons.star : Icons.star;
  static final IconData share = isDarwin ? CupertinoIcons.share : Icons.share;
  static final IconData more = isDarwin ? Icons.more_horiz : Icons.more_vert;
}

final bool isDarwin = Platform.isIOS || Platform.isMacOS;
