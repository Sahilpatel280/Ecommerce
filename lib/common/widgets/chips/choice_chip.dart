import 'package:clg/common/widgets/custom_shapes/container/circular_container.dart';
import 'package:clg/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';


class TChoiceChip extends StatelessWidget {
  const TChoiceChip({
    super.key,
    required this.text,
    required this.selected,
    this.onSelected,
  });

  @override

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  Widget build(BuildContext context) {
    final isColor = THelpFunctions.getColor(text) != null;
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label: isColor ? SizedBox() : Text(text),
        selected: selected,
        onSelected: onSelected,
        labelStyle: TextStyle(color: selected ? TColors.white : null),
        avatar:THelpFunctions.getColor(text) != null 
           ? TCircularContainer(width: 50,height: 50,backgroundColor: THelpFunctions.getColor(text)!)
          : null,
        shape:  isColor ? CircleBorder() : null,
        labelPadding:  isColor ? EdgeInsets.all(0) : null,
        padding:   isColor ? EdgeInsets.all(0) : null,
        backgroundColor:  isColor ? THelpFunctions.getColor(text) : null,
      ),
    );
  }
}