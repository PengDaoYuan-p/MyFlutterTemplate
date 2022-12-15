import 'package:flutter/material.dart';

class SlideCard extends StatelessWidget {

  final String title;
  final String subTitle;
  final String urlImage;

  const SlideCard({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.urlImage
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 135,
      child: Column(
        children: [
          Expanded(
            child: AspectRatio(
              aspectRatio: 4/3,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Material(
                  child: Ink.image(
                      image: NetworkImage(this.urlImage),
                      fit: BoxFit.cover,
                      child: InkWell(
                        onTap: (){
                          //Direct to page
                        },
                      ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
            alignment: Alignment.centerLeft,
            child: Text(
              this.title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            alignment: Alignment.centerLeft,
            child: Text(
              this.subTitle,
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey
              ),
            ),
          )
        ],
      ),
    );
  }
}
