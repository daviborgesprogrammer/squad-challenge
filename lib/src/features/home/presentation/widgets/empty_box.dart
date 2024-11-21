import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/image_constant.dart';
import '../../../../core/theme/text_styles.dart';

class EmptyBox extends StatelessWidget {
  const EmptyBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(ImageConstant.emptyBox),
          const SizedBox(height: 16),
          Text(
            'Nenhum Produto encontrado',
            style: context.textStyles.textRegular.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
