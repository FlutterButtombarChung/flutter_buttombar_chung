
# Flutter ButtomBar Chung

<p align="center">
  <img src="https://github.com/CHUNG-HAO/flutter_buttombar_chung/assets/67829896/961a8844-1cd0-4aec-aec4-14b93ff50306" alt="flutter_" />
</p>

`flutter_buttombar_chung` is a Flutter package that provides a bottom navigation bar with a wave effect. This bottom navigation bar has the following features and options:

- `items`: The list of items in the bottom navigation bar.
- `index`: The index of the currently selected item.
- `color`: The color of the navigation bar.
- `buttonBackgroundColor`: The background color of the button.
- `backgroundColor`: The background color of the navigation bar.
- `onTap`: The callback function when an item is tapped.
- `letIndexChange`: The function to allow index change.
- `animationCurve`: The animation curve.
- `animationDuration`: The duration of the animation.
- `height`: The height of the navigation bar.

In addition, this package provides the `FlutterButtombarChungItem` class for creating items in the bottom navigation bar. Each item has an icon (`child`), an optional label (`label`), and an optional label style (`labelStyle`).

## Installation

Add the following dependency in your `pubspec.yaml` file:

```yaml
dependencies:
  flutter_buttombar_chung: ^0.0.1
```

## Usage
```yaml
import 'package:flutter_buttombar_chung/flutter_buttombar_chung.dart';

```

## DEMO


https://github.com/CHUNG-HAO/flutter_buttombar_chung/assets/67829896/74d96d27-b21b-41c4-90eb-465ef08983e8


## Gatting start
```dart
 bottomNavigationBar: FlutterButtomBarChung(
          index: 0,
          color: Colors.white,
          buttonBackgroundColor: Colors.blue,
          backgroundColor: Colors.blueAccent,
          animationCurve: Curves.easeOut,
          animationDuration: Duration(milliseconds: 600),
          height: 70.0,
          items: <FlutterButtombarChungItem>[
            FlutterButtombarChungItem(
              icon: Icons.home,
              label: 'Home',
              labelStyle: TextStyle(color: Colors.white),
            ),
            FlutterButtombarChungItem(
              icon: Icons.search,
              label: 'Search',
              labelStyle: TextStyle(color: Colors.white),
            ),
            FlutterButtombarChungItem(
              icon: Icons.person,
              label: 'Profile',
              labelStyle: TextStyle(color: Colors.white),
            ),
          ],
          onTap: (index) {
            
          },
        ),
```


## License

```MIT
MIT License

Copyright (c) [year] [fullname]

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

