import 'dart:typed_data';

abstract class IHandleFiles<T> {
  Future<Uint8List?> getFile({required T fileType});
  Future<List<Uint8List?>?> getFiles({required T fileType});
}
