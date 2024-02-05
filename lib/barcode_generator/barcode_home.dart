import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class BarcodeGeneratorHome extends StatefulWidget {
  const BarcodeGeneratorHome({super.key});

  @override
  State<BarcodeGeneratorHome> createState() => _BarcodeGeneratorHomeState();
}

class _BarcodeGeneratorHomeState extends State<BarcodeGeneratorHome> {
 String _barcodeScanResult='';
  void scanBarcodeNormal() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "cancel", true, ScanMode.BARCODE);
    } on PlatformException {
      barcodeScanRes = "Failed to get platform version";
    }
    setState(() {
      _barcodeScanResult = barcodeScanRes;
    });
  }

  void scnQR() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "cancel", true, ScanMode.QR);
    } on PlatformException {
      barcodeScanRes = "Failed to get platform version";
    }
    setState(() {
      _barcodeScanResult = barcodeScanRes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text("Scan barcode"),
      ),
      body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Generated barcode"),
              Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(21),
                          bottomLeft: Radius.circular(21))),
                  margin: EdgeInsets.only(left: 15, right: 15),
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: BarcodeWidget(  barcode: Barcode.code128(),
                        data: 'https://dbestech.com',
                        drawText: false,
                        color: Colors.black,
                        width: double.infinity,
                        height: 70,),
                    ),
                  )),
              ElevatedButton(
                  onPressed: () {
                    scanBarcodeNormal();
                  },
                  child: Text("Scan Barcode")),
              ElevatedButton(
                  onPressed: () {
                    scanBarcodeNormal();
                  },
                  child: Text("Scan QR")),
              Text("Scanned Result : ${_barcodeScanResult}"),
            ],
          )),
    );
  }
}
