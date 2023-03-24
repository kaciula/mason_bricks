import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';

import 'cubit/{{ name.snakeCase() }}_cubit.dart';
import 'cubit/{{ name.snakeCase() }}_state.dart';

class {{ name.pascalCase() }}Page extends StatefulWidget {
  const {{ name.pascalCase() }}Page({Key? key}) : super(key: key);

  static const String routeName = '{{ name.pascalCase() }}';

  @override
  State<{{ name.pascalCase() }}Page> createState() => _{{ name.pascalCase() }}PageState();
}

class _{{ name.pascalCase() }}PageState extends State<{{ name.pascalCase() }}Page> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<{{ name.pascalCase() }}Cubit, {{ name.pascalCase() }}State>(
        buildWhen: ({{ name.pascalCase() }}State previous, {{ name.pascalCase() }}State current) =>
            previous != current,
        builder: _builder,
    );
  }

  Widget _builder(BuildContext context, {{ name.pascalCase() }}State state) {
    _logger.info('rebuild state=$state');
    return Scaffold(
      body: _body(context, state),
    );
  }

  Widget _body(BuildContext context, {{ name.pascalCase() }}State state) {
    return Container();
  }

  // ignore: unused_element
  {{ name.pascalCase() }}Cubit get _cubit => context.read<{{ name.pascalCase() }}Cubit>();
}

 {{#useArgs}}class {{ name.pascalCase() }}Args { }{{/useArgs}}

// ignore: unused_element
final Logger _logger = Logger('{{ name.pascalCase() }}Page');
