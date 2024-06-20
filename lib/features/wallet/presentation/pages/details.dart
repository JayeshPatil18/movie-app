import 'package:flutter/material.dart';

import '../../../../shared/constants/colors.dart';
import '../../../../shared/constants/textstyle.dart';
import '../../domain/entities/entite.dart';
import '../widgets/button.dart';
import '../widgets/genre_chip.dart';

class ViewDetails extends StatefulWidget {
  final Movie movie;

  const ViewDetails({super.key, required this.movie});

  @override
  _ViewDetailsState createState() => _ViewDetailsState();
}

class _ViewDetailsState extends State<ViewDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary60,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 400,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(widget.movie.posterUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 20,
                  left: 16,
                  child: Icon(Icons.arrow_back, color: Colors.white),
                ),
                Positioned(
                  top: 320,
                  left: 16,
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: blue10,
                    child: Icon(Icons.play_arrow, color: text, size: 40),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.movie.title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.timer, color: Colors.grey, size: 20),
                      SizedBox(width: 4),
                      Text(
                        '152 minutes',
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(width: 16),
                      Icon(Icons.star, color: starColor, size: 20),
                      SizedBox(width: 4),
                      Text(
                        '${widget.movie.voteAverage.toString()} (${widget.movie.voteCount})',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Release date',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'December 9, 2017',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Genre',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      GenreChip(label: 'Action'),
                      SizedBox(width: 8),
                      GenreChip(label: 'Sci-Fi'),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Synopsis',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Rey (Daisy Ridley) finally manages to find the legendary Jedi knight, Luke Skywalker (Mark Hamill) on an island with a magical aura. The heroes of The Force Awakens including Leia, Finn Read more..',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}