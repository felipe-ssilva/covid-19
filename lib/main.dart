import 'package:covid19/constant.dart';
import 'package:covid19/info_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:covid19/widgets/counter.dart';
import 'package:covid19/widgets/header.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Covid 19',
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        fontFamily: 'Poppins',
        textTheme: TextTheme(
          body1: TextStyle(color: kBodyTextColor)
        ),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            MyHeader(
              image: 'assets/icons/Drcorona.svg',
              textTop: 'All you need',
              textBottom: 'is stay at home.',
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  color: Color(0xFFE5E5E5)
                )
              ),
              child: Row(
                children: <Widget>[
                  SvgPicture.asset('assets/icons/maps-and-flags.svg'),
                  SizedBox(width: 20),
                  Expanded(
                    child: DropdownButton(
                      isExpanded: true,
                      underline: SizedBox(),
                      icon: SvgPicture.asset('assets/icons/dropdown.svg'),
                      value: 'Brazil',
                      items: ['Brazil', 'United States', 'China', 'Japan']
                        .map<DropdownMenuItem<String>>((String value){
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (value){},
                    )
                  ),
                ]
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Case update\n',
                              style: kTitleTextstyle,
                            ),
                            TextSpan(
                              text: 'Newest update',
                              style: TextStyle(
                                color: kTextLightColor
                              )
                            )
                          ]
                        )
                      ),
                      Spacer(),
                      Text(
                        'See details',
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w600
                        ),
                      )
                    ]
                  ),
                  SizedBox(height: 20),
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 4),
                          blurRadius: 30,
                          color: kShadowColor
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Counter(
                          color: kInfectedColor,
                          number: 30961,
                          title: 'Infected',
                        ),
                        Counter(
                          color: kDeathColor,
                          number: 1956,
                          title: 'Deaths',
                        ),
                        Counter(
                          color: kRecovercolor,
                          number: 14026,
                          title: 'Recovered',
                        ),
                      ]
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        'Spread of Virus',
                        style: kTitleTextstyle,
                      ),
                      Spacer(),
                      Text(
                        'See details',
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w600
                        )
                      ),
                    ]
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    padding: EdgeInsets.all(20),
                    height: 178,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 30,
                          color: kShadowColor
                        )
                      ]
                    ),
                    child: Image.asset(
                      'assets/img/map.png',
                      fit: BoxFit.contain,
                    ),
                  )
                ]
              )
            )
          ]
        ),
      )
    );
  }
}