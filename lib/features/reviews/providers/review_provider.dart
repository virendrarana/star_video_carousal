import 'package:flutter/material.dart';
import '../models/review_model.dart';

class ReviewProvider extends ChangeNotifier {
  final List<ReviewModel> _reviews = [];

  // Add a new review
  void addReview(int stars) {
    _reviews.add(ReviewModel(stars));
    notifyListeners();
  }

  // Calculate the average rating
  double get averageRating {
    if (_reviews.isEmpty) return 0.0;
    return _reviews.map((r) => r.stars).reduce((a, b) => a + b) / _reviews.length;
  }

  // Get the total number of reviews
  int get totalReviews => _reviews.length;
}
