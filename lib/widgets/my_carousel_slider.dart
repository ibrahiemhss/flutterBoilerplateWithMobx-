import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:my_boilerplate/constants/colors.dart';
import 'package:my_boilerplate/constants/dimens.dart';

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

class Carousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: '/', routes: {
      '/': (ctx) => CarouselHome(),
      '/basic': (ctx) => Basic(),
      '/nocenter': (ctx) => NoCenter(),
      '/image': (ctx) => ImageSlider(),
      '/complicated': (ctx) => ComplicatedImage(),
      '/enlarge': (ctx) => EnlargeStrategy(),
      '/manual': (ctx) => ManuallyControlledSlider(),
      '/noloop': (ctx) => NoonLooping(),
      '/vertical': (ctx) => VerticalSlider(),
      '/fullscreen': (ctx) => FullscreenSlider(),
      '/ondemand': (ctx) => OnDemandCarousel(),
      '/indicator': (ctx) => CarouselWithIndicator(),
      '/prefetch': (ctx) => PrefetchImage(),
      '/reason': (ctx) => CarouselChangeReason(),
      '/position': (ctx) => KeepPageviewPosition(),
      '/multiple': (ctx) => MultipleItem(),
    });
  }
}

class Item extends StatelessWidget {
  final String title;
  final String route;
  Item(this.title, this.route);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.pushNamed(context, route);
      },
    );
  }
}

class CarouselHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carousel '),
      ),
      body: ListView(
        children: <Widget>[
          Item('Basic ', '/basic'),
          Item('No center mode ', '/nocenter'),
          Item('Image carousel slider', '/image'),
          Item('More complicated image slider', '/complicated'),
          Item('Enlarge strategy  slider', '/enlarge'),
          Item('Manually controlled slider', '/manual'),
          Item('Noon-looping carousel slider', '/noloop'),
          Item('Vertical carousel slider', '/vertical'),
          Item('Fullscreen carousel slider', '/fullscreen'),
          Item('Carousel with indicator ', '/indicator'),
          Item('On-demand carousel slider', '/ondemand'),
          Item('Image carousel slider with prefetch ', '/prefetch'),
          Item('Carousel change reason ', '/reason'),
          Item('Keep pageview position ', '/position'),
          Item('Multiple item in one screen ', '/multiple'),
        ],
      ),
    );
  }
}

class Basic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<int> list = [1, 2, 3, 4, 5];
    return Scaffold(
      appBar: AppBar(title: Text('Basic ')),
      body: Container(
          child: CarouselSlider(
        options: CarouselOptions(),
        items: list
            .map((item) => Container(
                  child: Center(child: Text(item.toString())),
                  color: Colors.green,
                ))
            .toList(),
      )),
    );
  }
}

class NoCenter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<int> list = [1, 2, 3, 4, 5];
    return Scaffold(
      appBar: AppBar(title: Text('Basic ')),
      body: Container(
          child: CarouselSlider(
        options: CarouselOptions(
          disableCenter: true,
        ),
        items: list
            .map((item) => Container(
                  child: Text(item.toString()),
                  color: Colors.green,
                ))
            .toList(),
      )),
    );
  }
}

class ImageSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Image slider ')),
      body: Container(
          child: CarouselSlider(
        options: CarouselOptions(),
        items: imgList
            .map((item) => Container(
                  child: Center(
                      child:
                          Image.network(item, fit: BoxFit.cover, width: 1000)),
                ))
            .toList(),
      )),
    );
  }
}

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image.network(item, fit: BoxFit.cover, width: 1000.0),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: Text(
                          'No. ${imgList.indexOf(item)} image',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ))
    .toList();

class ComplicatedImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Complicated image slider ')),
      body: Container(
          child: Column(
        children: <Widget>[
          CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              aspectRatio: 2.0,
              enlargeCenterPage: true,
            ),
            items: imageSliders,
          ),
        ],
      )),
    );
  }
}

class EnlargeStrategy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Complicated image slider ')),
      body: Container(
          child: Column(
        children: <Widget>[
          CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              aspectRatio: 2.0,
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
            ),
            items: imageSliders,
          ),
        ],
      )),
    );
  }
}

class ManuallyControlledSlider extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ManuallyControlledSliderState();
  }
}

class _ManuallyControlledSliderState extends State<ManuallyControlledSlider> {
  final CarouselController _controller = CarouselController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Manually controlled slider')),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              CarouselSlider(
                items: imageSliders,
                options: CarouselOptions(enlargeCenterPage: true, height: 200),
                carouselController: _controller,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                    child: RaisedButton(
                      onPressed: () => _controller.previousPage(),
                      child: Text('←'),
                    ),
                  ),
                  Flexible(
                    child: RaisedButton(
                      onPressed: () => _controller.nextPage(),
                      child: Text('→'),
                    ),
                  ),
                  ...Iterable<int>.generate(imgList.length).map(
                    (int pageIndex) => Flexible(
                      child: RaisedButton(
                        onPressed: () => _controller.animateToPage(pageIndex),
                        child: Text("$pageIndex"),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}

class NoonLooping extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Noon-looping carousel ')),
      body: Container(
          child: CarouselSlider(
        options: CarouselOptions(
          aspectRatio: 2.0,
          enlargeCenterPage: true,
          enableInfiniteScroll: false,
          initialPage: 2,
          autoPlay: true,
        ),
        items: imageSliders,
      )),
    );
  }
}

class VerticalSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Vertical sliding carousel ')),
      body: Container(
          child: CarouselSlider(
        options: CarouselOptions(
          aspectRatio: 2.0,
          enlargeCenterPage: true,
          scrollDirection: Axis.vertical,
          autoPlay: true,
        ),
        items: imageSliders,
      )),
    );
  }
}

class FullscreenSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Fullscreen sliding carousel ')),
      body: Builder(
        builder: (context) {
          final double height = MediaQuery.of(context).size.height;
          return CarouselSlider(
            options: CarouselOptions(
              height: height,
              viewportFraction: 1.0,
              enlargeCenterPage: false,
              // autoPlay: false,
            ),
            items: imgList
                .map((item) => Container(
                      child: Center(
                          child: Image.network(
                        item,
                        fit: BoxFit.cover,
                        height: height,
                      )),
                    ))
                .toList(),
          );
        },
      ),
    );
  }
}

class OnDemandCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('On-demand carousel ')),
      body: Container(
          child: CarouselSlider.builder(
        itemCount: 100,
        options: CarouselOptions(
          aspectRatio: 2.0,
          enlargeCenterPage: true,
          autoPlay: true,
        ),
        itemBuilder: (ctx, index, realIdx) {
          return Container(
            child: Text(index.toString()),
          );
        },
      )),
    );
  }
}

class CarouselWithIndicator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicator> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      'https://images.unsplash.com/photo-1586882829491-b81178aa622e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2850&q=80',
      'https://images.unsplash.com/photo-1586871608370-4adee64d1794?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2862&q=80',
      'https://images.unsplash.com/photo-1586901533048-0e856dff2c0d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',
      'https://images.unsplash.com/photo-1586902279476-3244d8d18285?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2850&q=80',
      'https://images.unsplash.com/photo-1586943101559-4cdcf86a6f87?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1556&q=80',
      'https://images.unsplash.com/photo-1586951144438-26d4e072b891?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',
      'https://images.unsplash.com/photo-1586953983027-d7508a64f4bb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',
    ];

    return Scaffold(
      // appBar: AppBar(title: Text('Carousel with indicator ')),
      body: Container(
        child: Column(children: [
          Container(
              height: Dimens.getScaledHeight(context, 0.17),
              child: CarouselSlider.builder(
                itemCount: images.length,
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 3.0,
                  onPageChanged: (index, iii) {
                    setState(() {
                      _current = index;
                    });
                  },

                  // enlargeCenterPage: true,
                ),
                itemBuilder: (context, index, realIdx) {
                  return Container(
                      child: Center(
                    child: Image.network(
                      images[index],
                      fit: BoxFit.cover,
                      width: Dimens.getScaledWidth(context, 0.60),
                    ),
                  ));
                },
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: imgList.map((url) {
              int index = imgList.indexOf(url);
              return Padding(
                padding: const EdgeInsets.only(top: 3.0, left: 1, right: 1),
                child: Container(
                  height: Dimens.getScaledWidth(context, 0.03),
                  width: Dimens.getScaledWidth(context, 0.03),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.mainColor[700]!),
                    color: _current == index
                        ? AppColors.mainColor[900]!
                        : Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(
                            50.0) //                 <--- border radius here
                        ),
                  ),
                ),
              );
            }).toList(),
          ),
        ]),
      ),
    );
  }
}

class PrefetchImage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PrefetchImageState();
  }
}

class _PrefetchImageState extends State<PrefetchImage> {
  final List<String> images = [
    'https://images.unsplash.com/photo-1586882829491-b81178aa622e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2850&q=80',
    'https://images.unsplash.com/photo-1586871608370-4adee64d1794?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2862&q=80',
    'https://images.unsplash.com/photo-1586901533048-0e856dff2c0d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',
    'https://images.unsplash.com/photo-1586902279476-3244d8d18285?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2850&q=80',
    'https://images.unsplash.com/photo-1586943101559-4cdcf86a6f87?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1556&q=80',
    'https://images.unsplash.com/photo-1586951144438-26d4e072b891?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',
    'https://images.unsplash.com/photo-1586953983027-d7508a64f4bb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',
  ];

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      images.forEach((imageUrl) {
        precacheImage(NetworkImage(imageUrl), context);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('Prefetch image slider ')),
      body: Container(
          child: CarouselSlider.builder(
        itemCount: images.length,
        options: CarouselOptions(
          autoPlay: true,
          aspectRatio: 2.0,
          enlargeCenterPage: true,
        ),
        itemBuilder: (context, index, realIdx) {
          return Container(
            child: Center(
                child: Image.network(images[index],
                    fit: BoxFit.cover, width: 1000)),
          );
        },
      )),
    );
  }
}

class CarouselChangeReason extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CarouselChangeReasonState();
  }
}

class _CarouselChangeReasonState extends State<CarouselChangeReason> {
  String reason = '';
  final CarouselController _controller = CarouselController();

  void onPageChange(int index, CarouselPageChangedReason changeReason) {
    setState(() {
      reason = changeReason.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(title: Text('Change reason ')),
        body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          CarouselSlider(
            items: imageSliders,
            options: CarouselOptions(
              enlargeCenterPage: true,
              aspectRatio: 16 / 9,
              onPageChanged: onPageChange,
              autoPlay: true,
            ),
            carouselController: _controller,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                child: RaisedButton(
                  onPressed: () => _controller.previousPage(),
                  child: Text('←'),
                ),
              ),
              Flexible(
                child: RaisedButton(
                  onPressed: () => _controller.nextPage(),
                  child: Text('→'),
                ),
              ),
              ...Iterable<int>.generate(imgList.length).map(
                (int pageIndex) => Flexible(
                  child: RaisedButton(
                    onPressed: () => _controller.animateToPage(pageIndex),
                    child: Text("$pageIndex"),
                  ),
                ),
              ),
            ],
          ),
          Center(
            child: Column(
              children: [
                Text('page change reason: '),
                Text(reason),
              ],
            ),
          )
        ],
      ),
    ));
  }
}

class KeepPageviewPosition extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('Keep pageview position ')),
      body: ListView.builder(itemBuilder: (ctx, index) {
        if (index == 3) {
          return Container(
              child: CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 2.0,
              enlargeCenterPage: true,
              pageViewKey: PageStorageKey<String>('carousel_slider'),
            ),
            items: imageSliders,
          ));
        } else {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            color: Colors.blue,
            height: 200,
            child: Center(
              child: Text('other content'),
            ),
          );
        }
      }),
    );
  }
}

class MultipleItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('Multiple item in one slide ')),
      body: Container(
          child: CarouselSlider.builder(
        options: CarouselOptions(
          aspectRatio: 2.0,
          enlargeCenterPage: false,
          viewportFraction: 1,
        ),
        itemCount: (imgList.length / 2).round(),
        itemBuilder: (context, index, realIdx) {
          final int first = index * 2;
          final int second = first + 1;
          return Row(
            children: [first, second].map((idx) {
              return Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Image.network(imgList[idx], fit: BoxFit.cover),
                ),
              );
            }).toList(),
          );
        },
      )),
    );
  }
}
