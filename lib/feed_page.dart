import 'package:flutter/material.dart';

class FeedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "instagram",
          style: TextStyle(fontFamily: "VeganStyle"),
        ),
      ),
      body: ListView.builder(
        itemBuilder: feedListBuilder,
        itemCount: 40,
      ),
    );
  }

  Widget feedListBuilder(BuildContext context, int index) {
    return Container(
      height: 100,
      color: Colors.accents[index % Colors.accents.length],
    );
  }
}
