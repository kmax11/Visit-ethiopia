import 'package:flutter/material.dart';


class CategoryPlaceItem extends StatefulWidget {
  final Map place;
  int index;
  CategoryPlaceItem({Key? key, required this.place,required this.index}) : super(key: key);

  @override
  State<CategoryPlaceItem> createState() => _CategoryPlaceItemState();
}

class _CategoryPlaceItemState extends State<CategoryPlaceItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
          height: 80,
          child:ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.asset(
              "${widget.place["img"][1]}",
              height: 70.0,
              width: 70.0,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
