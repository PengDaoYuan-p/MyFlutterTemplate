import 'package:flutter_project/util/const_value.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_project/view/widget/slide_card.dart';

class FrontPage extends StatefulWidget {
  const FrontPage({Key? key}) : super(key: key);

  @override
  State<FrontPage> createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {
  //For image slider
  int _currentSliderIndex = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            height: defaultSpace,
          ),
          //------------- Image slider -------------
          CarouselSlider(
            items: imageSliders,
            carouselController: _controller,
            options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 2.0,
                onPageChanged: (index, reason) {
                  setState(() => _currentSliderIndex = index);
                }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imgList.asMap().entries.map((e) {
              return GestureDetector(
                onTap: () => _controller.animateToPage(e.key),
                child: Container(
                  width: 12.0,
                  height: 12.0,
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black)
                          .withOpacity(
                              _currentSliderIndex == e.key ? 0.9 : 0.4)),
                ),
              );
            }).toList(),
          ),
          Container(
            height: defaultSpace * 1.2,
          ),
          //------------- Card slider -------------
          Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Category #1",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text("More..."),
                        style: TextButton.styleFrom(
                            alignment: Alignment.bottomCenter,
                            textStyle: const TextStyle(color: Colors.blue)),
                      ),
                    ],
                  ),
                  Container(
                    height: 5,
                  ),
                  //SingleChildScrollView is for small amount widgets , but can dynamic height
                  //Listview is for big amount widgets , but can not dynamic height
                  Container(
                    height: 220,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      separatorBuilder: (context, _) => SizedBox(
                        width: 12,
                      ),
                      itemBuilder: (context, index) => SlideCard(
                        title: 'Title',
                        subTitle: 'SubTitle',
                        urlImage:
                            'https://innovating.capital/wp-content/uploads/2021/05/vertical-placeholder-image.jpg',
                      ),
                    ),
                  )
                ],
              )),
          Container(
            height: defaultSpace * 1.2,
          ),
          //------------- Card slider -------------
          Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Category #2",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text("More..."),
                        style: TextButton.styleFrom(
                            alignment: Alignment.bottomCenter,
                            textStyle: const TextStyle(color: Colors.blue)),
                      ),
                    ],
                  ),
                  Container(
                    height: 5,
                  ),
                  //SingleChildScrollView is for small amount widgets , but can dynamic height
                  //Listview is for big amount widgets , but can not dynamic height
                  Container(
                    height: 220,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      separatorBuilder: (context, _) => SizedBox(
                        width: 12,
                      ),
                      itemBuilder: (context, index) => SlideCard(
                        title: 'Title',
                        subTitle: 'SubTitle',
                        urlImage:
                            'https://innovating.capital/wp-content/uploads/2021/05/vertical-placeholder-image.jpg',
                      ),
                    ),
                  )
                ],
              )),
          Container(
            height: defaultSpace * 1.2,
          ),
        ],
      ),
    );
  }
}

//Image Sliders - TEST
final List<String> imgList = [
  'https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png',
  'https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png',
  'https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png',
  'https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png',
  'https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png',
  'https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png'
];

final List<Widget> imageSliders = imgList
    .map(
      (item) => Container(
        margin: EdgeInsets.all(5.0),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          child: Image.network(item, fit: BoxFit.cover, width: 1000.0),
        ),
      ),
    )
    .toList();

//Card Slider - Test
