import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ten_news/backend/rss_to_json.dart';
import 'package:ten_news/screens/home/homepage.dart';
import 'package:ten_news/screens/search/search.dart';
import 'dart:developer' as developer;


/*

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;

  void changePage(int? index) {
    setState(() {
      currentIndex = index!;
    });
  }

  Map<String , List> newsData = Map<String , List>(); //Create an Empty Map
bool isLoading = true;
  getData() async {
    Future.wait([
      rssToJson('top-news'),
      rssToJson('india'),
      rssToJson('world'),
      rssToJson('business'),
      rssToJson('sports'),
      rssToJson('cricket'),
      rssToJson('tech-featurs'),
      rssToJson('education'),
      rssToJson('entertainment'),
      rssToJson('music'),
      rssToJson('lifestyle'),
      rssToJson('health-fitness'),
      rssToJson('fashion-trends'),
      rssToJson('art-culture'),
      rssToJson('travel'),
      rssToJson('books'),
      rssToJson('realestate'),
      rssToJson('its-viral'),
    ]).then((value) {
      newsData['top-news'] = value[0];
      newsData['india'] = value[1];
      newsData['world'] = value[2];
      newsData['business'] = value[3];
      newsData['sports'] = value[4];
      newsData['cricket'] = value[5];
      newsData['tech-featurs'] = value[6];
      newsData['education'] = value[7];
      newsData['entertainment'] = value[8];
      newsData['music'] = value[9];
      newsData['lifestyle'] = value[10];
      newsData['health-fitness'] = value[11];
      newsData['fashion-trends'] = value[12];
      newsData['art-culture'] = value[13];
      newsData['travel'] = value[14];
      newsData['books'] = value[15];
      newsData['realestate'] = value[16];
      newsData['its-viral'] = value[17];
      //on arrete le chargement si il n'y a plus de valeur apres le 17eme
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
        super.initState();
        getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Builder(
            builder: (context) => IconButton(
              icon: SvgPicture.asset("assets/icons/drawer.svg"),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
        ),
        titleSpacing: 0,
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 30),
            DrawerHeader(
                child: Container(
              height: 140,
              width: MediaQuery.of(context).size.width,
              child: Image.asset("assets/ten_news.png"),
            )),
            const SizedBox(height: 20),
            const Text(
              'Profile',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 45),
            const Text(
              'Setting',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 45),
            const Text(
              'About',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 45),
            const Text(
              'Log Out',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 45),
            Material(
              borderRadius: BorderRadius.circular(500),
              child: InkWell(
                borderRadius: BorderRadius.circular(500),
                splashColor: Colors.black45,
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.black,
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 65,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.black,
                  child: const Center(
                    child: Text(
                      'v1.0.1',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      body: isLoading ? const Center(
        child: CircularProgressIndicator(),
      ) : <Widget>[
         HomePage(
          newsData: newsData,
        ),
        Container(
          color: Colors.blue,
        ),
        Container(
          color: Colors.red,
        ),
        Container(
          color: Colors.yellow,
        ),
        Container(
          color: Colors.green,
        ),
      ][currentIndex],
      bottomNavigationBar: BubbleBottomBar(
        opacity: .2,
        currentIndex: currentIndex,
        onTap: changePage,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
        elevation: 8,
        fabLocation: BubbleBottomBarFabLocation.end,
        //new
        hasNotch: true,
        //new
        hasInk: true,
        //new, gives a cute ink effect
        inkColor: Colors.black12,
        //optional, uses theme color if not specified
        items: <BubbleBottomBarItem>[
          BubbleBottomBarItem(
              backgroundColor: Colors.black,
              icon: SvgPicture.asset(
                'assets/icons/home.svg',
                width: 21,
                color: Colors.black54,
                height: 21,
              ),
              activeIcon: SvgPicture.asset(
                'assets/icons/home.svg',
                width: 21,
                color: Colors.black,
                height: 21,
              ),
              title: const Text("Home")),
          BubbleBottomBarItem(
              backgroundColor: Colors.black,
              icon: SvgPicture.asset(
                'assets/icons/search.svg',
                width: 21,
                color: Colors.black54,
                height: 21,
              ),
              activeIcon: SvgPicture.asset(
                'assets/icons/search.svg',
                width: 21,
                color: Colors.black,
                height: 21,
              ),
              title: const Text("Search")),
          BubbleBottomBarItem(
              backgroundColor: Colors.black,
              icon: SvgPicture.asset(
                'assets/icons/bookmark.svg',
                width: 21,
                color: Colors.black54,
                height: 21,
              ),
              activeIcon: SvgPicture.asset(
                'assets/icons/bookmark.svg',
                width: 21,
                color: Colors.black,
                height: 21,
              ),
              title: const Text("Bookmark")),
          BubbleBottomBarItem(
            backgroundColor: Colors.black,
            icon: Container(
              height: 24,
              width: 24,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: AssetImage('assets/user.png')),
                boxShadow: [
                  BoxShadow(
                      color: Color(0xff5c0000),
                      offset: Offset(0, 1),
                      blurRadius: 5)
                ],
              ),
            ),
            title: const Text("Profile"),
            activeIcon: Container(
              height: 24,
              width: 24,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: AssetImage('assets/user.png')),
                boxShadow: [
                  BoxShadow(
                      color: Color(0xff5c0000),
                      offset: Offset(0, 1),
                      blurRadius: 5)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

 */

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;

  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  Map<String, List> newsData = Map<String, List>();
  bool isLoading = true;
  getData() async {
    Future.wait([
      rssToJson('topnews'),
      rssToJson('india'),
      rssToJson('world-news'),
      rssToJson('business'),
      rssToJson('sports'),
      rssToJson('cricket'),
      rssToJson('education'),
      rssToJson('entertainment'),
      rssToJson('lifestyle'),
      rssToJson('health'),
      rssToJson('books'),
      rssToJson('trending'),
    ]).then((value) {
      developer.log('value : $value'); //la variable value recupere tout le flux RSS

      value[0] = []; //tableau vide
      value.forEach((element) {
        /*
          les varargs (Arguments de longueur variable) "..." permettent de traiter un nombre illimité de paramettre au lieu de tous les taper a chaque fois au lieu de : (para1,para2para3 ...)
          dans notre cas on ajoute tous les arguments element "...element"
         */
        /*
          l'operateur "??" envoi ce qui est sa droite si sa valeur de gauche est null.
          par consequent si les arguments element sont vide "...element"  (donc null) alors on renvoi un tableau vide "[]"
          en bref on ajoutes tous les arguments elements tans que ce n'est pas null , quand sa le devient on ajoute un tableau vide.
         */
        value[0].addAll([...element ?? []]);
        //print('newsData : $newsData');
      });
      value[0].shuffle(); //shuffle : on melange les info dans newsdata pour donner l'illusion que c'est des nouvelle newe a chaque fois
      newsData['topnews'] = value[0].sublist(0, 10); //retourne la sous liste comprise entre 0 et 10 -> n'affiche donc que les 10er articles
      newsData['india'] = value[1];
      newsData['world'] = value[2];
      newsData['business'] = value[3];
      newsData['sports'] = value[4];
      newsData['cricket'] = value[5];
      newsData['education'] = value[6];
      newsData['entertainment'] = value[7];
      newsData['lifestyle'] = value[8];
      newsData['health-fitness'] = value[9];
      newsData['books'] = value[10];
      newsData['its-viral'] = value[11];
      //developer.log('newsData : $newsData');
      //developer.log('newsData topnews: ${newsData['world']}');


      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Builder(
            builder: (context) => IconButton(
              icon: SvgPicture.asset(
                "assets/icons/drawer.svg",
                height: 15,
                width: 34,
              ),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
        ),
        backgroundColor: currentIndex == 3 ? Color(0xffF7F8FA) : Colors.white,
        elevation: 0,
        centerTitle: false,
        titleSpacing: 0,
      ),
      drawer: Container(
        width: MediaQuery.of(context).size.width / 1.25,
        child: Drawer(
          child: Column(
            children: <Widget>[
               SizedBox(
                height: 30,
              ),
              DrawerHeader(
                child: Container(
                    height: 142,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      "assets/images/ten_news.png",
                    )),
                decoration:  BoxDecoration(
                  color: Colors.transparent,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    currentIndex = 3;
                  });
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Profile',
                  style: TextStyle(
                    fontFamily: 'Avenir',
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 45,
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  'Settings',
                  style: TextStyle(
                    fontFamily: 'Avenir',
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 45,
              ),
              Text(
                'About',
                style: TextStyle(
                  fontFamily: 'Avenir',
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 45,
              ),
              Text(
                'Log Out',
                style: TextStyle(
                  fontFamily: 'Avenir',
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 45,
              ),
              Material(
                borderRadius: BorderRadius.circular(500),
                child: InkWell(
                  borderRadius: BorderRadius.circular(500),
                  splashColor: Colors.black45,
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.black,
                    child: Icon(Icons.arrow_back, color: Colors.white),
                  ),
                ),
              ),
              Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 65,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.black,
                      child: Center(
                        child: Text(
                          'v1.0.1',
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 20,
                            color: const Color(0xffffffff),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
      body: isLoading ? const Center(
        child: CircularProgressIndicator(),
      )
          : <Widget>[
        HomePage(
          newsData: newsData,
        ),
        Search(),
        Container(
          color: Colors.yellow,
        ),
        Container(
          color: Colors.green,
        ),
      ][currentIndex],
      bottomNavigationBar: BubbleBottomBar(
        opacity: 0,
        currentIndex: currentIndex,
        onTap: changePage,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        elevation: 8,
        items: <BubbleBottomBarItem>[
          BubbleBottomBarItem(
              backgroundColor: Colors.black,
              icon: SvgPicture.asset(
                'assets/icons/home.svg',
                width: 21,
                color: Colors.black54,
                height: 21,
              ),
              activeIcon: SvgPicture.asset(
                'assets/icons/home.svg',
                width: 21,
                color: Colors.black,
                height: 21,
              ),
              title: Text("Home")),
          BubbleBottomBarItem(
              backgroundColor: Colors.black,
              icon: SvgPicture.asset(
                'assets/icons/search.svg',
                width: 21,
                color: Colors.black54,
                height: 21,
              ),
              activeIcon: SvgPicture.asset(
                'assets/icons/search.svg',
                width: 21,
                color: Colors.black,
                height: 21,
              ),
              title: Text("Search")),
          BubbleBottomBarItem(
              backgroundColor: Colors.black,
              icon: SvgPicture.asset(
                'assets/icons/bookmark.svg',
                width: 21,
                color: Colors.black54,
                height: 21,
              ),
              activeIcon: SvgPicture.asset(
                'assets/icons/bookmark.svg',
                width: 21,
                color: Colors.black,
                height: 21,
              ),
              title: Text("Bookmarks")),
          BubbleBottomBarItem(
              backgroundColor: Colors.black,
              icon: Container(
                height: 24,
                width: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: AssetImage('assets/user.png')),
                  boxShadow: [
                    BoxShadow(
                        color: Color(0x5c000000),
                        offset: Offset(0, 1),
                        blurRadius: 5)
                  ],
                ),
              ),
              title: Text("Profile"), activeIcon: null),
        ],
      ),
    );
  }
}