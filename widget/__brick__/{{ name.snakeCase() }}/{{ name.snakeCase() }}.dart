import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';

import '{{ name.snakeCase() }}_cubit.dart';
import '{{ name.snakeCase() }}_state.dart';

class {{ name.pascalCase() }} extends StatefulWidget {
  const {{ name.pascalCase() }}({Key? key, this.controller}) : super(key: key);

  final {{ name.pascalCase() }}Controller? controller;

  @override
  State<{{ name.pascalCase() }}> createState() => _{{ name.pascalCase() }}State();
}

class _{{ name.pascalCase() }}State extends State<{{ name.pascalCase() }}> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<{{ name.pascalCase() }}Cubit>(
      create: (BuildContext context) {
        final {{ name.pascalCase() }}Cubit cubit = {{ name.pascalCase() }}Cubit();
        widget.controller?.setCubit(cubit);
        return cubit;
      },
      child: Builder(
          builder: (BuildContext context) => BlocBuilder<{{ name.pascalCase() }}Cubit, {{ name.pascalCase() }}State>(
          buildWhen: ({{ name.pascalCase() }}State previous, {{ name.pascalCase() }}State current) =>
              previous != current,
          builder: _builder,
        ),
      ),
    );
  }

  Widget _builder(BuildContext context, {{ name.pascalCase() }}State state) {
    _logger.info('rebuild state=$state');
    return Container();
  }

  // ignore: unused_element
  {{ name.pascalCase() }}Cubit _cubit(BuildContext context) => context.read<{{ name.pascalCase() }}Cubit>();
}

class {{ name.pascalCase() }}Controller {
  // ignore: unused_field
  late final {{ name.pascalCase() }}Cubit _cubit;

  void setCubit({{ name.pascalCase() }}Cubit cubit) {
    _cubit = cubit;
  }
}

// ignore: unused_element
final Logger _logger = Logger('{{ name.pascalCase() }}');
