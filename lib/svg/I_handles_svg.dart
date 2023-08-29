import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

abstract class IHandlesSvg {
  Widget renderingSvgAsset({ Color? color, BlendMode? blendMode, AlignmentGeometry? alignment, BoxFit? boxFit, required String image});
  Widget renderingSvgMemory({ Color? color, BlendMode? blendMode, AlignmentGeometry? alignment, BoxFit? boxFit, required Uint8List bytes});
  Widget renderingSvgNetwork({ Color? color, BlendMode? blendMode, AlignmentGeometry? alignment, BoxFit? boxFit, required String url});
}

class HandlesSvg extends IHandlesSvg {
  @override
  Widget renderingSvgAsset({Color? color, BlendMode? blendMode, AlignmentGeometry? alignment, BoxFit? boxFit,required String image}) {
    return SvgPicture.asset(
      image,
      //fit: boxFit ?? BoxFit.contain,
     colorFilter: color != null && blendMode != null ? ColorFilter.mode(color, blendMode): null,
      alignment: alignment ?? Alignment.center,
    );
  }

  @override
  Widget renderingSvgMemory({Color? color, BlendMode? blendMode, AlignmentGeometry? alignment, BoxFit? boxFit, required Uint8List bytes}) {
    return SvgPicture.memory(
      bytes,
      fit: boxFit ?? BoxFit.contain,
      colorFilter: color  != null && blendMode != null ? ColorFilter.mode(color, blendMode): null,
      alignment: alignment ?? Alignment.center,
    );
  }

  @override
  Widget renderingSvgNetwork({Color? color, BlendMode? blendMode, AlignmentGeometry? alignment, BoxFit? boxFit, required String url}) {
    return SvgPicture.network(
      url,
      fit: boxFit ?? BoxFit.contain,
      colorFilter: color  != null && blendMode != null ? ColorFilter.mode(color, blendMode): null,
      alignment: alignment ?? Alignment.center,
    );
  }
}
