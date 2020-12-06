import 'package:analyzer/dart/element/element.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:frouter/annotation/router_register.dart';
import 'package:frouter/template/router_template.dart';
import 'package:mustache4dart/mustache4dart.dart';
import 'package:source_gen/source_gen.dart';

import 'generator_path.dart';

class RouterGenerator extends GeneratorForAnnotation<RouterRegister> {
  @override
  generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    return render(codeTemplate, <String, dynamic>{
      'imports': RouterPathGenerator.mImportList
          .map((item) => {'path': item})
          .toList(),
      'routeMap': RouterPathGenerator.mRouterMap
          .map((key, widgetName) => MapEntry(key, "(context) => $widgetName()"))
          .toString()
    });
  }
}
