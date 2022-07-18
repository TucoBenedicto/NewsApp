import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ten_news/model/categories_model.dart';
import 'package:ten_news/reusable/custom_cards.dart';
import 'package:ten_news/utils.dart';

import 'dart:developer' as developer;
/*


class HomePage extends StatefulWidget {
  final Map<String, List> newsData ;

  const HomePage({Key? key, required this.newsData}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late ScrollController _scrollController;
  late TabController _tabController;
  int currentIndex = 0;

  _smoothScrollToTop() {
    _scrollController.animateTo(0,
        duration: const Duration(microseconds: 300), curve: Curves.ease);
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _tabController = TabController(
        length: categories.length,
        vsync:
            this); //this en reference a "with SingleTickerProviderStateMixin"
    _tabController.addListener(_smoothScrollToTop);
  }

  changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      controller: _scrollController,
      headerSliverBuilder: (context, value) {
        return [
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.fromLTRB(25, 10, 25, 25),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Top News Updates",
                  style: TextStyle(
                    fontFamily: "Times",
                    fontSize: 34,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.only(left: 25),
              alignment: Alignment.centerLeft,
              child: TabBar(
                  labelPadding: const EdgeInsets.only(right: 15),
                  indicatorSize: TabBarIndicatorSize.label,
                  controller: _tabController,
                  isScrollable: true,
                  indicator: const UnderlineTabIndicator(),
                  labelColor: Colors.black,
                  labelStyle: const TextStyle(
                      fontFamily: "Avenir",
                      fontSize: 19,
                      fontWeight: FontWeight.bold),
                  unselectedLabelColor: Colors.black45,
                  unselectedLabelStyle: const TextStyle(
                      fontFamily: "Avenir",
                      fontSize: 18,
                      fontWeight: FontWeight.normal),
                  tabs: List.generate(categories.length,
                      (index) => Text(categories[index].name))),
            ),
          ),
        ];
      },
      body: Container(
        child: TabBarView(
          controller: _tabController,
          children: List.generate(categories.length, (index) {
            var key = categories[index].imageUrl.toString().split('/')[3].split('.')[0].replaceAll("_", "-");
            return ListView.builder(
              itemCount: 10,
              itemBuilder: (context, i) {
                String time = widget.newsData[key]![i]['pubData']['__cdata'];
                DateTime timeIst = DateTime.parse(time.split(' ')[3] + "-" + getMonthNumberFromName(month: time.split(' ')[4]) + "-" + time.split(" ")[1] + " " + time.split(" ")[4]);
                timeIst = timeIst.add(Duration(hours: 5)).add(Duration(minutes: 30));
                return HomePageCard(
                  title: widget.newsData[key]![i]['title']['__cdata'],
                  subtitle: widget.newsData[key]![i]['description']['__cdata'],
                  imageUrl: widget.newsData[key]![i][r'media$content']['url'],
                  time: timeIst.day.toString() + " " + getMonthNumberInWords(month: timeIst.month ) + " " + timeIst.toString().split(" ")[1].substring(0,5),
                );
              },
              padding: const EdgeInsets.symmetric(horizontal: 25),
            );
          }),
        ),
      ),
    );
  }
}

 */

class HomePage extends StatefulWidget {
  final Map<String, List> newsData;

  const HomePage({Key key, this.newsData}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  ScrollController _scrollController;
  TabController _tabController;
  int currentIndex = 0;

  /* Collection literal
   https://dart.dev/tools/linter-rules#prefer_collection_literals
   on creer une map vide pour la variable "_newsdata" on parle de "collection literal"  , 2 methodes possibles .
   Map<String, List> newsData = Map<String, List>(); //mauvaise maniere
   ou var newsData = Map<String, List>(); //Bonne maniere
   */
  Map<String, List> _newsData = <String, List>{}; //Bonne maniere
/*
A collection literal is a syntactic expression form that evaluates to an
aggregate type, such as an array, List, or Map. Many languages support
collection literals. A List literal in Java might look like:
List<Integer> list = #[ 1, 2, 3 ];
https://openjdk.org/jeps/186#:~:text=A%20collection%20literal%20is%20a,Many%20languages%20support%20collection%20literals.
 */

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController();
    _tabController = TabController(length: categories.length, vsync: this);
    _tabController.addListener(_smoothScrollToTop);
    setState(() {
      _newsData = Map.from(widget.newsData);
    });
  }

  _smoothScrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(microseconds: 300),
      curve: Curves.ease,
    );
  }

  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      controller: _scrollController,
      headerSliverBuilder: (context, value) {
        return [
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.fromLTRB(25, 10, 25, 25),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Top News Updates",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: "Times",
                    fontSize: 34,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.only(left: 25),
              alignment: Alignment.centerLeft,
              child: TabBar(
                  labelPadding: const EdgeInsets.only(right: 15),
                  indicatorSize: TabBarIndicatorSize.label,
                  controller: _tabController,
                  isScrollable: true,
                  indicator: const UnderlineTabIndicator(),
                  labelColor: Colors.black,
                  labelStyle: const TextStyle(
                      fontFamily: "Avenger",
                      fontSize: 19,
                      fontWeight: FontWeight.bold),
                  unselectedLabelColor: Colors.black45,
                  unselectedLabelStyle: const TextStyle(
                      fontFamily: "Avenger",
                      fontSize: 18,
                      fontWeight: FontWeight.normal),
                  tabs: List.generate(categories.length,
                      (index) => Text(categories[index].name))),
            ),
          ),
        ];
      },
      body: TabBarView(
          controller: _tabController,
          children: List.generate(
            categories.length,
            (index) {
              /*
              on récupere l'argument "imageUrl" dans la variable "categories" dans l'objet "CategoryModel" ,on lui ajoute un index.
              "split("/")" permet de separer l'argument "imageUrl" en string distinct là ou il y les "slash" on recupere la valeur de l'index 3 "[3]".
              "split(".")" a partir de l'index 3 on separe la valeur là ou il y a des point et recuper le key à l'index 0 "[0]".
              "replaceAll("_", "-")" permet de remplacer tous les underScores par des tirets.
               */
              //var key = categories[index].imageUrl.toString().split("/")[3].split(".")[0].replaceAll("_", "-");
              var key = categories[index]
                  .imageUrl
                  .toString()
                  .split("/")[3]
                  .split(".")[0];
              developer.log('key : $key'); //return topnews , india , world  , business , sports , cricket , education , entertainment , lifestyle , ....

              return ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                itemBuilder: (context, i) {
                  //Gestion de l'heure des articles.
                  //Tuto parsin time : https://stackoverflow.com/questions/62949069/how-to-parse-date-time-in-flutter
                  //Tuto parsin time : https://www.woolha.com/tutorials/dart-convert-string-to-datetime
                  //->String time = _newsData[key][i]['pubDate']; //On recupere l'heure du flux rss
                  //->String timeGMT = time.replaceAll("+200", "GMT"); //pubDate me renvoi une erreur "+530" on la remplace par "GMT" pour corriger l'erreur
                  //->DateTime timeIST = HttpDate.parse(timeGMT);
                  //Sat, 18 Jun 2022 16:30:08 +0530 -> pubdata dans le flux RSS
                  //DateTime timeIST = HttpDate.parse('Sat, 18 Jun 2022 16:30:08 +0530'); -> erreur a cause de "+0530"
                  //String timeGMT = timeIST.replaceAll("+0530", "GMT");
                  //print(HttpDate.parse(timeGMT)); //OK
                  //String value2 = value.toString().split("/")[3].split(".")[0].replaceAll("_", "-");
                  //->timeIST = timeIST.add(const Duration(hours: 5)).add(const Duration(minutes: 30)); // permet de corriger l'heure, on change le fuseau horaire indien "ist" en fuseau horaire europpen "gmt"

                  developer.log('HomePageCard value : ${_newsData[key][i]['title']}');
                  //developer.log('HomePageCard value : ${_newsData['figaro_actualites'][1]}');
                  //developer.log('HomePageCard value : ${_newsData['figaro_actualites'][1]}');
                  return HomePageCard(
                    //title: _newsData[key][i]['title']['__cdata'].replaceAll(r"\'",''),
                    title: _newsData[key][i]['title']
                        .toString()
                        .replaceAll(r'{$t:', '')
                        .replaceAll(r'}', '')
                        .replaceAll(r'Ã©', 'é')
                        .replaceAll(r'â', "'")
                        .replaceAll(r'Â«', '"')
                        .replaceAll(r'Â»', '"')
                        .replaceAll(r'Ã', 'à')
                        .replaceAll(r'Ã¨', 'è')
                        .replaceAll(r'à¨', 'è')
                        .replaceAll(r'Ãª', 'ê')
                        .replaceAll(r'àª', 'ê')
                        .replaceAll(r'Ã§', 'ç'),
                    //title: '${_newsData['figaro_actualites'][1]['title']}',

                    //subtitle: _newsData[key][i]['description'],
                    //time: timeIST.day.toString() + " " + getMonthNumberInWords(month: timeIST.month) + " " + timeIST.toString().split(" ")[1].substring(0, 5),
                    //imageUrl: _newsData[key][i]['media\$content']['url'],
                    //imageUrl: _newsData[key][i]['media:content']['url'],
                  );
                },
                itemCount: _newsData[key]?.length ??
                    0, // "?." : Called also null-aware access(method invocation) / "??" : Called also null operator.
                //itemCount: 50,
              );
            },
          )),
    );
  }
}
