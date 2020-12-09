import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:image/image.dart' as IMG;
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:smartsurveys/models/Home.dart';
import 'package:smartsurveys/models/SurveyApp.dart';
import 'package:smartsurveys/widgets/PillShapedButton.dart';
import 'package:smartsurveys/widgets/SurveyBody.dart';

class LocationPage extends StatefulWidget {
  final Home home;
  LocationPage({key, this.home}) : super(key: key);
  @override
  _LocationPageState createState() => _LocationPageState(home: home);
}

class _LocationPageState extends State<LocationPage> {
  Home home;
  _LocationPageState({this.home});

  Position _currentPosition;
  TextEditingController _latitudeController = new TextEditingController();
  TextEditingController _longtitudeController = new TextEditingController();

  ByteData _img = ByteData(0);
  File _image;
  final picker = ImagePicker();

  Future getImageGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future getImageCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        if (_image != null) {
          _image = File(pickedFile.path);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (home.latitude != null) _latitudeController.text = home.latitude;
    if (home.longitude != null) _longtitudeController.text = home.longitude;

    return SurveyBody.build(
        title: "เพิ่มรูปภาพและพิกัด",
        child: Container(
          margin: EdgeInsets.all(20.0),
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 20.0,
              ),
              Container(
                child: _image == null
                    ? Container(
                        height: 200.0,
                        color: Colors.white,
                      )
                    : LimitedBox(maxHeight: 200.0, child: Image.file(_image)),
              ),
              PillShapedButton(
                title: "Gallery",
                color: Theme.of(context).primaryColor,
                onPressed: () async {
                  getImageGallery();
                },
              ),
              PillShapedButton(
                title: "Camera",
                color: Theme.of(context).primaryColor,
                onPressed: () async {
                  getImageCamera();
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  Expanded(
                      child: TextField(
                    controller: _latitudeController,
                    autofocus: false,
                    readOnly: true,
                    decoration: InputDecoration(
                        labelText: 'Latitude',
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding:
                            EdgeInsets.fromLTRB(14.0, 14.0, 14.0, 14.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0))),
                  )),
                  SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                      child: TextField(
                    controller: _longtitudeController,
                    autofocus: false,
                    readOnly: true,
                    decoration: InputDecoration(
                        labelText: 'Longtitude',
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding:
                            EdgeInsets.fromLTRB(14.0, 14.0, 14.0, 14.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0))),
                  )),
                ],
              ),
              SizedBox(
                height: 24.0,
              ),
              PillShapedButton(
                title: "หาพิกัดปัจจุบัน",
                color: Theme.of(context).primaryColor,
                onPressed: () async {
                  _getCurrentLocation();
                },
              ),
              SizedBox(
                height: 24.0,
              ),
              PillShapedButton(
                title: "ถัดไป",
                color: Theme.of(context).primaryColor,
                onPressed: () async {
                  final app = Provider.of<SurveyApp>(context, listen: false);
                  final repo = app.storage;

                  if (_image != null) {
                    var image = IMG.decodeImage(_image.readAsBytesSync());
                    var thumbnail = IMG.copyResize(image, width: 480);
                    _img = thumbnail.getBytes().buffer.asByteData();
                    if (_img.buffer.lengthInBytes > 0) {
                      home.photoHome = base64.encode(_img.buffer.asUint8List());
                    }
                  }

                  home.latitude = _latitudeController.text;
                  home.longitude = _longtitudeController.text;

                  await repo.addToWaiting(home);
                  Navigator.of(context).pop();
                },
              ),
              SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ));
  }

  _getCurrentLocation() async {
    await checkPermission();
    await requestPermission();

    getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
        _latitudeController.text = _currentPosition.latitude.toString();
        _longtitudeController.text = _currentPosition.longitude.toString();
      });
    }).catchError((e) {
      print(e);
    });
  }
}
