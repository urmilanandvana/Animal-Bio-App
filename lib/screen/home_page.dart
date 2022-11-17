import 'dart:async';
import 'dart:typed_data';

import 'package:animal_app/db_helper/db_helper.dart';
import 'package:animal_app/global/global.dart';
import 'package:animal_app/model/model.dart';
import 'package:flutter/material.dart';

import '../db_helper/api_helper.dart';
import '../widget/app_bar.dart';

class FirstSplash extends StatefulWidget {
  const FirstSplash({Key? key}) : super(key: key);

  @override
  State<FirstSplash> createState() => _FirstSplashState();
}

class _FirstSplashState extends State<FirstSplash> {
  int index = 0;
  @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   Duration duration = const Duration(seconds: 5);
  //
  //   Timer(duration, () {
  //     Navigator.of(context).pushReplacementNamed('/');
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: IndexedStack(
        index: index,
        children: [
          //TODO: firstScreen
          Stack(
            children: [
              FutureBuilder(
                  future: APIHelper.apiHelper.imageAPI(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text("Error ${snapshot.error}");
                    } else if (snapshot.hasData) {
                      Uint8List data = snapshot.data as Uint8List;

                      return Image.memory(
                        data,
                        height: double.infinity,
                        fit: BoxFit.fitHeight,
                      );
                    }
                    return const Center(child: CircularProgressIndicator());
                  }),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppBarWidget(),
                    const Spacer(),
                    const Text(
                      "Ready to\nWatch?",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 50,
                        letterSpacing: 2,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Aplanet is a global leader in real life entertainment, serving a passionate audience that inspires, informs and entertains.",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Text(
                          "Start Enjoying",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                        ),
                        const Spacer(),
                        Container(
                          height: 70,
                          width: 70,
                          alignment: Alignment.bottomRight,
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(100),
                            ),
                          ),
                          child: const Icon(
                            Icons.arrow_forward_rounded,
                            color: Colors.white,
                            size: 35,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          //TODO: lastScreen

          Stack(
            children: [
              Container(
                color: const Color(0xffC19E82),
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    const AppBarWidget(),
                    const SizedBox(height: 20),
                    Text(
                      "Choose a plan",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 35,
                        letterSpacing: 3,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      flex: 10,
                      child: FutureBuilder(
                          future: DBHelper.dbHelper
                              .fetchSecondScreen(data: Global.secondScreenData),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return Text("Error: ${snapshot.error} ");
                            } else if (snapshot.hasData) {
                              List<SecondScreenFetch>? data = snapshot.data;
                              return ListView.builder(
                                  itemCount: data!.length,
                                  itemBuilder: (context, i) {
                                    return Container(
                                      height: 120,
                                      margin: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          // colorFilter: const ColorFilter.mode(
                                          //   Color(0xffC19E82),
                                          //   BlendMode.modulate,
                                          // ),
                                          image: MemoryImage(
                                            data[i].image,
                                          ),
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          const SizedBox(width: 15),
                                          Text(
                                            "${data[i].time}\nSubscription",
                                            style: TextStyle(
                                              fontSize: 24,
                                              color:
                                                  Colors.white.withOpacity(0.8),
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          const Spacer(),
                                          SizedBox(
                                            width: width / 3,
                                            child: Text(
                                              "${data[i].price}",
                                              style: TextStyle(
                                                fontSize: 33,
                                                color: Colors.white
                                                    .withOpacity(0.8),
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  });
                            }
                            return CircularProgressIndicator();
                          }),
                    ),
                    Expanded(
                      flex: 2,
                      child: Row(
                        children: [
                          Text(
                            "Start Enjoying",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                            ),
                          ),
                          const Spacer(),
                          Container(
                            height: 70,
                            width: 70,
                            alignment: Alignment.bottomRight,
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.5),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(100),
                              ),
                            ),
                            child: const Icon(
                              Icons.arrow_forward_rounded,
                              color: Colors.white,
                              size: 35,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          //TODO: thirdScreen
          Stack(
            children: [
              Container(
                height: height * 0.40,
                child: Stack(
                  children: [
                    FutureBuilder(
                      future: APIHelper.apiHelper.imageAPI(),
                      builder: (context, snapShot) {
                        if (snapShot.hasData) {
                          List? image = snapShot.data;
                          return Image.network(
                            "${image!}",
                            height: height * 0.38,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            colorBlendMode: BlendMode.modulate,
                          );
                        } else if (snapShot.hasError) {
                          return Center(child: Text("${snapShot.error}"));
                        } else {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      },
                    ),
                    Container(
                      height: height * 0.38,
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          AppBarWidget(),
                          const Spacer(),
                          Text(
                            "Welcome to\nNew Aplanet",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 43,
                              color: Colors.white.withOpacity(0.86),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Spacer(),
                          SizedBox(height: height * 0.015),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: height * 0.65,
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Color(0xffc19e82),
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    children: [
                      FutureBuilder(
                          future: DBHelper.dbHelper
                              .fetchLastScreen(data: Global.lastScreenData),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return Text("Error${snapshot.error}");
                            } else if (snapshot.hasData) {
                              List<LastScreenFetch>? data = snapshot.data;
                              return Container(
                                height: height * 0.40,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: data!.length,
                                  itemBuilder: (context, i) {
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                        top: 10,
                                        bottom: 10,
                                        right: 15,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: height * 0.26,
                                            width: width * 0.5,
                                            decoration: BoxDecoration(
                                              color: Colors.blue,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              // image: DecorationImage(
                                              //   fit: BoxFit.cover,
                                              //   image:
                                              //       AssetImage(data[i].image),
                                              // ),
                                            ),
                                          ),
                                          const SizedBox(height: 3),
                                          // Text(
                                          //   data[i].name,
                                          //   style: TextStyle(
                                          //     color: Colors.white,
                                          //     fontSize: 20,
                                          //     fontWeight: FontWeight.w600,
                                          //   ),
                                          // ),
                                          // Text(
                                          //   data[i].description,
                                          //   style: TextStyle(
                                          //     color:
                                          //         Colors.white.withOpacity(0.8),
                                          //     fontWeight: FontWeight.w500,
                                          //   ),
                                          // ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              );
                            }
                            return const Center(
                                child: CircularProgressIndicator());
                          }),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
