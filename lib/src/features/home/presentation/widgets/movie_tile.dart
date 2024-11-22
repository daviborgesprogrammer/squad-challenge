import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/image_constant.dart';
import '../../../../core/theme/text_styles.dart';
import '../../domain/entities/movie.dart';

class MovieTile extends StatelessWidget {
  final Movie movie;
  const MovieTile(this.movie, {super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: CachedNetworkImageProvider(
            movie.poster!,
          ), // Using CachedNetworkImageProvider
          fit: BoxFit.cover,
          child: InkWell(
            onTap: () {
              Navigator.of(context).pushNamed('/movie', arguments: movie);
            },
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.black26,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        movie.title ?? '',
                        style: context.textStyles.textBold
                            .copyWith(fontSize: 12, color: Colors.white),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 14,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            movie.imdbRating ?? '',
                            style: context.textStyles.textRegular
                                .copyWith(fontSize: 12, color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
