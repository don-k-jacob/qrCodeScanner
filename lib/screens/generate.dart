import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart';
import 'package:qrCodeScanner/constants.dart';

class GeneratePage extends StatefulWidget {
  @override
  _GeneratePageState createState() => _GeneratePageState();
}

class _GeneratePageState extends State<GeneratePage> {
  Uint8List result;
  TextEditingController codeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.all(5),
                  width: size.width * 0.9,
                  child: TextField(
                    controller: codeController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      hintText: "Please enter something . . .",
                      hintStyle: textHintStyle,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  width: size.width * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.purple[200],
                  ),
                  child: FlatButton(
                    onPressed: () async {
                      result = await generateBarCode(codeController.text);
                      print(result.toString());
                      setState(() {});
                    },
                    child: Text("Generate QR code"),
                  ),
                ),
                result == null
                    ? Container(
                        margin: EdgeInsets.all(5),
                        width: size.width * 0.8,
                        height: size.height * 0.5,
                        child: Center(
                          child: Text("Waiting for qr code . . ."),
                        ),
                      )
                    : Container(
                        margin: EdgeInsets.all(5),
                        width: size.width * 0.8,
                        height: size.height * 0.5,
                        child: Center(
                          child: Image.memory(result),
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
