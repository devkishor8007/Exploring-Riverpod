import 'package:exploring_riverpod/Screens/data.dart';
import 'package:exploring_riverpod/Screens/settingScreen.dart';
import 'package:exploring_riverpod/riverpod_apply.dart';
import 'package:exploring_riverpod/route.dart';
import 'package:exploring_riverpod/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer(
      builder: (context, ref, _) {
        final watchingHomedarkThemeRiverpod = ref.watch(darkThemeRiverpod);

        final appname = ref.read(appNameRiverpod);
        final hopeRiverpodText = ref.read(hopeRiverpod);
        return Scaffold(
          floatingActionButton: viewBox(size, context),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(
              appname,
              style: buildTextStyle(
                context,
                color:
                    watchingHomedarkThemeRiverpod ? Colors.white : Colors.black,
              ),
            ),
            actions: [
              IconButton(
                  icon: Icon(
                    Icons.settings,
                    color: watchingHomedarkThemeRiverpod
                        ? Colors.white
                        : Colors.black,
                  ),
                  onPressed: () {
                    push(context, SettingScreen());
                  }),
            ],
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.02,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    appname,
                    style: buildTextStyle(
                      context,
                      size: Theme.of(context).textTheme.headline6.fontSize,
                      color: watchingHomedarkThemeRiverpod
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  image(
                    size,
                    imageUrl:
                        'https://images.unsplash.com/photo-1495287924875-c158d2e8aafc?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80',
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  image(
                    size,
                    imageUrl:
                        'https://images.unsplash.com/photo-1622405632591-9cb4a647f189?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80',
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Text(
                    hopeRiverpodText,
                  ),
                  SizedBox(
                    height: size.height * 0.1,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget viewBox(Size size, BuildContext context) {
    return Container(
      color: Colors.red,
      width: size.width * 0.7,
      height: size.height * 0.04,
      alignment: Alignment.center,
      child: TextButton(
        child: Text(
          'View Detail Screen',
          style: buildTextStyle(
            context,
            size: 17,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () {
          push(context, DataScreen());
        },
      ),
    );
  }

  Widget image(Size size, {String imageUrl}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: CachedNetworkImage(
        width: size.width,
        height: size.height * 0.34,
        imageUrl: imageUrl ?? "",
        fit: BoxFit.cover,
        placeholder: (context, url) => Text(''),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    );
  }
}
