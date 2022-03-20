import 'package:flutter/material.dart';

class DescriptionPage extends StatelessWidget {
  DescriptionPage(this.image);
  final Map<String, String> image;

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
          title: Text('Detalle de imagen', style: TextStyle(color: Colors.red)),
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.red)),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
            width: double.infinity,
            height: 300,
            child: ClipRRect(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25)),
                child: Image(
                    image: AssetImage(image['url'].toString()),
                    fit: BoxFit.fill))),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(image['description'].toString(),
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: Colors.grey.shade800)),
              SizedBox(height: 20),
              Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 4,
                  children: [
                    Icon(Icons.favorite, color: Colors.grey.shade600),
                    Text(
                      '100',
                      style: TextStyle(color: Colors.grey.shade600),
                    )
                  ]),
              SizedBox(height: 10),
              Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 4,
                  children: [
                    Icon(Icons.calendar_today, color: Colors.grey.shade600),
                    Text(
                      image['date'].toString(),
                      style: TextStyle(color: Colors.grey.shade600),
                    )
                  ])
            ],
          ),
        )
      ]));
}
