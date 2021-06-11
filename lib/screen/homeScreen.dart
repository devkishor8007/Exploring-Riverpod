import 'package:exploring_riverpod/riverpod_/dataService_riverpod.dart';
import 'package:exploring_riverpod/riverpod_/stringText_riverpod.dart';
import 'package:exploring_riverpod/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        final apiServiceImplement = watch(dataServicesRiverpod);
        return Scaffold(
          appBar: makeAppBar(context),
          body: apiServiceImplement.when(
            data: (data) => Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.02,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.read(widgetNameRiverpod),
                    style: buildTextStyle(
                      context,
                      color: Colors.white,
                      size: Theme.of(context).textTheme.headline6.fontSize,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (_, index) {
                        return ListTile(
                          title: Text(
                            data[index].setup,
                            style: buildTextStyle(context, color: Colors.white),
                          ),
                          subtitle: Text(
                            data[index].punchline,
                            style: buildTextStyle(context, color: Colors.white),
                          ),
                          leading: Text(
                            data[index].id.toString() + "\nLikes",
                            style: buildTextStyle(context, color: Colors.white),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            loading: () => Center(child: CircularProgressIndicator()),
            error: (e, s) => SizedBox(),
          ),
        );
      },
    );
  }

  Widget makeAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        context.read(appNameRiverpod),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: true,
    );
  }
}
