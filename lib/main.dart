import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web_scraper/web_scraper.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;


var search;
bool busy=false;
TextEditingController textEditingController=TextEditingController();
var x;
var xx=[];
var list = [];
var img=[];

// import 'package:html/dom.dart';
void main() => runApp(WebScraperApp());

class WebScraperApp extends StatefulWidget {
  @override
  _WebScraperAppState createState() => _WebScraperAppState();
}

class _WebScraperAppState extends State<WebScraperApp> {
  // initialize WebScraper by passing base url of website
  // final webScraper = WebScraper('https://webscraper.io');
  // var webScraperr = WebScraper('https://www.google.com');
  // var ws = WebScraper('https://unacademy.com');
  // // Response of getElement is always List<Map<String, dynamic>>
  // List<Map<String, dynamic>> productNames;
  // List<Map<String, dynamic>> productDescriptions;

  void fetchProducts() async {
    busy=!busy;
    x = await http
        .get('https://www.google.com/maps/search/'+search);
    var x1 = x.body.split("(Owner)");
    var len = x1.length;
    for (int i = 0; i < len - 1; i++) {
      list.add(x1[i].split('\\"')[x1[i].split('\\"').length - 1].substring(0,x1[i].split('\\"')[x1[i].split('\\"').length - 1].length-1));
    }
   // print(list);
    // print(x.body.split("(Owner)")[1].split('\\"')[x.body.split("(Owner)")[1].split('\\"').length-1]);
    // Loads web page and downloads into local state of library
    // if (await webScraper
    //     .loadWebPage('/test-sites/e-commerce/allinone/computers/laptops')) {
    //   setState(() {
    //     // getElement takes the address of html tag/element and attributes you want to scrap from website
    //     // it will return the attributes in the same order passed
    //     productNames = webScraper.getElement(
    //         'div.thumbnail > div.caption > h4 > a.title', ['href', 'title']);
    //     productDescriptions = webScraper.getElement(
    //         'div.thumbnail > div.caption > p.description', ['class']);
    //     x = webScraper.getElement('div.caption ', ['class']);
    //   });
    // }

    //var gg=list[0];
  //  print(gg);
    xx.clear();

    for(int i=0;i<list.length;i++){
      var rem=list[i].split(" ");
      var inp='';
      for(int j=0;j<rem.length;j++){
        if (rem[j]!='\\\\u0026'){
          if(inp==''){
          inp=inp+rem[j];}
        else{
          inp=inp+' '+rem[j];
          }
        }}
      list[i]=inp;
      print('\\"'+list[i]+'\\"');
    //print((x.body.split('\\"'+list[i]+'\\"')[2].split('\\"').length-2).toString()+(x.body.split('\\"'+list[i]+'\\"')[2].split('\\"').length).toString());
      xx.add(x.body.split('\\"'+list[i]+'\\"').length>2? x.body.split('\\"'+list[i]+'\\"')[2].split('\\"')[x.body.split('\\"'+list[i]+'\\"')[2].split('\\"').length-2]:'' );
    }
    print(xx.length);
  // print(x.body.split('\\"'+list[1]+'\\"')[2].split('\\"')[x.body.split('\\"'+list[2]+'\\"')[2].split('\\"').length-2]);
   var count=[];
   for(int i=0;i<xx.length;i++)
     {
       if(xx[i].split('https://lh5.googleusercontent.com').length<2){count.add(i);xx[i]='';}
       else{
         xx[i]=xx[i].split('\\\\')[0];
       }
       print(i.toString()+'  '+xx[i].toString());

     }
   for(int i=0;i<count.length;i++){
     print(count[i]);

   }

   // xx=x.body.split(gg)[5];//.split('\\"')[8];
   //  var xx1=[];
   //  var len2=x.body.split("https://lh5.googleusercontent.com/p/AF1Qip");
   //   for(int i=1;i<len2.length;i++){
   //     xx1.add(len2[i].split('\\"')[0]);
   //   }
   //
   //   var xxx=[];
   //  xxx.clear();
   //  var test=false;
   //   var test2=xx1[0].split('\\u003d')[0];
   //   print(test2);
   //   xxx.add(xx1[0]);
   //  for(int i=0;i<xx1.length;i++){
   //    if(xx1[i].split('\\u003d')[0]!=test2){
   //      test2=xx1[i].split('\\u003d')[0];
   //      xxx.add(xx1[i]);
   //    }
   //  }
   //  print(list.length);
   //  print(xxx.length);
   //  print(xx1.length);

    setState(() {
      busy=!busy;
    });
    // if (await webScraperr.loadWebPage('/travel/flights/search?q=mumbai+to+dubai')){
    //  //xx=webScraperr.getElement('span.mv1WYe', []);
    //   xx=webScraperr.getAllScripts();
    // }
    // if (await ws.loadWebPage('/course/gravitation-for-iit-jee/D5A8YSAJ')){
    //   setState(() {
    //     print('\n.................................................');
    //     xx=ws.getElement('h6.H6-sc-1gn2suh-0', []);
    // }
    //  );

    //  }
    //   print(xx);
    //   final rawUrl =
    //       'https://unacademy.com/course/gravitation-for-iit-jee/D5A8YSAJ';
    //   final webScraperrr = WebScraper('https://unacademy.com');
    //   final endpoint = rawUrl.replaceAll(r'https://unacademy.com', '');
    //   if (await webScraperrr.loadWebPage(endpoint)) {
    //     final titleElements = webScraperrr.getElement(
    //         'div.Week__Wrapper-sc-1qeje5a-2 > a.Link__StyledAnchor-sc-1n9f3wx-0 > div.ItemCard__ItemInfo-xrh60s-1 > h6.H6-sc-1gn2suh-0',
    //         []);
    //     print(titleElements);
    //   }
  }

  @override
  void initState() {
    super.initState();
    // Requesting to fetch before UI drawing starts

    initChaptersTitleScrap();
  }

  void initChaptersTitleScrap() async {
    // var client = Client();
    // Response response = await client.get('https://www.google.com/travel/flights/search?q=mumbai+to+dubai');
    //
    // // Use html parser
    // var document = parse(response.body);
    // var links = document.querySelectorAll('span.mv1WYe');
    // print(links);
    // final rawUrl =
    //     'https://unacademy.com/course/gravitation-for-iit-jee/D5A8YSAJ';
    // final webScraper = WebScraper('https://unacademy.com');
    // final endpoint = rawUrl.replaceAll(r'https://unacademy.com', '');
    // if (await webScraper.loadWebPage(endpoint)) {
    //   final titleElements = webScraper.getElement(
    //       'div.Week__Wrapper-sc-1qeje5a-2 > a.Link__StyledAnchor-sc-1n9f3wx-0 '
    //           '> div.ItemCard__ItemInfo-xrh60s-1 '
    //           '> h6.H6-sc-1gn2suh-0',
    //       []);
    //   print(titleElements);
    //   final titleList = <String>[];
    //   titleElements.forEach((element) {
    //     final title = element['title'];
    //     titleList.add('$title');
    //   });
    //   print(titleList);
    //   if (mounted)
    //     setState(() {
    //      // this.titleList = titleList;
    //     });
    // } else {
    //   print('Cannot load url');
    // }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Product Catalog"),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(child: TextField(controller: textEditingController,)),
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: (){
                      setState(() {

                        var test=textEditingController.text;
                        search='';
                        var test2;
                        test2=test.split(" ");
                        if(textEditingController.text!=""){
                          list.clear();
                          search=test2[0];
                          for (int i=1;i<test2.length;i++){search=search+'+'+test2[i];}
                          fetchProducts();
                        }


                        print(search);
                      });
                    },
                  )
                ],
              ),

               busy
                  ? Center(
                child:
                CircularProgressIndicator(), // Loads Circular Loading Animation
              )
                  : Expanded(
                    child: ListView.builder(
                      
                itemCount: list.length,
                itemBuilder: (BuildContext context, int index) {
                    // Attributes are in the form of List<Map<String, dynamic>>.
                    var attributes = list[index];
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: <Widget>[
                          xx[index]!=''?
                          Image.network(xx[index]):SizedBox(),
                          Container(
                            child: Text(attributes),
                            margin: EdgeInsets.only(bottom: 10.0),
                          ),
                          // InkWell(
                          //   onTap: () {
                          //     // uses UI Launcher to launch in web browser & minor tweaks to generate url
                          //     launch(webScraper.baseUrl +
                          //         attributes['href']);
                          //   },
                          //   child: Text(
                          //     "View Product",
                          //     style: TextStyle(color: Colors.blue),
                          //   ),
                          // ),
                        ],
                      ),
                    );
                },
              ),
                  ),
            ],
          )
        ),
      ),
    );
  }
}
