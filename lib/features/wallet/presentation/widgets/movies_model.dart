import 'package:assessment/features/wallet/presentation/widgets/poster_shimmer.dart';
import 'package:assessment/shared/constants/colors.dart';
import 'package:assessment/shared/constants/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../shared/constants/values.dart';
import '../../domain/entities/entite.dart';


class MovieModel extends StatefulWidget {
  final Movie movie;

  MovieModel({required this.movie});

  @override
  State<MovieModel> createState() => _MovieModelState();
}

class _MovieModelState extends State<MovieModel> {


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.pushNamed(context, 'view_review', arguments: IdArguments(widget.reviewId));
      },
      child: Container(
        decoration: BoxDecoration(
            // color: secondary30,
            borderRadius:
            BorderRadius.circular(borderRadius)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Stack(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(
                          borderRadius),
                      child: widget.movie.posterUrl == 'null'
                          ? SizedBox(
                        height: 156,
                        width: 156,
                        child: Shimmer.fromColors(
                          baseColor: Color(0xFFe4e4e4),
                          highlightColor: Color(0xFFCDCDCD),
                          child: Container(
                            height: 156,
                            width: 156,
                            color: Colors.white,
                          ),
                        ),
                      )
                          : CustomImageShimmer(posterUrl: widget.movie.posterUrl, width: 156, height: 156, fit: BoxFit.fitHeight)),
                ],
              ),
            ),
            Container(
              child: Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 4, right: 4, top: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 2),
                      Text(widget.movie.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: movieTitle),
                      SizedBox(height: 4),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                widget.movie.releaseDate.substring(0, 4),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: subTitle),
                            Row(
                              children: [
                                Icon(Icons.star, size: 16, color: starColor),
                                SizedBox(width: 4),
                                Text(
                                  widget.movie.rating.toString(),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: subTitle)
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 4),
                    ],
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}