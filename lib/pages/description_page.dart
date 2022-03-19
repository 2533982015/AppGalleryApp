import 'package:flutter/material.dart';

class DescriptionPage extends StatelessWidget {
  DescriptionPage(this.image);
  final Map<String, String> image;

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar:
          AppBar(title: Text('Detalle de imagen'), backgroundColor: Colors.red),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
              width: double.infinity,
              height: 300,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image(
                      image: AssetImage(image['url'].toString()),
                      fit: BoxFit.fill))),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text(image['description'].toString(),
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: Colors.grey.shade800)),
          ),
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
        ]),
      ));
}
