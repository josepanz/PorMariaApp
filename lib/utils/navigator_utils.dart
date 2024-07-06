import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

Future pushToPage(BuildContext context, Widget widget) async {
  await Navigator.of(context).push(
    MaterialPageRoute(builder: (_) => widget),
  );
}

Future pushAndReplaceToPage(BuildContext context, Widget widget) async {
  await Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (_) => widget),
  );
}

Future popAllAndPush(BuildContext context, Widget widget) async {
  await Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (BuildContext context) => widget),
    ModalRoute.withName('/'),
  );
}

Future popAllAndPushWithRoute(
    BuildContext context, Widget widget, String route) async {
  await Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (BuildContext context) => widget),
    ModalRoute.withName(route),
  );
}

Future popAndPush(BuildContext context, Widget widget) async {
  Navigator.of(context).maybePop();
  await Navigator.of(context).push(
    MaterialPageRoute(builder: (_) => widget),
  );
}

Future popPushAndReplaceToPage(BuildContext context, Widget widget) async {
  Navigator.of(context).maybePop();
  await Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (_) => widget),
  );
}
