import 'package:flutter/material.dart';
import 'package:my_api/api/coin_api.dart';
import 'package:my_api/model/model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<MainModel>? myResponse;
  late PageController controller;
  int thePage = 0;

  @override
  void initState() {
    controller = PageController(
      initialPage: thePage,
    );
    myResponse = getRequest();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade200,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  "Bitcoin",
                  style: TextStyle(
                    fontSize: 40.0,
                    color: Colors.brown,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                Center(
                  child: FutureBuilder(
                    future: myResponse,
                    builder: (BuildContext context,
                        AsyncSnapshot<MainModel> snapshot) {
                      if (!(snapshot.hasData)) {
                        return const LinearProgressIndicator(
                          minHeight: 10.0,
                          backgroundColor: Colors.grey,
                          color: Colors.brown,
                        );
                      }
                      return myResponse == null
                          ? const Center(
                              child: Text(
                                "Can't load data...try again",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.brown,
                                ),
                              ),
                            )
                          : Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "Updated Time:\n${snapshot.data!.time.updated}",
                                    style: const TextStyle(
                                      fontSize: 30.0,
                                      color: Colors.brown,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                  Container(
                                    height: 400.0,
                                    width: 400.0,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: Colors.brown.shade700,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: PageView(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      controller: controller,
                                      children: <Widget>[
                                        //
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Text(
                                                "Information:\n${snapshot.data!.bpi.usd.code}\n",
                                                style: const TextStyle(
                                                  fontSize: 24.0,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              Text(
                                                "Rate:\n${snapshot.data!.bpi.usd.rate}\n",
                                                style: const TextStyle(
                                                  fontSize: 24.0,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              Text(
                                                "Description:\n${snapshot.data!.bpi.usd.description}\n",
                                                style: const TextStyle(
                                                  fontSize: 24.0,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              Text(
                                                "Rate-Float:\n${snapshot.data!.bpi.usd.rateFloat}\n",
                                                style: const TextStyle(
                                                  fontSize: 24.0,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  setState(
                                                    () {
                                                      thePage++;
                                                      controller.nextPage(
                                                        duration:
                                                            const Duration(
                                                          seconds: 2,
                                                        ),
                                                        curve: Curves.bounceOut,
                                                      );
                                                    },
                                                  );
                                                },
                                                child: const Icon(
                                                  Icons
                                                      .keyboard_double_arrow_right,
                                                  color: Colors.white,
                                                  size: 30.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),

                                        //

                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Text(
                                                "Information:\n${snapshot.data!.bpi.gbp.code}\n",
                                                style: const TextStyle(
                                                  fontSize: 24.0,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              Text(
                                                "Rate:\n${snapshot.data!.bpi.gbp.rate}\n",
                                                style: const TextStyle(
                                                  fontSize: 24.0,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              Text(
                                                "Description:\n${snapshot.data!.bpi.gbp.description}\n",
                                                style: const TextStyle(
                                                  fontSize: 24.0,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              Text(
                                                "Rate-Float:\n${snapshot.data!.bpi.gbp.rateFloat}\n",
                                                style: const TextStyle(
                                                  fontSize: 24.0,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  GestureDetector(
                                                    onTap: () {
                                                      setState(
                                                        () {
                                                          thePage++;
                                                          controller
                                                              .previousPage(
                                                            duration:
                                                                const Duration(
                                                              seconds: 2,
                                                            ),
                                                            curve: Curves
                                                                .bounceOut,
                                                          );
                                                        },
                                                      );
                                                    },
                                                    child: const Icon(
                                                      Icons
                                                          .keyboard_double_arrow_left,
                                                      color: Colors.white,
                                                      size: 30.0,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 10.0,
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      setState(
                                                        () {
                                                          thePage++;
                                                          controller.nextPage(
                                                            duration:
                                                                const Duration(
                                                              seconds: 2,
                                                            ),
                                                            curve: Curves
                                                                .bounceOut,
                                                          );
                                                        },
                                                      );
                                                    },
                                                    child: const Icon(
                                                      Icons
                                                          .keyboard_double_arrow_right,
                                                      color: Colors.white,
                                                      size: 30.0,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),

                                        //

                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Text(
                                                "Information:\n${snapshot.data!.bpi.eur.code}\n",
                                                style: const TextStyle(
                                                  fontSize: 24.0,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              Text(
                                                "Rate:\n${snapshot.data!.bpi.eur.rate}\n",
                                                style: const TextStyle(
                                                  fontSize: 24.0,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              Text(
                                                "Description:\n${snapshot.data!.bpi.eur.description}\n",
                                                style: const TextStyle(
                                                  fontSize: 24.0,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              Text(
                                                "Rate-Float:\n${snapshot.data!.bpi.eur.rateFloat}\n",
                                                style: const TextStyle(
                                                  fontSize: 24.0,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  setState(
                                                    () {
                                                      thePage++;
                                                      controller.previousPage(
                                                        duration:
                                                            const Duration(
                                                          seconds: 2,
                                                        ),
                                                        curve: Curves.bounceOut,
                                                      );
                                                    },
                                                  );
                                                },
                                                child: const Icon(
                                                  Icons
                                                      .keyboard_double_arrow_left,
                                                  color: Colors.white,
                                                  size: 30.0,
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
                            );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
