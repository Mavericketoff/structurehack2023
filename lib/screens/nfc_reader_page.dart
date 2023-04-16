import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:nfc_manager/nfc_manager.dart';

import '../utils/app_colors.dart';



class NfcReader extends StatefulWidget {
  const NfcReader({super.key});

  @override
  State<StatefulWidget> createState() => NfcReaderState();
}

class NfcReaderState extends State<NfcReader> {
  ValueNotifier<dynamic> result = ValueNotifier(null);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('NFC Сканнер', style: TextStyle(color: Colors.black),),
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black),
          backwardsCompatibility: true,
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: FutureBuilder<bool>(
            future: NfcManager.instance.isAvailable(),
            builder: (context, ss) =>
                Flex(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              direction: Axis.vertical,
              children: [
                Flexible(
                  flex: 2,
                  child: Container(
                    //color: Colors.black,
                    margin: const EdgeInsets.all(4),
                    constraints: const BoxConstraints.expand(),
                    decoration: BoxDecoration(border: Border.all(), color: Colors.grey,),
                    child: SingleChildScrollView(
                      child: ValueListenableBuilder<dynamic>(
                        valueListenable: result,
                        builder: (context, value, _) =>
                            Text('${value ?? ''}'),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 3,
                  child: GridView.count(
                    padding: const EdgeInsets.all(4),
                    crossAxisCount: 2,
                    childAspectRatio: 4,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 4,
                    children: [
                      ElevatedButton(
                          style: ButtonStyle(backgroundColor: MaterialStateColor.resolveWith((states) => const Color.fromARGB(255, 96, 238, 83),)),
                          onPressed: _tagRead,
                          child: const Text('Считать тэг', style: TextStyle(color: Colors.black),)),
                      ElevatedButton(
                          style: ButtonStyle(backgroundColor: MaterialStateColor.resolveWith((states) => const Color.fromARGB(255, 96, 238, 83),)),
                          onPressed: _ndefWrite,
                          child: const Text('Записать Ndef', style: TextStyle(color: Colors.black),)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }

  void _tagRead() {
    NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
      result.value = tag.data;
      NfcManager.instance.stopSession();
    });
  }

  void _ndefWrite() {
    NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
      var ndef = Ndef.from(tag);
      if (ndef == null || !ndef.isWritable) {
        result.value = 'Тэг невозможно записать в ndef формат';
        NfcManager.instance.stopSession(errorMessage: result.value);
        return;
      }

      NdefMessage message = NdefMessage([
        NdefRecord.createText('Hello World!'),
        NdefRecord.createUri(Uri.parse('https://flutter.dev')),
        NdefRecord.createMime(
            'text/plain', Uint8List.fromList('Hello'.codeUnits)),
        NdefRecord.createExternal(
            'com.example', 'mytype', Uint8List.fromList('mydata'.codeUnits)),
      ]);

      try {
        await ndef.write(message);
        result.value = 'Удачно записан "Ndef"';
        NfcManager.instance.stopSession();
      } catch (e) {
        result.value = e;
        NfcManager.instance.stopSession(errorMessage: result.value.toString());
        return;
      }
    });
  }

  void _ndefWriteLock() {
    NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
      var ndef = Ndef.from(tag);
      if (ndef == null) {
        result.value = 'Тэг не типа Ndef';
        NfcManager.instance.stopSession(errorMessage: result.value.toString());
        return;
      }

      // try {
      //   await ndef.writeLock();
      //   result.value = 'Success to "Ndef Write Lock"';
      //   NfcManager.instance.stopSession();
      // } catch (e) {
      //   result.value = e;
      //   NfcManager.instance.stopSession(errorMessage: result.value.toString());
      //   return;
      // }
    });
  }
}