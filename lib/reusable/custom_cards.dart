import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePageCard extends StatelessWidget {
  final title
      //imageUrl
      //subtitle,
    //  time
  ;

  const HomePageCard(
      {Key key,
      //this.imageUrl = "assets/images/cardimage.jpg",
      this.title,
      //this.time = "07 May 07:19",
      //this.subtitle = "Microsoft showcased 13 games, with their gameplay trailers, that will come to Xbox Series X with optimisations"
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              height: 203,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: const Color(0xff707070),
                  width: 1,
                ),
                //image: DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.fill),
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(11),
                        color: Colors.black.withOpacity(0.33),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Center(
                        child: Text(
                          title,
                          style: const TextStyle(
                              fontFamily: "Avenger",
                              fontSize: 16,
                              color: Colors.white),
                          maxLines: 3,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                    )
                  ],
                ),
              )),
          const SizedBox(
            height: 10,
          ),
          /*
          Text(time,
              style: const TextStyle(
                  fontFamily: "Times", fontSize: 13, color: Color(0xff8a8989))
          ),
           */
          const SizedBox(
            height: 7,
          ),
          Text(
            title,
            style: const TextStyle(
                fontFamily: "league",
                fontSize: 23,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}

class CategoriesCard extends StatelessWidget {
  final imageUrl, category;

  const CategoriesCard({Key key, this.imageUrl, this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 114,
      width: 149,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
            image: AssetImage(imageUrl),
            colorFilter: const ColorFilter.mode(Colors.black38, BlendMode.overlay),
            fit: BoxFit.cover,
            alignment: Alignment.center),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 0.8, sigmaY: 0.8),
          child: Container(
            alignment: Alignment.center,
            color: Colors.black.withOpacity(.1),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: FittedBox(
                  child: Text(
                category,
                style: const TextStyle(
                  fontFamily: "Avenir",
                  fontSize: 23,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              )),
            ),
          ),
        ),
      ),
    );
  }
}

class SearchCard extends StatelessWidget {
  final imageUrl, title, date;

  const SearchCard(
      {Key key,
      this.imageUrl = "assets/cardimage.jpg",
      this.title = "Watch: Gameplay for the first 13 games optimised for Xbox series X",
      this.date = "07 May 07:19"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 29),
      child: Container(
        height: 106,
        child: Row(
          children: [
            Container(
              height: 105,
              width: 155,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                image: DecorationImage(
                    image: AssetImage(imageUrl), fit: BoxFit.fill),
              ),
            ),
            const SizedBox(
              width: 6,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontFamily: "League",
                    fontSize: 14,
                  ),
                  maxLines: 4,
                ),
                Text(
                  date,
                  style: const TextStyle(
                    fontFamily: "Times",
                    fontSize: 13,
                    color: Color(0xff8a8989),
                  ),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
