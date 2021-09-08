## [![cover][]][cover] <br>
A Simply create introduction board in Flutter, create [Boading] based on parent key.
---
```dart
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
```
---
### 🚧 Maintener
[![account avatar][]][github account] <br>
**Farhan Fadila** <br>
📫 How to reach me: farhan.fadila1717@gmail.com

### ❤️ Suport Maintener
[![badge paypal][]][paypal account] [![badge linktree][]][linktree account]

[cover]: https://github.com/farhanfadila1717/flutter_package/blob/master/display/flutter_boarding/flutter%20boarding.png
[account avatar]: https://avatars.githubusercontent.com/u/43161050?s=80
[github account]: https://github.com/farhanfadila1717
[badge linktree]: https://img.shields.io/badge/Donate-farhanfadila-orange
[linktree account]: https://linktr.ee/farhanfadila
[badge paypal]: https://img.shields.io/badge/Donate-PayPal-00457C?logo=paypal
[paypal account]: https://www.paypal.me/farhanfadila1717