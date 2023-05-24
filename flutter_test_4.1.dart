class Review {
  final String title;
  final String content;

  Review(this.title, this.content);
}

List<Review> review = [
  Review('John', "It's alright"),
  Review('Sam', "It's great"),
  Review('Thomas', "It's excellent"),
  Review('James', "I like it"),
];

class ReviewsScreen extends StatelessWidget {
  const ReviewsScreen(this.reviews, {super.key});

  final List<Review> reviews;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reviews')),
      body: Column(
        children: <Widget>[
          const Text('Product Reviews', style: TextStyle(fontSize: 24)),
          Expanded(
            child: ListView.builder(
              itemCount: reviews.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(reviews[index].title),
                  subtitle: Text(reviews[index].content),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
