import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'CvEnglish.dart';

class CVScrean extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.rtl, child:  Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.greenAccent[100],
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(FontAwesomeIcons.search),padding: EdgeInsets.only(left:250.0),
            color: Colors.black45,
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.favorite),
            color: Colors.black45,
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.amber[30],
          child: Column(

            children: <Widget>[
              headerBuild(),
              Container(
                margin: const EdgeInsets.all(30.0),
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),

                    boxShadow: [BoxShadow(
                        color: Color.fromRGBO(250, 237, 183 ,.2),
                        blurRadius: 20,
                        offset: Offset(0, 10)
                    )]
                ),
                child: Text("  بكالوريوس تقنية معلومات- جامعة صنعاء -كلية الحاسوب 2018_2017"),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CVScreanE()));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 50,
                    width: 270,
                    decoration: BoxDecoration(
                        color: Colors.green[300],
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: Text(
                        "انتقل الى اللغة الإنجليزية",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),


              _buildTitle("المهارات"),

              _buildskills("html,html5", 0.98),
              _buildskills("css,css3", 0.90),
              _buildskills("php", 0.95),
              _buildskills("js", 0.70),
              _buildskills("jquery", 0.90),
              _buildskills("bootstrap 4", 0.80),
              _buildskills("flutter", 0.85),
              SizedBox(height: 10.0,),
              _buildTitle("الدورات التدريبية"),
              _buildExpert("امنية معلومات","معهد نوفل","2016-2017"),
              _buildExpert("صيانة","معهد موف فور وورك","2016-2017"),
              _buildExpert("اساسيات اندرويد","مركز الحاسب الالي","2017-2018"),
              _buildExpert("دورة جرافيكس) ","معهد القيادات الشبابية- وزارة الشباب والرياضة","2017-2018"),
              _buildExpert("فلاتر","اكاديمية جوديف","2020"),


              SizedBox(height: 20.0,),
              _buildTitle("تواصل معي"),
              contact(Icons.email,"alqaadienas@gmail.com"),
              contact(Icons.phone,"772650028"),

              _buildSocial(),




            ],
          ),
        ),
      ),
    ));

  }

  _buildSocial(){
    return Padding(
      padding: const EdgeInsets.only(left:100.0,right: 100.0),
      child: Center(
        child: Row(

          children: <Widget>[
            social(FontAwesomeIcons.facebook,Colors.indigoAccent,"https://www.facebook.com/login"),
            social(FontAwesomeIcons.github,Colors.black,"https://github.com/afgprogrammer"),
            social(FontAwesomeIcons.google,Colors.red,"https://google.com")
          ],
        ),
      ),
    );
  }
  IconButton social(icon, color,url) => IconButton(icon: Icon(icon),color: color,onPressed: (){_launchURL(url);});

  _launchURL(String url) async{
    if (await canLaunch(url))
    {
      await launch(url);
    }
    else{
      throw 'Couldnot launch $url';
    }

  }

  Padding contact(var icon, String contect) {
    return Padding(
      padding: const EdgeInsets.only(right:50.0,),
      child: Row(
        children: <Widget>[
          Icon(icon),
          SizedBox(width: 15.0,),
          Text(contect),

        ],
      ),
    );
  }

  _buildExpert(String exName,String position,String duration)
  {
    return Padding(
      padding: const EdgeInsets.only(left:5.0,bottom: 2.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [BoxShadow(
                color: Colors.green[50],
                blurRadius: 20,
                offset: Offset(0, 10)
            )]
        ),
        width: 500.0,
        height: 100.0,


        child: ListTile(
            leading: Icon(Icons.fiber_manual_record),
            title: Text(exName,style: TextStyle(fontSize: 20.0,color: Colors.black,
                fontWeight: FontWeight.bold),),

            subtitle:  Text ("${position}(${duration}),")
        ),
      ),
    );
  }

  _buildskills(String title, double level) {
    return Padding(
      padding: const EdgeInsets.only(bottom :8.0,right: 10.0),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Text(
              title,
              style: TextStyle(color: Colors.black, fontSize: 14.0),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            width: 16.0,
          ),
          Expanded(
            flex: 5,
            child: LinearProgressIndicator(
              value: level,
              backgroundColor: Colors.white,
              valueColor:new AlwaysStoppedAnimation<Color>(Colors.green),
            ),
          ),
          SizedBox(
            width: 16.0,
          )
        ],
      ),
    );
  }

  _buildTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [BoxShadow(
                    color: Colors.green[50],
                    blurRadius: 20,
                    offset: Offset(0, 10)
                )]
            ),
            child: Center(

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right:50.0),
                    child: Text(
                      title.toUpperCase(),
                      style: TextStyle(fontSize: 20.0, color: Colors.black),
                    ),
                  ),
                  Divider(
                    color: Colors.black45,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  headerBuild() {
    return Row(
      children: <Widget>[
        Container(

          height: 80.0,
          width: 80.0,
          child: CircleAvatar(
            radius: 35.0,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 35.0,
              backgroundImage: NetworkImage(
                  "https://good-morning.cc/wp-content/uploads/2019/06/1027.jpg"),
            ),
          ),
        ),
        SizedBox(
          width: 30.0,
        ),
        Column(
          children: <Widget>[
            Text(
              "ايناس حميد يحيى القعادي",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text("مصممة ومطورة مواقع الكترونية,وتطبيقات فلاتر "),
            SizedBox(
              height: 5.0,
            ),
            Row(
              children: <Widget>[
                Icon(
                  FontAwesomeIcons.map,
                  color: Colors.black45,
                ),
                SizedBox(
                  width: 2.0,
                ),
                Text(
                  "  اليمن_صنعاء  ",
                  style: TextStyle(color: Colors.black45),
                )
              ],
            )
          ],
        ),
      ],
    );
  }
}

