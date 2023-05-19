import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

widgetsAppbar(BuildContext context, Object? extra, {List<Widget>? actions}) => AppBar(
    leading: Center(
        child: TextButton.icon(
            onPressed: () => context.goNamed('/', extra: extra),
            icon: const Icon(
              Icons.home_rounded,
              color: Colors.white,
            ),
            label: const Text("Pdouvch", style: TextStyle(color: Colors.white)))),
    leadingWidth: 150,
    automaticallyImplyLeading: false,
    actions: actions);
