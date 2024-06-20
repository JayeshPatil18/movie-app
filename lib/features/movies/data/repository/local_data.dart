import 'dart:math';

import '../../domain/entities/movie.dart';

// List<Movie> movies = [
//   Movie(
//     movieId: 1,
//     posterUrl: 'https://via.placeholder.com/150',
//     title: 'Inception',
//     releaseDate: '2010-07-16',
//     rating: 5,
//   ),
//   Movie(
//     movieId: 2,
//     posterUrl: 'https://via.placeholder.com/150',
//     title: 'The Dark Knight',
//     releaseDate: '2008-07-18',
//     rating: 5,
//   ),
//   Movie(
//     movieId: 3,
//     posterUrl: 'https://via.placeholder.com/150',
//     title: 'Interstellar',
//     releaseDate: '2014-11-07',
//     rating: 5,
//   ),
//   Movie(
//     movieId: 4,
//     posterUrl: 'https://via.placeholder.com/150',
//     title: 'The Matrix',
//     releaseDate: '1999-03-31',
//     rating: 5,
//   ),
//   Movie(
//     movieId: 5,
//     posterUrl: 'https://via.placeholder.com/150',
//     title: 'The Shawshank Redemption',
//     releaseDate: '1994-09-23',
//     rating: 5,
//   ),
//   Movie(
//     movieId: 6,
//     posterUrl: 'https://via.placeholder.com/150',
//     title: 'Pulp Fiction',
//     releaseDate: '1994-10-14',
//     rating: 5,
//   ),
//   Movie(
//     movieId: 7,
//     posterUrl: 'https://via.placeholder.com/150',
//     title: 'Fight Club',
//     releaseDate: '1999-10-15',
//     rating: 5,
//   ),
//   Movie(
//     movieId: 8,
//     posterUrl: 'https://via.placeholder.com/150',
//     title: 'Forrest Gump',
//     releaseDate: '1994-07-06',
//     rating: 5,
//   ),
//   Movie(
//     movieId: 9,
//     posterUrl: 'https://via.placeholder.com/150',
//     title: 'The Godfather',
//     releaseDate: '1972-03-24',
//     rating: 5,
//   ),
//   Movie(
//     movieId: 10,
//     posterUrl: 'https://via.placeholder.com/150',
//     title: 'The Lord of the Rings: The Return of the King',
//     releaseDate: '2003-12-17',
//     rating: 5,
//   ),
// ];

List<String> posterUrl = [
  'https://m.media-amazon.com/images/M/MV5BNDE3ODcxYzMtY2YzZC00NmNlLWJiNDMtZDViZWM2MzIxZDYwXkEyXkFqcGdeQXVyNjAwNDUxODI@._V1_FMjpg_UX1200_.jpg',
  'https://m.media-amazon.com/images/M/MV5BZjdkOTU3MDktN2IxOS00OGEyLWFmMjktY2FiMmZkNWIyODZiXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_.jpg'
  'https://m.media-amazon.com/images/M/MV5BYzhiNDkyNzktNTZmYS00ZTBkLTk2MDAtM2U0YjU1MzgxZjgzXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_.jpg',
  'https://m.media-amazon.com/images/I/71DwIcSgFcS.jpg',
  'https://m.media-amazon.com/images/M/MV5BMmEzNTkxYjQtZTc0MC00YTVjLTg5ZTEtZWMwOWVlYzY0NWIwXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_FMjpg_UX1000_.jpg',
  'https://m.media-amazon.com/images/M/MV5BOTUwODM5MTctZjczMi00OTk4LTg3NWUtNmVhMTAzNTNjYjcyXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_.jpg',
  'https://images-cdn.ubuy.co.in/6345f652ec87e81aa558cd24-ubuy-online-shopping.jpg',
];

int getRandomIndex(List<String> array) {
  final random = Random();
  return random.nextInt(array.length);
}