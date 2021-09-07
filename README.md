# Flutter Board

```dart
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
```
---
### 🚧 Maintener
[![account avatar][]][github account] <br>
**Farhan Fadila** <br>
📫 How to reach me: farhan.fadila1717@gmail.com

### ❤️ Suport Maintener
[![badge paypal][]][paypal account] [![badge linktree][]][linktree account]


[account avatar]: https://avatars.githubusercontent.com/u/43161050?s=80
[github account]: https://github.com/farhanfadila1717
[badge linktree]: https://img.shields.io/badge/Donate-farhanfadila-orange
[linktree account]: https://linktr.ee/farhanfadila
[badge paypal]: https://img.shields.io/badge/Donate-PayPal-00457C?logo=paypal
[paypal account]: https://www.paypal.me/farhanfadila1717