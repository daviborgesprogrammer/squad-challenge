import 'package:flutter/material.dart';

import '../../../../core/theme/text_styles.dart';
import '../../../../core/utils/size_extensions.dart';
import '../../../home/domain/entities/movie.dart';

class MovieDetailPage extends StatelessWidget {
  const MovieDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final movie = ModalRoute.of(context)?.settings.arguments as Movie;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: GestureDetector(
                onTap: () {},
                child: SizedBox(
                  width: context.percentWidth(0.67),
                  child: Image.network(movie.poster!),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              movie.title ?? '',
              style: context.textStyles.textBold
                  .copyWith(color: Colors.white, fontSize: 24),
            ),
            Row(
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: 20,
                ),
                const SizedBox(width: 4),
                Text(
                  movie.imdbRating ?? '',
                  style: context.textStyles.textRegular
                      .copyWith(color: Colors.white),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Text(
              'Sinopse',
              style: context.textStyles.textBold
                  .copyWith(color: Colors.white, fontSize: 16),
            ),
            const SizedBox(height: 4),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  movie.plot ?? '',
                  style: context.textStyles.textRegular
                      .copyWith(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
