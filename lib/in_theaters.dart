import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ticket_booking/model/in_theates_data.dart';

class InTheaters extends StatelessWidget {
  final List<InTheatersData> movies = _getDummyList();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 10 / 16),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Column(
          children: <Widget>[
            Expanded(
              child: Image.asset(
                movies[index].image,
                fit: BoxFit.cover,
              ),
            ),
            Text(movies[index].name),
          ],
        );
      },
      itemCount: movies.length,
    );
  }
}

List<InTheatersData> _getDummyList() {
  return [
    InTheatersData(image: 'assets/deadpool.jpeg', name: 'Deadpool 2'),
    InTheatersData(
        image: 'assets/the_shape_of_water.jpeg', name: 'The Shape of Water'),
    InTheatersData(image: 'assets/jusassic_world.jpg', name: 'Jurassic World'),
    InTheatersData(image: 'assets/tomb_rider.jpeg', name: 'Tomb Rider'),
  ];
}
