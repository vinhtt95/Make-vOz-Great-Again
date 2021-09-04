import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_tesseract_ocr/android_ios.dart';
import 'dart:async';
import 'dart:io';

import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';
import 'package:url_launcher/url_launcher.dart';

import 'app_themes.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

enum AppState {
  free,
  picked,
  cropped,
  scaned,
  sended,
}

class _MyAppState extends State<MyApp> {
  late StreamSubscription _intentDataStreamSubscription;

  late AppState state;
  File? imageFile;

  final TextEditingController _code = TextEditingController();
  final FocusNode _codeFocus = FocusNode();
  String hintText = "Mã thẻ";

  List<String> entries = <String>[];

  @override
  void initState() {
    state = AppState.free;
    // For sharing images coming from outside the app while the app is in the memory
    _intentDataStreamSubscription = ReceiveSharingIntent.getMediaStream()
        .listen((List<SharedMediaFile> value) {
      if (value.isNotEmpty && value[0].path.isNotEmpty) {
        setState(() {
          imageFile = File(value[0].path);
          state = AppState.picked;
          _cropImage();
        });
        _cropImage();
      }
    }, onError: (err) {
      print("getIntentDataStream error: $err");
    });

    // For sharing images coming from outside the app while the app is closed
    ReceiveSharingIntent.getInitialMedia().then((List<SharedMediaFile> value) {
      if (value.isNotEmpty && value[0].path.isNotEmpty) {
        setState(() {
          imageFile = File(value[0].path);
          state = AppState.picked;
        });
        _cropImage();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _intentDataStreamSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MVGA',
      theme: AppThemes.darkTheme,
      home: GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Align(
              alignment: Alignment.centerLeft,
              child: Text("Make vOz Great Again")),
          actions: [
            IconButton(
              icon: _buildButtonIcon(),
              tooltip: 'Show Snackbar',
              onPressed: () {
                if (state == AppState.free)
                  _pickImage();
                else if (state == AppState.picked)
                  _cropImage();
                else if (state == AppState.cropped)
                  _scanText();
                else if (state == AppState.scaned)
                  _sendText(_code.text);
                else if (state == AppState.sended) _clearImage();
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              codeTextField(),
              SizedBox(
                height: 10.0,
              ),
              _buildListText(),
              SizedBox(
                height: 10.0,
              ),
              Container(
                constraints: BoxConstraints(
                  maxHeight: 300.0,
                  minHeight: 100.0,
                ),
                child: imageFile != null
                    ? Image.file(imageFile!)
                    : Container(
                        height: 0.0,
                      ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text('Copyright © 2021 All right reserved to Jackie'),
                ),
              ),
            ],
          ),
        ),
      ),
      ),
    );
  }

  Widget _buildButtonIcon() {
    if (state == AppState.free)
      return Icon(
        Icons.add,
        color: Colors.white,
      );
    else if (state == AppState.picked)
      return Icon(
        Icons.crop,
        color: Colors.white,
      );
    else if (state == AppState.cropped)
      return Icon(
        Icons.scanner_rounded,
        color: Colors.white,
      );
    else if (state == AppState.scaned)
      return Icon(
        Icons.send_rounded,
        color: Colors.white,
      );
    else if (state == AppState.sended)
      return Icon(
        Icons.clear,
        color: Colors.white,
      );
    else
      return Container();
  }

  Widget codeTextField() {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            minLines: 1,
            maxLines: 5,
            controller: _code,
            focusNode: _codeFocus,
            decoration: InputDecoration(
              labelText: hintText,
              hintText: hintText,
              fillColor: Colors.white,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(
                  color: Colors.red,
                  width: 2.0,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(
                  color: Colors.white,
                  width: 2.0,
                ),
              ),
            ),
            keyboardType: TextInputType.number,
            onFieldSubmitted: (_) {
              if (_code.text.isNotEmpty) {
                _sendText(_code.text);
              }
            },
          ),
        ),
      ],
    );
  }

  Expanded _buildListText() {
    return Expanded(
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        padding: const EdgeInsets.all(3),
        itemCount: entries.length,
        itemBuilder: (BuildContext context, int index) {
          final item = entries[index];

          return Slidable(
            actionPane: SlidableDrawerActionPane(),
            actionExtentRatio: 0.25,
            child: Container(
              height: 50,
              child: GestureDetector(
                onTap: () => _sendText(item),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('${item}'),
                ),
              ),
            ),
            secondaryActions: <Widget>[
              IconSlideAction(
                caption: 'Edit',
                color: Colors.green,
                icon: Icons.edit,
                onTap: () => {
                  setState(() {
                    _code.text = entries[index];
                    FocusScope.of(context).requestFocus(_codeFocus);
                  })
                },
              ),
              IconSlideAction(
                caption: 'Send',
                color: Colors.blue,
                icon: Icons.send_rounded,
                onTap: () => {_sendText(item)},
              ),
            ],
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }

  Future<Null> _pickImage() async {
    final pickedImage =
        await ImagePicker().getImage(source: ImageSource.gallery);
    imageFile = pickedImage != null ? File(pickedImage.path) : null;
    if (imageFile != null) {
      _cropImage();
    }
  }

  Future<Null> _cropImage() async {
    File? croppedFile = await ImageCropper.cropImage(
        sourcePath: imageFile!.path,
        aspectRatioPresets: Platform.isAndroid
            ? [
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio16x9
              ]
            : [
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio5x3,
                CropAspectRatioPreset.ratio5x4,
                CropAspectRatioPreset.ratio7x5,
                CropAspectRatioPreset.ratio16x9
              ],
        androidUiSettings: AndroidUiSettings(
          toolbarTitle: 'Cắt ảnh',
          toolbarColor: Colors.red,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.ratio16x9,
          cropGridColor: Colors.red,
          cropFrameStrokeWidth: 1,
          cropGridRowCount: 1,
          cropGridColumnCount: 1,
          lockAspectRatio: false,
          hideBottomControls: true,
          showCropGrid: true,
        ),
        iosUiSettings: IOSUiSettings(
          title: 'Cắt ảnh',
        ));
    if (croppedFile != null) {
      imageFile = croppedFile;
      _scanText();
      // setState(() {
      //   state = AppState.cropped;
      // });
    }
  }

  Future<Null> _scanText() async {
    try {
      String scanText = await FlutterTesseractOcr.extractText(imageFile!.path,
          language: 'vie');

      List<String> textScanResult = scanText.split("\n");
      List<String> resultTextScanned = <String>[];
      textScanResult.forEach((element) {
        if (element.trim().isNotEmpty &&
            isNumericUsingRegularExpression(element)
        ) {
          resultTextScanned.add(element);
        }
      });
      setState(() {
        entries = resultTextScanned;
      });
    } catch (e) {
      print(e);
      print("Error scanner!");
    }
  }

  Future<Null> _sendText(String text) async {
    if (text.isNotEmpty && isNumericUsingRegularExpression(text)) {
      _launchCaller(text);
    } else {
      print(text);

      // CommonUtil.showToast(
      //   child: Text(
      //     "Mã thẻ phải toàn số!",
      //     style: Get.theme.textTheme.bodyText1,
      //   ),
      // );
    }
  }

  void _launchCaller(String text) async {
    var code = Uri.encodeComponent('*100*${text}#');
    var url = "tel:$code";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  bool isNumericUsingRegularExpression(String string) {
    print(string);

    final numericRegex = RegExp(r'^-?(([0-9]*)|(([0-9]*)\.([0-9]*)))$');

    return numericRegex.hasMatch(string);
  }

  void _clearImage() {
    imageFile = null;
    setState(() {
      state = AppState.free;
    });
  }
}
