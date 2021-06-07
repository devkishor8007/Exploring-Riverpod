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
  Widget build(BuildContext context, ScopedReader watch) {
    final size = MediaQuery.of(context).size;
    var watchcallChangeAllFont = watch(callChangeAllFont);
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(context),
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
                context.read(
                  hopeRiverpod,
                ),
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
    BuildContext context,
  ) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: Text(
        context.read(appNameRiverpod),
      ),
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
