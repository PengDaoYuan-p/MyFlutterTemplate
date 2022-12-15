import 'package:flutter/material.dart';
import 'package:flutter_project/util/const_value.dart';

class ListCard extends StatelessWidget {
  
  final String title;
  final String subTitle;
  final String urlImage;
  
  const ListCard({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.urlImage
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 10.0, 2.0, 0.0),
      child: SizedBox(
        height: 125,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //----- Left card -----
            Container(
              width: 85,
              height: 120,
              child: AspectRatio(
                  aspectRatio: 3/4,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Material(
                      child: Ink.image(
                        image: NetworkImage(this.urlImage),
                        fit: BoxFit.cover,
                        child: InkWell(
                          onTap: (){//Direct to page
                          },
                        ),
                      ),
                    ),
                  ),
                ),
            ),
            //----- Text description -----
            Container(
              padding: EdgeInsets.fromLTRB(15, 10, 0.0, 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(this.title,style: TextStyle(fontWeight: FontWeight.bold),),
                  SizedBox(height: 5,),
                  Text(this.subTitle, style: TextStyle(fontSize: 12, color: Colors.grey),)
                ],
              ),
            )
          ],
        ),
    ),
    );
  }
}
