import 'package:exploring_riverpod/Screens/settingScreen.dart';
import 'package:exploring_riverpod/riverpod_apply.dart';
import 'package:exploring_riverpod/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ignore: must_be_immutable
class TextSizeChangerScreen extends ConsumerWidget {
  String text = lorem(paragraphs: 2, words: 40);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    var watchcallChangeAllFont = ref.watch(callChangeAllFont);

    final appname = ref.read(appNameRiverpod);
    final hopeRiverpodText = ref.read(hopeRiverpod);
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(appname, context),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
          child: ListView(
            children: [
              Text(
                text,
                style: TextStyle(
                  fontSize: watchcallChangeAllFont.fontSize,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: size.height * 0.3,
              ),
              Text(
                hopeRiverpodText,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildAppBar(
    String appName,
    BuildContext context,
  ) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: Text(appName),
      actions: [
        IconButton(
            icon: Icon(
              Icons.settings,
            ),
            onPressed: () {
              push(
                context,
                SettingScreen(),
              );
            }),
      ],
    );
  }
}
