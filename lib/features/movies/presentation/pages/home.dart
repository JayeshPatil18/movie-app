import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../../shared/constants/colors.dart';
import '../../../../shared/constants/textstyle.dart';
import '../../../../shared/constants/values.dart';
import '../../data/repository/local_data.dart';
import '../../domain/entities/movie.dart';
import '../../domain/repository/movies_service.dart';
import '../widgets/button.dart';
import '../widgets/movies_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static String searchText = '';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchTextController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  MovieService movieService = MovieService();
  List<Movie> movies = [];

  void fetchMovies() async {
    try {
      List<Movie> fetchedMovies = await movieService.getMovies();
      setState(() {
        movies = fetchedMovies;
      });
    } catch (e) {
      print('Error fetching movies: $e');
    }
  }

  void searchMovies() {
    if(HomePage.searchText.isNotEmpty){
      List<Movie> movieFiltered = movies.skipWhile((Movie element) {
        return !(element.title.toLowerCase().contains(HomePage.searchText.toLowerCase()));
      }).toList();

      if(movieFiltered.isNotEmpty){
        setState(() {
          movies = movieFiltered;
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    fetchMovies();
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary60,
      body: SafeArea(
        bottom: false,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverList(
                delegate: SliverChildListDelegate([
                  Container(
                    margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              child: TextField(
                                style: textFieldText,
                                focusNode: _focusNode,
                                controller: searchTextController,
                                // cursorHeight: cursorHeight,
                                cursorColor: blue10,
                                onChanged: (value) {
                                    setState(() {
                                      HomePage.searchText =
                                          value.trim().toLowerCase();
                                    });

                                  searchMovies();
                                },
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(
                                      top: 16, bottom: 16, left: 20, right: 45),
                                  fillColor: secondary30,
                                  filled: true,
                                  hintText: 'Search Products',
                                  hintStyle: hintFieldText,
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.circular(borderRadius),
                                    borderSide: const BorderSide(
                                      width: 0,
                                      style: BorderStyle.none,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(borderRadius),
                                      borderSide: BorderSide(
                                          width: 1.0, color: blue10)),
                                ),
                              ),
                            ),
                            Positioned(
                                right: 8,
                                child: searchTextController.text != ''
                                    ? GestureDetector(
                                        onTap: () {
                                          searchTextController.text = '';
                                          setState(() {
                                            HomePage.searchText = '';
                                          });
                                        },
                                        child: Container(
                                          padding: EdgeInsets.only(right: 4),
                                          child: Icon(Icons.close,
                                              color: lightText),
                                        ),
                                      )
                                    : Container(
                                        padding: EdgeInsets.only(right: 4),
                                        child: Icon(Icons.search,
                                            color: _focusNode.hasFocus
                                                ? blue10
                                                : lightText),
                                      )),

                            // Positioned(
                            //     right: 8,
                            //     child: CircleIconContainer(
                            //         icon: const Icon(Icons.search,
                            //             color: AppColors.primaryColor30),
                            //         containerColor: AppColors.secondaryColor10,
                            //         containerSize: 40)),
                          ],
                        ),
                        SizedBox(height: 20)
                      ],
                    ),
                  ),
                ]),
              )
            ];
          },
          body: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 25, bottom: 10),
                  child: Text('Movie Recommendation', style: labelTextStyle),
                ),
                Expanded(
                    child: movies.isNotEmpty
                        ? GridView.builder(
                            padding: EdgeInsets.only(
                                top: 10, bottom: 100, left: 20, right: 20),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisSpacing: 20,
                                    mainAxisSpacing: 20,
                                    crossAxisCount: 2,
                                    childAspectRatio: (100 / 165)),
                            scrollDirection: Axis.vertical,
                            itemCount: movies.length,
                            itemBuilder: (BuildContext context, int index) {
                              Movie movie = movies[index];
                              movie.posterUrl =
                                  posterUrl[getRandomIndex(posterUrl)];

                              if(movies.isEmpty){
                                return Center(child: Text('Movies not found!', style: labelTextStyle));
                              }

                              return MovieModel(movie: movie);
                            })
                        : Center(
                            child: CircularProgressIndicator(color: text),
                          )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
