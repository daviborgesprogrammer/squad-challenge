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
    print('${movie}');

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        // color: Colors.red,
        // image: DecorationImage(
        //   image: movie.poster != null
        //       ? NetworkImage(movie.poster!)
        // : AssetImage(
        //     ImageConstant.posterNotFound,
        //   ),
        //   fit: BoxFit.cover,
        // ),
      ),
      child: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: movie.poster!,
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) =>
                Image.asset(ImageConstant.posterNotFound),
          ),
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
                      '5.8',
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
    );
  }
}
