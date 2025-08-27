//
// import 'dart:async';
//
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';
//
// import 'loader.dart';
//
// class NetworkManager extends GetxController {
//   static NetworkManager get instance => Get.find();
//   final Connectivity _connectivity = Connectivity();
//   late StreamSubscription<ConnectivityResult> _connectivitySubscription;
//   final Rx<ConnectivityResult> _connectionStatus = ConnectivityResult.none.obs;
//
//   /// Initialize the network manager and set up a stream to continually check the connection status.
//   @override
//    void onInit() {
//     super.onInit();
//     //_connectivitySubscription = _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
//   }
//
//
//   /// Update the connection status based on changes in connectivity and show a relevant popup for no internet connection.
//   Future<void> _updateConnectionStatus(ConnectivityResult result) async {
//     _connectionStatus.value = result;
//     if (_connectionStatus.value == ConnectivityResult.none) {
//       TLoaders.warningSnackBar(title: 'No Internet Connection');
//     }
//   }
//
//   Future<bool> isConnected() async {
//     try {
//       final result = await _connectivity.checkConnectivity();
//       if (result == ConnectivityResult.none) {
//         return false;
//       } else {
//         return true;
//       }
//     } on PlatformException catch (_) {
//       return false;
//     }
//   }
//
// }



