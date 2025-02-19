import 'package:{{ projectName.snakeCase() }}/app/app_strings.al.dart';
import 'package:{{ projectName.snakeCase() }}/app/app_styles.dart';
import 'package:flutter/material.dart';

import '../generic/generic_refresh_container.dart';
import '../generic/utils/refresh_state.dart';
import 'circular_progress.dart';

class RefreshContainer extends StatelessWidget {
  const RefreshContainer({
    super.key,
    required this.refreshState,
    required this.content,
    required this.onRetry,
    this.progress,
    this.wrapErrorInScaffold = false,
  });

  final RefreshState refreshState;
  final Widget Function() content;
  final VoidCallback onRetry;
  final Widget? progress;
  final bool wrapErrorInScaffold;

  @override
  Widget build(BuildContext context) {
    return GenericRefreshContainer(
      refreshState: refreshState,
      content: content,
      onRetry: onRetry,
      progress: progress ?? _progress(),
      errorBackgroundColor: AppColors.error,
      errorTextColor: AppColors.white,
      errorTitle: Strings.genericErrorTitle.get(),
      defaultErrorMsg: Strings.genericErrorMsg.get(),
      retryLabel: Strings.genericRetry.get(),
      detailedErrorLabel: Strings.details.get(),
      wrapErrorInScaffold: wrapErrorInScaffold,
    );
  }

  Widget _progress() {
    return const Center(child: CircularProgress());
  }
}
