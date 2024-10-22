import 'dart:io';
import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  await _runFlutterPubCommands(context);
  final bool useFirebase = context.vars['useFirebase'];
  if (useFirebase) {
    await _configureFirebase(context);
  }
  await _formatProject(context);
  await _runGit(context);
}

Future<void> _runFlutterPubCommands(final HookContext context) async {
  var progress = context.logger.progress('Run flutter pub get');
  var result = await Process.run(
    'flutter',
    ['pub', 'get'],
    workingDirectory: _projectDirectory(context),
    runInShell: true,
  );
  stdout.write(result.stdout);
  stderr.write(result.stderr);
  progress.complete();

  progress = context.logger.progress(
      'Run flutter pub run build_runner build --delete-conflicting-outputs');
  result = await Process.run(
    'flutter',
    ['pub', 'run', 'build_runner', 'build', '--delete-conflicting-outputs'],
    workingDirectory: _projectDirectory(context),
    runInShell: true,
  );
  stdout.write(result.stdout);
  stderr.write(result.stderr);
  progress.complete();
}

Future<void> _configureFirebase(final HookContext context) async {
  var progress =
      context.logger.progress('Run dart pub global activate flutterfire_cli');
  var result = await Process.run(
    'dart',
    ['pub', 'global', 'activate', 'flutterfire_cli'],
    workingDirectory: _projectDirectory(context),
    runInShell: true,
  );
  stdout.write(result.stdout);
  stderr.write(result.stderr);
  progress.complete();

  context.logger.info(
      'Remember to run flutterfire configure and move the generated firebase_options.dart in services/custom/firebase');
}

Future<void> _formatProject(final HookContext context) async {
  final progress = context.logger.progress('Format project');
  var result = await Process.run(
    'dart',
    ['format', _projectDirectory(context)],
    workingDirectory: _projectDirectory(context),
  );
  stdout.write(result.stdout);
  stderr.write(result.stderr);
  progress.complete();
}

Future<void> _runGit(final HookContext context) async {
  final progress = context.logger.progress('Set up git');
  var result = await Process.run(
    'git',
    ['-C', _projectDirectory(context), 'init'],
    workingDirectory: _projectDirectory(context),
  );
  stdout.write(result.stdout);
  stderr.write(result.stderr);

  result = await Process.run(
    'git',
    ['-C', _projectDirectory(context), 'add', '.'],
    workingDirectory: _projectDirectory(context),
  );
  stdout.write(result.stdout);
  stderr.write(result.stderr);

  result = await Process.run(
    'git',
    [
      '-C',
      _projectDirectory(context),
      'commit',
      '-a',
      '-m',
      '"Initial commit"'
    ],
    workingDirectory: _projectDirectory(context),
  );
  stdout.write(result.stdout);
  stderr.write(result.stderr);

  progress.complete();
}

String _projectDirectory(final HookContext context) {
  final String projectName =
      context.vars['projectName'].toString().toLowerCase();
  return Directory.current.path + '/' + projectName;
}
