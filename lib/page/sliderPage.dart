import 'package:exploring_riverpod/slider_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final sliderRiverpod =
    ChangeNotifierProvider<SliderWidget>((ref) => SliderWidget());

class SliderHomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final mq = MediaQuery.of(context).size;
    var sliderImplement = watch(sliderRiverpod);
    return SafeArea(
      child: Scaffold(
        appBar: appBar(context),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: mq.height * 0.01,
              horizontal: mq.width * 0.03,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                makeTextHelp(
                  context,
                  context.read(whatWidgetRivepod),
                  size: Theme.of(context).textTheme.headline6.fontSize,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: mq.width * 0.043,
                    top: mq.height * 0.03,
                  ),
                  child: makeTextHelp(
                    context,
                    "The value is " + sliderImplement.value.toStringAsFixed(2),
                  ),
                ),
                sliderShow(sliderImplement, context),
                SizedBox(
                  height: mq.height * 0.3,
                ),
                makeTextHelp(
                  context,
                  context.read(hopeRiverpod),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget sliderShow(SliderWidget sliderImplement, BuildContext context) {
    return Slider(
      min: 0,
      max: 10,
      value: sliderImplement.value,
      onChanged: (v) {
        context.read(sliderRiverpod).onchanged(v);
      },
    );
  }

  Widget makeTextHelp(BuildContext context, String text1, {double size}) {
    return Text(
      text1,
      style: TextStyle(
        color: Colors.white,
        fontSize: size ?? Theme.of(context).textTheme.bodyText1.fontSize,
      ),
    );
  }

  Widget appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: Text(
        context.read(appNameRiverpod),
        style:
            Theme.of(context).textTheme.headline5.copyWith(color: Colors.white),
      ),
    );
  }
}
