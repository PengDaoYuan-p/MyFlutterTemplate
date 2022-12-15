import 'package:flutter/material.dart';
import 'package:flutter_project/view/widget/slide_card.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage>
    with SingleTickerProviderStateMixin {

  //For tabs
  static const List<Tab> _myTabs = <Tab>[
    Tab(
      text: "Tab #1",
    ),
    Tab(
      text: "Tab #2",
    ),
    Tab(
      text: "Tab #3",
    )
  ];
  late TabController _tabController;

  //For chips
  static const List<String> _myTags = <String>[
    'Tag#1',
    'Tag#2',
    'Tag#3',
    'Tag#4',
    'Tag#5',
    'Tag#6',
    'Tag#7',
    'Tag#8',
    'Tag#9',
    'Tag#10',
  ];
  List<String> _selectedTag = <String>[];

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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //Tab bar
        TabBar(
          tabs: _myTabs,
          controller: _tabController,
          isScrollable: true,
        ),
        Container(
          height: 5,
        ),
        //Tags slider
        Container(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: _myTags
                  .map((e) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: FilterChip(
                          label: Text(e),
                          selected: _selectedTag.contains(e),
                          selectedColor: Colors.blue,
                          onSelected: (bool val) {
                            setState(() {
                              if (val)
                                _selectedTag.add(e);
                              else
                                _selectedTag.remove(e);
                            });
                          },
                        ),
                      ))
                  .toList(),
            ),
          ),
        ),
        Container(
          height: 5,
        ),
        //Grid card view
       Expanded(
          child: RefreshIndicator(
              onRefresh: () async {
                print("refreshed!!");
                return Future.delayed(Duration(seconds: 1));
              },
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Container(
                  height: MediaQuery.of(context).size.height-0.3*MediaQuery.of(context).size.height,
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio:0.6
                      ),
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
              )
          ),
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
    if (_tabController.indexIsChanging) {
      switch (_tabController.index) {
        case 0:
          print("Tab #1 tapped");
          break;
        case 1:
          print("Tab #2 tapped");
          break;
        case 2:
          print("Tab #3 tapped");
          break;
      }
    }
  }
}
