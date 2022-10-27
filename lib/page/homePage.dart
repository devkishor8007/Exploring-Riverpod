import 'package:exploring_riverpod/riverpod/bottomNavigation_Riverpod.dart';
import 'package:exploring_riverpod/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;

    final whatWidgetImpl = ref.read(widgetNameRiverpod);
    final hopeRiverpodText = ref.read(hopeRiverpod);
    final appname = ref.read(appNameRiverpod);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          appname,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.02,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              whatWidgetImpl,
              style: buildTextStyle(context),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Text(
              "Welcome to Home Page",
              style: buildTextStyle(
                context,
                size: Theme.of(context).textTheme.headline6!.fontSize,
              ),
            ),
            SizedBox(
              height: size.height * 0.2,
            ),
            Text(
              hopeRiverpodText,
              style: buildTextStyle(
                context,
                size: Theme.of(context).textTheme.bodyText1!.fontSize,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
