import 'package:flutter/material.dart';
import 'package:flutter_project/view/widget/list_card.dart';
import 'package:flutter_project/view/widget/slide_card.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage>
    with SingleTickerProviderStateMixin {
  //For tabs
  static const List<Tab> _myTabs = <Tab>[
    Tab(
      text: "Tab #1",
    ),
    Tab(
      text: "Tab #2",
    ),
  ];
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //Tab initial
    _tabController = TabController(length: _myTabs.length, vsync: this);
    _tabController.addListener(_handleTabSelection);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          tabs: _myTabs,
          controller: _tabController,
          onTap: (index) {},
        ),
        Expanded(
          child: TabBarView(controller: _tabController, children: [
            //Card view
            _cardGridView(context),
            _cardListView()
          ]),
        )
      ],
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabSelection() {
    //print(_tabController.index.toString() + ' by swipe!!');
    //if contain changed by swiped
    if (_tabController.indexIsChanging) {
      print('tab is animating, do nothing');
    } else {
      //do your code once here
      print(_tabController.index.toString() + ' by swipe');
    }
  }
}

Widget _cardGridView(BuildContext context) {
  return RefreshIndicator(
      onRefresh: () async {
        print("refreshed!!");
        return Future.delayed(Duration(seconds: 1));
      },
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Container(
          height: MediaQuery.of(context).size.height -
              0.25 * MediaQuery.of(context).size.height,
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, childAspectRatio: 0.6),
              itemCount: 20,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(10),
                  child: SlideCard(
                      title: "title",
                      subTitle: "subTitle",
                      urlImage:
                          "https://innovating.capital/wp-content/uploads/2021/05/vertical-placeholder-image.jpg"),
                );
              }),
        ),
      ));
}

Widget _cardListView() {
  return RefreshIndicator(
    onRefresh: () async {
      print("refreshed!!");
      return Future.delayed(Duration(seconds: 1));
    },
    child: ListView.builder(
        itemCount: 20,
        itemBuilder: (_, index) {
          return ListCard(
              title: "title",
              subTitle: "subTitle",
              urlImage:
                  "https://innovating.capital/wp-content/uploads/2021/05/vertical-placeholder-image.jpg");
        }),
  );
}
