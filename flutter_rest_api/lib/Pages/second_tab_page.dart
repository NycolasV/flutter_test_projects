import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SecondTabPage extends StatefulWidget {
  @override
  _SecondTabPageState createState() => _SecondTabPageState();
}

class _SecondTabPageState extends State<SecondTabPage> {
  File _image;

  Future getImage() async{
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second page of tab'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Image(
                image: _image == null ? AssetImage('assets/eusouspace.jpg') : FileImage(_image)
            ),

            Container(
              margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
              child: RaisedButton(
                padding: EdgeInsets.all(20),
                color: Colors.black54,
                child: Text(
                  "INSERIR OUTRA IMAGEM",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                onPressed: getImage,
              ),
            )
          ],
        ),
      ),
    );
  }
}
