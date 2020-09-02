import 'package:flutter/material.dart';
import 'package:qrCodeScanner/constants.dart';
import 'package:qrscan/qrscan.dart' as scanner;

main() {
  runApp(MaterialApp(
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String result;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: buttonDecoration,
                width: MediaQuery.of(context).size.width * 0.9,
                child: FlatButton(
                  onPressed: () async {
                    result = await scanner.scan();
                    setState(() {});
                  },
                  child: Text(
                    "Scan QR Code",
                    style: TextStyle(
                      color: Colors.white,
                      backgroundColor: Colors.purple[200],
                    ),
                  ),
                ),
              ),
              result == null
                  ? Container()
                  : Container(
                      child: Column(
                        children: [
                          Text(
                            "Output of qr code",
                            style: h1black,
                          ),
                          Text(result)
                        ],
                      ),
                    ),
              Container(
                margin: EdgeInsets.all(5),
                decoration: buttonDecoration,
                width: MediaQuery.of(context).size.width * 0.9,
                child: FlatButton(
                  onPressed: () {},
                  child: Text(
                    "Generate QR Code",
                    style: TextStyle(
                        color: Colors.white,
                        backgroundColor: Colors.purple[200]),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
