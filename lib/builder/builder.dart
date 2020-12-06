import 'package:build/src/builder/builder.dart';
import 'package:frouter/generator/generator_path.dart';
import 'package:frouter/generator/generator_router.dart';
import 'package:source_gen/source_gen.dart';

/// Does not generate files here
/// 这里并不生成文件
Builder pathBuilder(BuilderOptions options) =>
    LibraryBuilder(RouterPathGenerator(), generatedExtension: ".empty.dart");


/// 生成".g.dart"结尾的文件
/// Generate a file ending with ".g.dart"
Builder routerBuilder(BuilderOptions options) =>
    LibraryBuilder(RouterGenerator(), generatedExtension: ".router_register.g.dart");