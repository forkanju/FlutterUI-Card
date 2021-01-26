import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Cards',
      home: MyHomePage(),
    );
  }
}


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  Animation cardAnimation,
      delayedCardAnimation,
      fabButtonAnimation,
      infoAnimation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(seconds: 2), vsync: this);

    cardAnimation = Tween(begin: 0.0, end: -0.025).animate(
        CurvedAnimation(curve: Curves.fastOutSlowIn, parent: controller));

    delayedCardAnimation = Tween(begin: 0.0, end: -0.05).animate(
        CurvedAnimation(
            curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
            parent: controller));

    fabButtonAnimation = Tween(begin: 1.0, end: -0.0008).animate(CurvedAnimation(
        curve: Interval(0.8, 1.0, curve: Curves.fastOutSlowIn),
        parent: controller));

    infoAnimation = Tween(begin: 0.0, end: 0.025).animate(CurvedAnimation(
        curve: Interval(0.7, 1.0, curve: Curves.fastOutSlowIn),
        parent: controller));
  }

  @override
  Widget build(BuildContext context) {
    final devHeight = MediaQuery.of(context).size.height;
    controller.forward();
    return AnimatedBuilder(animation: controller, builder: (BuildContext context, Widget child){
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'Near by',
            style: TextStyle(
                color: Colors.black,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: FlutterLogo(
                textColor: Colors.lightBlueAccent,
                size: 35.0,
              ),
            )
          ],
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.black,
            onPressed: () {},
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 40.0),
              child: Stack(
                overflow: Overflow.visible,
                children: [
                  Positioned(
                      left: 20.0,
                      child: Container(
                        transform: Matrix4.translationValues(0.0, delayedCardAnimation.value * devHeight, 0.0),
                        width: 260.0,
                        height: 400.0,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      )),
                  Positioned(
                    left: 10.0,
                    child: Container(
                      transform: Matrix4.translationValues(0.0, cardAnimation.value * devHeight, 0.0),
                      width: 280.0,
                      height: 400.0,
                      decoration: BoxDecoration(
                          color: Colors.lightBlueAccent,
                          borderRadius: BorderRadius.circular(10.0)),
                    ),
                  ),
                  Container(

                    width: 300,
                    height: 400.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                          image: AssetImage('assets/images/girls.jpeg'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Positioned(
                    top: 330.0,
                    left: 15.0,
                    child: Container(
                      transform: Matrix4.translationValues(0.0, infoAnimation.value * devHeight, 0.0),
                      width: 270.0,
                      height: 90.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 2.0,
                              color: Colors.black12,
                              spreadRadius: 2.0,
                            )
                          ]),
                      child: Container(
                        padding: EdgeInsets.all(7.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Kayla',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 22.0,
                                  ),
                                ),
                                SizedBox(
                                  width: 4.0,
                                ),
                                Image.asset(
                                  'assets/images/simbolo.png',
                                  height: 20.0,
                                  width: 20.0,
                                ),
                                SizedBox(
                                  width: 110.0,
                                ),
                                Text(
                                  '5.8km',
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 20.0,
                                      color: Colors.grey),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 9.0,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Fate is wonderful.',
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 15.0,
                                      color: Colors.grey),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Container(
              transform: Matrix4.translationValues(0.0, fabButtonAnimation.value * devHeight, 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    onPressed: () {},
                    elevation: 0.0,
                    child: Icon(
                      Icons.close,
                      color: Colors.black,
                    ),
                    backgroundColor: Colors.white,
                  ),
                  Container(
                    height: 70.0,
                    width: 70.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(35.0),
                      border: Border.all(
                          color: Colors.transparent,
                          style: BorderStyle.solid,
                          width: 2.0),
                    ),
                    child: Container(
                      child: Center(
                        child: IconButton(
                          icon: Image.asset('assets/images/images.png'),
                          color: Colors.lightBlueAccent[300],
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: () {},
                    elevation: 0.0,
                    child: Icon(
                      Icons.favorite,
                      color: Colors.pink,
                    ),
                    backgroundColor: Colors.white,
                  ),
                ],
              ),
            )
          ],
        ),
      );
    });

  }
}
