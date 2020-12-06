const String codeTemplate = """
import 'package:flutter/material.dart';
{{#imports}}    
import '{{{path}}}';
{{/imports}}

class FRouterRegister {
  static Map<String, WidgetBuilder> _routeMap = Map<String, WidgetBuilder>.from(
     {{{routeMap}}}
  );
  
  static Map<String, WidgetBuilder> register() {
     return _routeMap;
  }
}
""";