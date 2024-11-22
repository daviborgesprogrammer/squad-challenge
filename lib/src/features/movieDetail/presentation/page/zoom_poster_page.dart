import 'package:flutter/material.dart';

import '../../../../core/utils/size_extensions.dart';

class ZoomPosterPage extends StatelessWidget {
  final String urlImage;
  const ZoomPosterPage(this.urlImage, {super.key});

  @override
  Widget build(BuildContext context) {
    double width = context.screenWidth - 32;
    double height = width * 1.5;
    return Dialog.fullscreen(
      backgroundColor: Colors.transparent,
      child: Stack(
        fit: StackFit.loose,
        children: [
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: width,
              height: height,
              child: Image.network(urlImage),
            ),
          ),
          Positioned(
            right: 16,
            top: (context.percentHeight(0.5) - height / 2) - 30,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0XFF403B7A),
                  borderRadius: BorderRadius.circular(36),
                ),
                child: const Icon(
                  Icons.close,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
