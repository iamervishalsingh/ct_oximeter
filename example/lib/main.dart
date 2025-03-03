//
//
// import 'package:flutter/material.dart';
// import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
// import 'dart:async';
// import 'package:permission_handler/permission_handler.dart';
//
// import 'location_service.dart';
//
//
// void main() {
//   runApp(const MyApp());
// }
//
//
//
// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   bool isScanning = false;
//   bool isConnected = false;
//
//   FlutterOximeter oxi=FlutterOximeter();
//
//   @override
//   void initState() {
//     super.initState();
//     initPlatformState();
//
//
//   }
//
//   // Platform messages are asynchronous, so we initialize in an async method.
//   Future<void> initPlatformState() async {
//     oxi.getScanningStateStream.listen((event) {
//
//       print('My Scanning State '+ event.toString());
//
//       isScanning=event;
//       setState(() {
//
//       });
//     });
//
//
//     oxi.getConnectionStateStream.listen((event) {
//       isConnected=event;
//       setState(() {
//
//       });
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Plugin example app'),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//
//               Text(isConnected? 'Connected': 'Disconnected',
//                 style: TextStyle(
//                   color: isConnected? Colors.green:Colors.red,
//
//                 ),),
//
//
//               StreamBuilder<DeviceData>(
//                   stream: oxi.deviecFoundStream,
//                   builder: (context, snapshot) {
//                     return snapshot.data==null?
//                     const Text('No Device Found')
//                         :Column(
//                       children: [
//                         Text((snapshot.data!.deviceName??'0').toString()),
//                         Text((snapshot.data!.macAddress??'0').toString()),
//                         TextButton(onPressed: (){
//                           oxi.connect(macAddress: snapshot.data!.macAddress??'', deviceName: snapshot.data!.deviceName??'');
//                         }, child: const Text('Connect')),
//
//
//                         TextButton(onPressed: (){
//                           oxi.disConnect(
//                               macAddress: snapshot.data!.macAddress??''
//                           );
//                         }, child: const Text('DisConnect'))
//
//                       ],
//                     );
//                   }
//               ),
//               const SizedBox(height: 10,),
//               StreamBuilder<OximeterData>(
//                   stream: oxi.detectedDataStream,
//                   builder: (context, snapshot) {
//                     return snapshot.data==null?
//                     const Text('NO Data Yet')
//                         :Column(
//                       children: [
//                         Text((snapshot.data!.spo2??'0').toString()),
//                         Text((snapshot.data!.heartRate??'0').toString()),
//                         Text((snapshot.data!.hrv??'0').toString()),
//                         Text((snapshot.data!.perfusionIndex!.toStringAsFixed(2))),
//
//
//                       ],
//                     );
//                   }
//               ),
//               isScanning?
//               const CircularProgressIndicator()
//                   :TextButton(
//                 onPressed: () async{
//                   startScan();
//
//                 },
//                 child: const Text('Start Scan'),
//               ),
//
//               // TextButton(
//               //   onPressed: () async{
//               //
//               //     oxi.connect(macAddress: 'FA:B6:4B:25:15:38',deviceName: 'djjd');
//               //   },
//               //   child: Text('Connect'),
//               // ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//
//
//   void startScan() async{
//
//     // bool locationEnable=await LocationService().enableGPS();
//     await FlutterBluetoothSerial.instance.requestEnable();
//     await Permission.location.request();
//
//     // if(locationEnable){
//       bool bluetoothEnable=(await FlutterBluetoothSerial.instance.isEnabled)??false;
//
//       if(bluetoothEnable){
//         if(await Permission.location.isGranted){
//           oxi.startScanDevice();
//         }
//         else{
//           alertToast(context, 'Location Permission is required to use this feature');
//         }
//
//       }
//       else{
//         alertToast(context, 'Please enable bluetooth to use this feature');
//       }
//
//     // }
//     // else{
//     //   alertToast(context, 'Please enable location to use this feature');
//     // }
//   }
//
// }
//
//
//
//
//
//
