import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg_provider;
import 'package:universal_io/io.dart';

class UniversalImageDecoration extends DecorationImage {
  UniversalImageDecoration(
    String uri, {
    super.fit,
    super.colorFilter,
    super.alignment,
    super.repeat,
  }) : super(
          image: (uri.startsWith('assets')
              ? (uri.endsWith('.svg') ? svg_provider.Svg(uri) : AssetImage(uri))
              : (uri.startsWith('/')
                  ? FileImage(File(uri))
                  : ExtendedNetworkImageProvider(uri))) as ImageProvider,
        );
}
