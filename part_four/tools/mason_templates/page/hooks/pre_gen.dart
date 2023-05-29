import 'package:mason/mason.dart';

void run(HookContext context) {
  // UserDetails
  var stem = (context.vars["name"] as String? ?? "").trim().pascalCase;
  var pageName = "${stem}Page";
  final pageFileName = "${pageName.snakeCase}.dart";
  final navigatorFileName = "${stem.snakeCase}_navigator.dart";
  final cubitFileName = "${stem.snakeCase}_cubit.dart";
  final stateFileName = "${stem.snakeCase}_state.dart";
  final initialParamsFileName = "${stem.snakeCase}_initial_params.dart";

  context.vars = {
    ...context.vars,
    "page_file_name": pageFileName,
    "class_name": stem,
    "navigator_file_name": navigatorFileName,
    "initial_params_file_name": initialParamsFileName,
    "state_file_name": stateFileName,
    "cubit_file_name": cubitFileName,
  };
}
