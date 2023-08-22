import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'i_handle_files.dart';

class HandleFilesFilePicker extends IHandleFiles<FileType> {
  final FilePicker filePicker;
  HandleFilesFilePicker({
    required this.filePicker,
  });

  @override
  Future<Uint8List?> getFile({required FileType fileType}) async {
    try {
      final FilePickerResult? result = await filePicker.pickFiles(
        type: fileType,
        withData: true,
        // allowedExtensions: [
        //   'svg',
        //   'pdf',
        //   'png',
        //   'jpg',
        // ],
      );
      if (result != null) {
        Uint8List? bytes = result.files.first.bytes;
        return bytes;
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Uint8List?>?> getFiles({required FileType fileType}) async {
    try {
      final List<Uint8List?> bytes = [];
      final FilePickerResult? result = await filePicker.pickFiles(
        allowMultiple: true,
        type: FileType.custom,
        allowedExtensions: [
          'svg',
          'pdf',
          'png',
          'jpg',
        ],
      );
      if (result != null) {
        final List<PlatformFile> listBytes = result.files;
        for (var element in listBytes) {
          bytes.add(element.bytes);
        }

        return bytes;
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }
}
