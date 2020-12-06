library frouter;

import 'package:flutter/material.dart';

class FRouter {
  static void router(BuildContext context, String routerUrl) {
    String path = _parsePath(routerUrl);
    Map<String, dynamic> arguments = _parseArguments(routerUrl);
    if (path.isNotEmpty) {
      Navigator.of(context).pushNamed(path, arguments: arguments);
    }
  }

  static Map<String, Object> getRouterParams(BuildContext context) {
    return ModalRoute.of(context).settings.arguments;
  }

  static String _parsePath(String routerUrl) {
    try {
      Uri uri = Uri.parse(routerUrl);
      return uri.path;
    } catch (e) {}
    return "";
  }

  static Map<String, dynamic> _parseArguments(String routerUrl) {
    final Map<String, dynamic> map = {};
    try {
      Uri uri = Uri.parse(routerUrl);
      if (uri.hasQuery) {
        map.addAll(uri.queryParameters);
      }
    } catch (e) {}
    return map;
  }
}
