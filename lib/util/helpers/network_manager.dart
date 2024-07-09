import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:timbu_mobile_app/util/helpers/my_loader.dart';

class NetworkManager extends GetxController {
  static NetworkManager get instance => Get.find();

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void onInit() {
    super.onInit();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(updateConnectionStatus);
    // Check initial connectivity status
    _checkInitialConnection();
  }

  Future<void> _checkInitialConnection() async {
    final bool status = await isConnected();
    if (!status) {
      MyLoader.warningSnackBar(
          title: "No internet connection",
          message: 'Please connect to an internet service provider');
    }
  }

  Future<void> updateConnectionStatus(ConnectivityResult result) async {
    final bool status = await isConnected();
    if (!status) {
      MyLoader.warningSnackBar(
          title: "No internet connection",
          message: 'Please connect to an internet service provider');
    }
  }

  Future<bool> isConnected() async {
    try {
      final result = await _connectivity.checkConnectivity();
      if (result == ConnectivityResult.none) {
        return false;
      } else {
        return true;
      }
    } on PlatformException catch (_) {
      return false;
    }
  }

  @override
  void onClose() {
    super.onClose();
    _connectivitySubscription.cancel();
  }
}
