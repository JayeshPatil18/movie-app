import 'package:flutter/material.dart';

import '../../../../shared/constants/colors.dart';
import '../../../../shared/constants/textstyle.dart';
import '../../../../shared/utils/methods.dart';
import '../../domain/entities/movie.dart';
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
                  height: 420,
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
                      Icon(Icons.star, color: starColor, size: 20),
                      SizedBox(width: 4),
                      Text(
                        '${widget.movie.voteAverage.toString()} (${widget.movie.voteCount})',
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(width: 12),
              Chip(
                label: Text(
                  'Popularity Score : ' + widget.movie.popularity.toString().split('.')[0],
                  style: TextStyle(
                    fontSize: 12, // Adjust the font size as needed
                    color: Colors.white, // Adjust the text color
                  ),
                ),
                backgroundColor: Colors.grey[800],
              )
              ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Release date',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 4),
                  Text(
                    formatDate(widget.movie.releaseDate),
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Genres',
                    style: TextStyle(color: Colors.grey),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 8, bottom: 4),
                    height: 40,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.movie.genres.length,
                      itemBuilder: (context, index) {
                        Genre genre = widget.movie.genres[index];
                        return GenreChip(label: genre.name);
                      },
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Overview',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 6),
                  Text(
                    widget.movie.overview,
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