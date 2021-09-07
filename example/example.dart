import 'package:flutter/material.dart';
import 'package:flutter_boarding/flutter_boarding.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Example Card Loading',
      debugShowCheckedModeBanner: false,
      home: ExamplePage(),
    );
  }
}

class ExamplePage extends StatefulWidget {
  const ExamplePage({Key? key}) : super(key: key);

  @override
  _ExamplePageState createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  late List<GlobalKey> _keys;
  late BoardingController _boardingController;

  @override
  void initState() {
    _keys = List.generate(3, (index) => GlobalObjectKey(index));
    _boardingController = BoardingController();
    super.initState();
  }

  @override
  void dispose() {
    _boardingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Example"),
      ),
      body: Stack(
        children: [
          SizedBox.expand(
            child: ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 30,
                      width: size.width * .2,
                      padding: const EdgeInsets.only(bottom: 10),
                      color: Colors.grey,
                    )
                  ],
                );
              },
            ),
          ),
          Positioned(
            top: 20,
            right: 100,
            child: Container(
              key: _keys[2],
              width: 100,
              height: 50,
              color: Colors.amber,
            ),
          ),
          Positioned(
            top: 20,
            right: 50,
            child: FloatingActionButton(
              key: _keys[1],
              onPressed: () {
                _boardingController.showBoarding(
                  context,
                  content: BoardingContent(
                    items: <BoardingWidget>[
                      BoardingWidget(
                        leading: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.access_alarm,
                              color: Colors.white,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              "Boarding 1",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        boardingItem: [
                          BoardingItem(
                            icon: Icon(
                              Icons.group,
                              size: 18,
                            ),
                            message:
                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                          ),
                          BoardingItem(
                            icon: Icon(
                              Icons.history,
                              size: 18,
                            ),
                            message:
                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                          ),
                        ],
                      ),
                      BoardingWidget(
                        leading: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.access_alarm,
                              color: Colors.white,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              "Boarding 2",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        boardingItem: [
                          BoardingItem(
                            icon: Icon(
                              Icons.group,
                              size: 18,
                            ),
                            message:
                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                          ),
                          BoardingItem(
                            icon: Icon(
                              Icons.history,
                              size: 18,
                            ),
                            message:
                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                          ),
                        ],
                      ),
                      BoardingWidget(
                        leading: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.access_alarm,
                              color: Colors.white,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              "Boarding 3",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        boardingItem: [
                          BoardingItem(
                            icon: Icon(
                              Icons.group,
                              size: 18,
                            ),
                            message:
                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                          ),
                          BoardingItem(
                            icon: Icon(
                              Icons.history,
                              size: 18,
                            ),
                            message:
                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                          ),
                        ],
                      ),
                    ],
                    keys: _keys,
                  ),
                );
              },
            ),
          ),
          Positioned(
            bottom: 20,
            left: 50,
            child: Container(
              key: _keys[0],
              width: 200,
              height: 50,
              color: Colors.amber,
            ),
          ),
        ],
      ),
    );
  }
}
