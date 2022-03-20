import 'package:flutter/material.dart';
import 'package:gallery_app/data/images.dart';
import 'package:gallery_app/pages/description_page.dart';

class GalleryPage extends StatefulWidget {
  GalleryPage();

  @override
  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: data.length,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text('Gallery App', style: TextStyle(color: Colors.red)),
            bottom: _menu(),
          ),
          body: _content(),
        ),
      );

  TabBar _menu() => TabBar(
      labelColor: Colors.black,
      indicatorColor: Colors.red,
      isScrollable: true,
      tabs: [...data.map((cat) => Tab(text: cat['category']))]);

  TabBarView _content() => TabBarView(
        children: [...data.map((cat) => _images(images: cat['images']))],
      );

  Widget _images({required List<Map<String, String>> images}) => GridView.count(
      crossAxisCount: 2,
      children: images
          .map((image) => GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DescriptionPage(image)),
                ),
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 10),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image(
                            image: AssetImage(image['url'].toString()),
                            fit: BoxFit.fill))),
              ))
          .toList());
}
