import 'package:find_my_pet/gen/colors.gen.dart';
import 'package:flutter/material.dart';

class BuildDragHandler extends StatelessWidget {
  const BuildDragHandler({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      height: 4,
      width: 50,
      decoration: BoxDecoration(
        color: ColorName.lightGrey,
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
