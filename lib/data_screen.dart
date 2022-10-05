import 'package:flutter/material.dart';
import 'package:news_app/provider/news_provider.dart';
import 'package:provider/provider.dart';

class Homee extends StatefulWidget {
  const Homee({Key? key}) : super(key: key);

  @override
  State<Homee> createState() => _HomeeState();
}

class _HomeeState extends State<Homee> {
  @override
  void initState() {
    Future.delayed(Duration.zero, (() {
      NewsProvider provider = Provider.of<NewsProvider>(context, listen: false);
      getData(provider);
    }));
    super.initState();
  }

  void getData(NewsProvider provider) async {
    await provider.getNews(false);
  }

  @override
  void dispose() {
    super.dispose();
  }

  List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  List<String> weekDays = [
    "Sunday",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
  ];

  @override
  Widget build(BuildContext context) {
    NewsProvider provider = Provider.of<NewsProvider>(context);
    return Scaffold(
      body: provider.isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            )
          : ListView.builder(
              itemCount: provider.articles.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  color: Colors.grey,
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Column(
                      children: [
                        Image.network(
                            provider.articles[index].urlToImage ?? ""),
                        Card(
                          color: Colors.grey.shade300,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              provider.articles[index].content.toString(),
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text(months[
                                provider.articles[index].publishedAt.month -
                                    1]),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(provider.articles[index].publishedAt.day
                                .toString()),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getData(provider);
        },
      ),
    );
  }
}
