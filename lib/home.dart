import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ten_news/backend/rss_to_json.dart';
import 'package:ten_news/screens/home/homepage.dart';
import 'package:ten_news/screens/search/search.dart';
import 'dart:developer' as developer;

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0; //va servire au changement de page pour la bottom menu

  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  /* Collection literal
   https://dart.dev/tools/linter-rules#prefer_collection_literals
   on creer une map vide pour la variable "_newsdata" on parle de "collection literal"  , 2 methodes possibles .
   Map<String, List> newsData = Map<String, List>(); //mauvaise maniere
   ou var newsData = Map<String, List>(); //bonne maniere
   */
    Map<String, List> newsData = <String, List>{}; //bonne maniere
    /*
    A collection literal is a syntactic expression form that evaluates to an
    aggregate type, such as an array, "List", or "Map". Many languages support
    collection literals. A List literal in Java might look like:
    List<Integer> list = #[ 1, 2, 3 ];
    https://openjdk.org/jeps/186#:~:text=A%20collection%20literal%20is%20a,Many%20languages%20support%20collection%20literals.
     */

  bool isLoading = true; //CEtte variable va nous permettre de gerer la barre de chargement plus bas.
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
      developer.log('value : ${value}'); //la variable value recupere tout le flux RSS
     // developer.log('value : ${value[1]}'); //la variable value[1] recupere la partie "indian" du flux RSS

      value[0] = []; //tableau vide

      /*
      on creer une boucle "foreach" dans laquel on recupere toutes les topnews que l'on va ajouter a un tableau avec l'index 0 (topnews)
       */
      value.forEach((element) { //on peut remplacer parune boucle for
        /*
          les varargs (Arguments de longueur variable) "..." permettent de traiter un nombre illimité de paramettre au lieu de tous les taper a chaque fois au lieu de : (para1,para2para3 ...)
          dans notre cas on ajoute tous les arguments element "...element"
         */
        /*
          l'operateur "??" envoi ce qui est sa droite si sa valeur de gauche est null.
          par consequent si les arguments element sont vide "...element"  (donc null) alors on renvoi un tableau vide "[]"
          en bref on ajoutes tous les arguments elements tans que ce n'est pas null , quand sa le devient on ajoute un tableau vide qui marque la fin des ajouts.
         */
        value[0].addAll([...element ?? []]);
        //print('newsData : $newsData');
      });
      value[0].shuffle(); //shuffle : on melange les info dans newsdata pour donner l'illusion que c'est des nouvelle news a chaque fois
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
        developer.log('isLoading : $isLoading');
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
          padding: const EdgeInsets.symmetric(horizontal: 25),
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
        backgroundColor: currentIndex == 3 ? const Color(0xffF7F8FA) : Colors.white,
        elevation: 0,
        centerTitle: false,
        titleSpacing: 0,
      ),
      drawer: Container(
        width: MediaQuery.of(context).size.width / 1.25,
        child: Drawer(
          child: Column(
            children: <Widget>[
               const SizedBox(
                height: 30,
              ),
              DrawerHeader(
                child: Container(
                    height: 142,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      "assets/images/ten_news.png",
                    )),
                decoration:  const BoxDecoration(
                  color: Colors.transparent,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    currentIndex = 3;
                  });
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'Profile',
                  style: TextStyle(
                    fontFamily: 'Avenir',
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 45,
              ),
              GestureDetector(
                onTap: () {},
                child: const Text(
                  'Settings',
                  style: TextStyle(
                    fontFamily: 'Avenger',
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 45,
              ),
              const Text(
                'About',
                style: TextStyle(
                  fontFamily: 'Avenger',
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 45,
              ),
              const Text(
                'Log Out',
                style: TextStyle(
                  fontFamily: 'Avenger',
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
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
                  child: const CircleAvatar(
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
                      child: const Center(
                        child: Text(
                          'v1.0.1',
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 20,
                            color: Color(0xffffffff),
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
      // ? : Ternary operator (condition)
      body: isLoading ? const Center(
        child: CircularProgressIndicator(), //Barre de chargement
      ) : <Widget>[
        HomePage(
          newsData: newsData,
        ),
        const Search(),
        Container(
          color: Colors.yellow,
        ),
        Container(
          color: Colors.green,
        ),
      ][currentIndex],
      /*
       currentIndex = 0 affiche que les news
       currentIndex = 1 affiche top categories
        currentIndex = 2 affiche une page toute jaune
        currentIndex = 3 affiche une page toute jaune
       */


      bottomNavigationBar: BubbleBottomBar(
        opacity: 0,
        currentIndex: currentIndex,
        onTap: changePage,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
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
              title: const Text("Bookmarks")),
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
                        color: Color(0x5c000000),
                        offset: Offset(0, 1),
                        blurRadius: 5)
                  ],
                ),
              ),
              title: const Text("Profile"), activeIcon: null),
        ],
      ),
    );
  }
}