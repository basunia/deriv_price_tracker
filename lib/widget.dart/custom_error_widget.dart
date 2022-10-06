import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget(
      {super.key,
      required this.onRefresh,
      required this.title,
      required this.subTitle,
      required this.actionText});

  final void Function() onRefresh;
  final String title;
  final String subTitle;
  final String actionText;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 48.0,
        ),
        const Text('🙈', style: TextStyle(fontSize: 48)),
        Center(
          child: Text(
            title,
            style: theme.textTheme.titleMedium,
          ),
        ),
        const SizedBox(
          height: 14.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              subTitle,
              style: theme.textTheme.caption,
            ),
          ],
        ),
        const SizedBox(
          height: 18.0,
        ),
        OutlinedButton(
            onPressed: onRefresh,
            child: Text(
              actionText,
              style: theme.textTheme.labelLarge,
            )),
      ],
    );
  }
}
