import 'dart:io';
import 'dart:typed_data';

import 'package:desaclopar_packege_intranet/image_compress/image_compress.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:desaclopar_packege_intranet/file_picker/handle_files.dart';
import 'package:desaclopar_packege_intranet/svg/I_handles_svg.dart';

import 'mask_text_input.dart/mask_text_input.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(maskTextInput: MaskTextInput(), title: 'test', handlesSvg: HandlesSvg()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final IMaskTextInput maskTextInput;
  final IHandlesSvg handlesSvg;
  MyHomePage({
    Key? key,
    required this.maskTextInput,
    required this.handlesSvg,
    this.title = '',
  }) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Uint8List? bytes;
  Uint8List? compressImage;
  final HandleFilesFilePicker filePicker = HandleFilesFilePicker(filePicker: FilePicker.platform);
  //late final Uint8List svgBytes;
  //late final Uint8List imageBytes;
  final svgNetwork = 'https://s3-us-west-2.amazonaws.com/s.cdpn.io/106114/tiger.svg';
  final svgAssets = 'assets/image_svg/mdi_light_diamond.svg';
  @override
  void initState() {
    //svgBytes = File('assets/image_svg/mdi_light_diamond.svg').readAsBytesSync();
    //imageBytes = File('assets/image/IMG_20230728_105424975_Copia.jpg').readAsBytesSync();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //SizedBox(
                  //  width: 300,
                  //  height: 300,
                  //  child: widget.handlesSvg.renderingSvgAsset(
                  //    image: svgAssets,
                  //    color: Colors.black,
                  //    blendMode: BlendMode.srcIn,
                  //  ),
                  //),
                  //SizedBox(
                  //  width: 300,
                  //  height: 300,
                  //  child: widget.handlesSvg.renderingSvgMemory(
                  //    bytes: svgBytes,
                  //    color: Colors.black,
                  //    blendMode: BlendMode.srcIn,
                  //  ),
                  //),
                  //SizedBox(
                  //  width: 300,
                  //  height: 300,
                  //  child: widget.handlesSvg.renderingSvgNetwork(
                  //    url: svgNetwork,
                  //  ),
                  //),
                  bytes != null
                      ? SizedBox(
                          width: 500,
                          height: 500,
                          child: Image.memory(bytes!),
                        )
                      : SizedBox(),
                  compressImage != null
                      ? SizedBox(
                          width: 500,
                          height: 500,
                          child: Image.memory(compressImage!),
                        )
                      : SizedBox()
                ],
              ),
              SizedBox(
                  width: 400,
                  child: TextFormField(inputFormatters: [
                    widget.maskTextInput.data(),
                  ])),
              Padding(
                padding: const EdgeInsets.all(15),
                child: ElevatedButton(
                  child: Text('Validar'),
                  onPressed: () async {
                    Uint8List? response = await filePicker.getFile(fileType: FileType.image);

                    setState(() {
                       bytes = response;
                    });


                    Uint8List compress = await ImageCompress().compressImageBytes(bytes: bytes!);
                    setState(() {
                     
                      compressImage = compress;
                    });

                   

                    //final bool isValid = formKey.currentState?.validate() ?? false;
                    //if (isValid) {
                    //  print('========================================================');
                    //}
                  },
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          filePicker.getFiles(fileType: FileType.image);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
