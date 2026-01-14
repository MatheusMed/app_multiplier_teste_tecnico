import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';

import '../i_connectivity_service.dart';

class ConnectivityPlusService implements IConnectivityService {
  final Connectivity _connectivity;

  ConnectivityPlusService(this._connectivity);

  @override
  Future<bool> get isConnected async {
    final connectivityResult = await _connectivity.checkConnectivity();

    if (connectivityResult == ConnectivityResult.none) {
      return false;
    }

    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result.first.rawAddress.isNotEmpty;
    } catch (_) {
      return false;
    }
  }
}
