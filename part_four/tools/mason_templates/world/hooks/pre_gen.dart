import 'package:mason/mason.dart';

void run(HookContext context) {
  String className = context.vars["name"];
  // UserDetails => user_details
  final initialParamsFileName = '${className.snakeCase}_initial_params.dart';

  context.vars = {
    ...context.vars,
    "initial_params_file_name": initialParamsFileName,
  };
  // TODO: add pre-generation logic.
}
