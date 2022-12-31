import 'dart:io';
import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  await _runBuildRunner(context);
  await _formatFlutterProject(context);
}

Future<void> _runBuildRunner(final HookContext context) async {
  final codeGen = context.logger.progress('Running build_runner ...');
  await Process.run(
    'flutter',
    ['pub', 'run', 'build_runner', 'build', '--delete-conflicting-outputs'],
    runInShell: true,
  );
  codeGen.complete();
}

Future<void> _formatFlutterProject(final HookContext context) async {
  final logger = context.logger;
  final directory = Directory.current;

  logger.info('Formatting project ...');

  await Process.run(
    'flutter',
    ['format', directory.path],
  );
}
