import 'package:dummy_poc/features/reviews/providers/review_provider.dart';
import 'package:dummy_poc/features/reviews/screens/display_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const StarReviewApp());
}

class StarReviewApp extends StatelessWidget {
  const StarReviewApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ReviewProvider(),
      child: MaterialApp(
        title: 'Star Review System',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const ReviewScreen(),
      ),
    );
  }
}
