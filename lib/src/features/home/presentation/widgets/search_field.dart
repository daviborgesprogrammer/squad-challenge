import 'package:flutter/material.dart';

import '../../../../core/theme/text_styles.dart';

class SearchField extends StatefulWidget {
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  const SearchField({this.onChanged, this.controller, super.key});

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextFormField(
        controller: widget.controller,
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
          suffixIcon: widget.controller!.text.isEmpty
              ? null
              : IconButton(
                  onPressed: () {
                    setState(() {
                      widget.controller!.clear();
                    });
                  },
                  icon: const Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                ),
        ),
        onChanged: widget.onChanged,
      ),
    );
  }
}
