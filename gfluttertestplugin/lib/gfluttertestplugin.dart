
import 'dart:async';

import 'package:flutter/services.dart';

class Gfluttertestplugin {
  static const MethodChannel _channel =
      const MethodChannel('gfluttertestplugin');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
