import 'package:clg/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TProfileMenu extends StatefulWidget {
  const TProfileMenu({
    super.key, this.icon = Iconsax.arrow_right_34, required this.onPressed, required this.title, required this.value,
  });

  final IconData icon;
  final VoidCallback onPressed;
  final String title, value;

  @override
  State<TProfileMenu> createState() => _TProfileMenuState();
}

class _TProfileMenuState extends State<TProfileMenu> {


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
       onTap: widget.onPressed,
          child: Padding(
          padding: EdgeInsets.symmetric(vertical: TSizes.spaceBtwItems / 1.5),
           child: Row(
           children: [
            Expanded(flex : 3 ,child: Text(widget.title,style: Theme.of(context).textTheme.bodySmall,overflow: TextOverflow.ellipsis)),
            Expanded(flex : 5, child: Text(widget.value,style: Theme.of(context).textTheme.bodyMedium,overflow: TextOverflow.ellipsis)),
            Expanded(child: Icon(widget.icon,size: 18,)),
          ],
        ),
      ),
    );
  }
}
