import 'package:amax_wallet/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class RefresherHeaderWidget extends StatelessWidget {
  const RefresherHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const ClassicHeader(
      failedText: 'refresh_error',
      completeText: 'refresh_success',
      releaseText: 'refresh_release_hint',
      idleText: 'refresh_drop_down',
      failedIcon: Icon(Icons.clear, color: notSelectedText),
      completeIcon: Icon(Icons.done, color: notSelectedText),
      idleIcon: Icon(Icons.arrow_downward, color: notSelectedText),
      releaseIcon: Icon(Icons.arrow_upward, color: notSelectedText),
      refreshingText: 'refreshing',
      refreshingIcon: SizedBox(
        height: 16,
        width: 16,
        child: CircularProgressIndicator(
          color: primaryBlue,
          strokeWidth: 4,
        ),
      ),
      textStyle: TextStyle(
        color: notSelectedText,
        fontSize: 16,
      ),
      // refreshingIcon: ,
    );
  }
}
