import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/review_provider.dart';

class StarSelector extends StatefulWidget {
  const StarSelector({Key? key}) : super(key: key);

  @override
  _StarSelectorState createState() => _StarSelectorState();
}

class _StarSelectorState extends State<StarSelector> {
  int _selectedStars = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return IconButton(
          icon: Icon(
            index < _selectedStars ? Icons.star : Icons.star_border,
            color: Colors.orange,
          ),
          onPressed: () {
            setState(() {
              _selectedStars = index + 1;
            });
            context.read<ReviewProvider>().addReview(_selectedStars);
          },
        );
      }),
    );
  }
}
