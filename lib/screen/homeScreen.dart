import 'package:exploring_riverpod/model/data.dart';
import 'package:exploring_riverpod/riverpod_/menu.riverpod.dart';
import 'package:exploring_riverpod/riverpod_/showData.riverpod.dart';
import 'package:exploring_riverpod/riverpod_/stringText_riverpod.dart';
import 'package:exploring_riverpod/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final whatWidgetImpl = ref.watch(widgetNameRiverpod);
    final appname = ref.watch(appNameRiverpod);
    final menuIndex = ref.watch(miniMartMenuProvider);

    final miniItem = ref.watch(miniMartProvider);
    return Scaffold(
      appBar: makeAppBar(appname, context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            whatWidgetImpl,
          ),
          Expanded(
              flex: 80,
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                    itemCount: ref.read(miniMartProvider).length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              width: 2,
                              color: Colors.green,
                            ),
                          ),
                          height: MediaQuery.of(context).size.height * 0.48,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                imageContainer(miniItem, index, context),
                                SizedBox(
                                  height: 2,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      miniItem[index].title.toString(),
                                    ),
                                    Text("\$" +
                                        miniItem[index].price.toString()),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  miniItem[index].des.toString(),
                                  style: buildTextStyle(
                                    context,
                                    color: Colors.grey,
                                    size: 15,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                // can do increase, decrease the item
                                itemFunction(ref, index, miniItem),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              )),
          Expanded(
            flex: 10,
            child: customBottomNavBar(ref, menuIndex),
          ),
        ],
      ),
    );
  }

  Row customBottomNavBar(WidgetRef ref, MiniMartMenu menuIndex) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          onPressed: () {
            ref.read(miniMartMenuProvider.notifier).state = MiniMartMenu.home;
          },
          icon: Icon(
            Icons.home,
            color: menuIndex == MiniMartMenu.home
                ? Colors.indigoAccent
                : Colors.black,
          ),
        ),
        IconButton(
          onPressed: () {
            ref.read(miniMartMenuProvider.notifier).state =
                MiniMartMenu.favourite;
          },
          icon: Icon(
            Icons.favorite,
            color: menuIndex == MiniMartMenu.favourite
                ? Colors.indigoAccent
                : Colors.black,
          ),
        ),
        IconButton(
          onPressed: () {
            ref.read(miniMartMenuProvider.notifier).state = MiniMartMenu.cart;
          },
          icon: Icon(
            Icons.shopping_bag,
            color: menuIndex == MiniMartMenu.cart
                ? Colors.indigoAccent
                : Colors.black,
          ),
        ),
        IconButton(
          onPressed: () {
            ref.read(miniMartMenuProvider.notifier).state =
                MiniMartMenu.profile;
          },
          icon: Icon(
            Icons.people,
            color: menuIndex == MiniMartMenu.profile
                ? Colors.indigoAccent
                : Colors.black,
          ),
        ),
      ],
    );
  }

  Row itemFunction(WidgetRef ref, int index, List<MiniMartData> miniItem) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () => ref.read(miniMartProvider.notifier).subtractItem(index),
          child: CircleAvatar(
            backgroundColor: Colors.grey[200],
            foregroundColor: Colors.black,
            child: const Icon(Icons.remove),
          ),
        ),
        Text(miniItem[index].count.toString()),
        GestureDetector(
          onTap: () {
            ref.read(miniMartProvider.notifier).addItem(index);
          },
          child: CircleAvatar(
            backgroundColor: Colors.grey[200],
            foregroundColor: Colors.black,
            child: const Icon(Icons.add),
          ),
        ),
      ],
    );
  }

  Container imageContainer(
      List<MiniMartData> miniItem, int index, BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: NetworkImage(
            miniItem[index].img.toString(),
          ),
          fit: BoxFit.cover,
        ),
      ),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.3,
    );
  }

  AppBar makeAppBar(String appname, BuildContext context) {
    return AppBar(
      title: Text(
        appname,
        style: buildTextStyle(
          context,
          color: Colors.black,
        ),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: true,
    );
  }
}
