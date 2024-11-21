import 'package:flutter/material.dart';

import '../../../../core/theme/text_styles.dart';

class SearchField extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  const SearchField({this.onChanged, this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextFormField(
        controller: controller,
        cursorColor: Colors.white,
        style: context.textStyles.textRegular.copyWith(color: Colors.white),
        decoration: InputDecoration(
          hintText: 'Buscar',
          hintStyle: context.textStyles.textRegular
              .copyWith(color: Colors.grey.shade600),
          labelStyle:
              context.textStyles.textRegular.copyWith(color: Colors.white),
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.white,
          ),
          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 8, 12, 8),
                child: VerticalDivider(
                  color: Colors.white, // Cor do divisor
                  thickness: 1.0, // Espessura do divisor
                  width: 1.0,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.mic,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
