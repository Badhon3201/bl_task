import 'package:flutter/material.dart';

import '../../../../core/utils/styles.dart';
import '../../../../core/values/string_resources.dart';

class SearchFieldWidget extends StatelessWidget {
  const SearchFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          fillColor: Colors.white,
          hoverColor: Colors.white,
          filled: true,
          contentPadding: const EdgeInsets.only(left: 20, right: 20),
          prefixIcon: const Icon(Icons.search),
          hintText: "${StringResources.search}...",
          hintStyle: TextStyles.hintStyle,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10.0)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide:
              const BorderSide(color: Colors.grey, width: 1))),
    );
  }
}
