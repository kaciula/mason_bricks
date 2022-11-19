import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';

import '{{ name.snakeCase() }}_state.dart';

class {{ name.pascalCase() }}Cubit extends Cubit<{{ name.pascalCase() }}State> {
  {{ name.pascalCase() }}Cubit() : super({{ name.pascalCase() }}State.initial());

}

// ignore: unused_element
final Logger _logger = Logger('{{ name.pascalCase() }}Cubit');