import 'package:analyzer/dart/element/element.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:frouter/annotation/router.dart';
import 'package:source_gen/source_gen.dart';

class RouterPathGenerator extends GeneratorForAnnotation<Router> {
  static List<String> mImportList = [];
  static Map<String, String> mRouterMap = {};

  @override
  generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    mImportList = _parseImportList(element, annotation);
    mRouterMap = _parseRouterMap(element, annotation);
  }

  List<String> _parseImportList(Element element, ConstantReader annotation) {
    if (element.location.components.isEmpty) {
      return [];
    }

    String importPath = element.location.components[0];
    if (!mImportList.contains(importPath)) {
      mImportList.add(importPath);
    }
    return mImportList;
  }

  Map<String, String> _parseRouterMap(
      Element element, ConstantReader annotation) {
    String routerKey = "'" + annotation.read("path").stringValue + "'";
    String widgetName = element.name;
    if (!mRouterMap.containsKey(routerKey)) {
      mRouterMap[routerKey] = widgetName;
    }
    return mRouterMap;
  }
}
