import 'package:exploring_riverpod/main.dart';
import 'package:exploring_riverpod/riverpod_apply.dart';
import 'package:exploring_riverpod/route.dart';
import 'package:exploring_riverpod/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ignore: must_be_immutable
class DataScreen extends ConsumerWidget {
  String text = lorem(paragraphs: 8, words: 800);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final size = MediaQuery.of(context).size;
    final watchDatadarkThemeRiverpod = watch(darkThemeRiverpod);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
              icon: Icon(
                Icons.navigate_before,
                size: Theme.of(context).textTheme.headline4.fontSize,
                color: watchDatadarkThemeRiverpod.state
                    ? Colors.transparent
                    : Colors.black,
              ),
              onPressed: () {
                pop(context);
              }),
          backgroundColor: watchDatadarkThemeRiverpod.state
              ? Colors.black
              : Colors.transparent,
          elevation: 0,
          title: Text(
            context.read(appNameRiverpod),
            style: buildTextStyle(
              context,
              color: watchDatadarkThemeRiverpod.state
                  ? Colors.white
                  : Colors.black,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
          child: ListView(
            children: [
              Text(text),
            ],
          ),
        ),
      ),
    );
  }
}
