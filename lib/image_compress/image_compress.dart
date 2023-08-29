import 'dart:typed_data';

import 'package:flutter_image_compress/flutter_image_compress.dart';

abstract class IImageCompress {
  Future<Uint8List>  compressImageBytes({required Uint8List bytes});
}


class ImageCompress extends IImageCompress{
  @override
  Future<Uint8List> compressImageBytes({required Uint8List bytes, int? minHeight, int? minWidth, int? quality, int? rotate, }) async {

    var result = await FlutterImageCompress.compressWithList(
      bytes
      ,
      minHeight: minHeight ?? 120,
      minWidth: minWidth ?? 900,
      quality: quality ?? 50,
      rotate: rotate ?? 35,
      format: CompressFormat.png
    );
    
    //print(list.length);
    //print(result.length);
    return result;
  }
  
}