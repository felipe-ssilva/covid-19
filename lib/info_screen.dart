import 'package:covid19/constant.dart';
import 'package:covid19/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            MyHeader(
              image: 'assets/icons/coronadr.svg',
              textTop: 'Get to know',
              textBottom: 'About Covid-19',
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Symptoms',
                    style: kTitleTextstyle
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SymptonCard(
                        image: 'assets/img/headache.png',
                        title: 'Headache',
                        isActive: true,
                      ),
                      SymptonCard(
                        image: 'assets/img/caugh.png',
                        title: 'Caugh',
                      ),
                      SymptonCard(
                        image: 'assets/img/fever.png',
                        title: 'Fever',
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Prevention',
                    style: kTitleTextstyle,
                  ),
                  SizedBox(height: 20),
                  PreventCard(
                    image: 'assets/img/wear_mask.png',
                    textTop: 'Wear face mask',
                    textBottom: 'Since the start of the coronavirus outbreack some places have full.',
                  ),
                  PreventCard(
                    image: 'assets/img/wash_hands.png',
                    textTop: 'Wash your hands',
                    textBottom: 'Since the start of the coronavirus outbreack some places have full.',
                  ),
                  SizedBox(height: 50)
                ]
              ),
            )
          ],
        ),
      )
    );
  }
}

class PreventCard extends StatelessWidget {
  final String image;
  final String textTop;
  final String textBottom;
  
  const PreventCard({
    Key key,
    this.image,
    this.textTop,
    this.textBottom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SizedBox(
        height: 155,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: <Widget>[
            Container(
              height: 135,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 8),
                    blurRadius: 24,
                    color: kShadowColor
                  )
                ]
              ),
            ),
            Image.asset(image),
            Positioned(
              left: 130,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                height: 135,
                width: MediaQuery.of(context).size.width - 170,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      textTop,
                      style: kTitleTextstyle.copyWith(
                        fontSize: 16
                      ),
                    ),
                    Text(
                      textBottom,
                      style: TextStyle(fontSize: 12),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: SvgPicture.asset('assets/icons/forward.svg'),
                    )
                  ],
                ),
              ),
            )
          ]
        )
      ),
    );
  }
}

class SymptonCard extends StatelessWidget {
  final String image;
  final String title;
  final bool isActive;

  const SymptonCard({
    Key key,
    this.image,
    this.title,
    this.isActive = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          isActive ?
            BoxShadow(
              offset: Offset(0, 10),
              blurRadius: 20,
              color: kActiveShadowColor
            )
          :
            BoxShadow(
              offset: Offset(0, 3),
              blurRadius: 6,
              color: kShadowColor
            )
        ]
      ),
      child: Column(
        children: <Widget>[
          Image.asset(image, height: 90),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ]
      ),
    );
  }
}