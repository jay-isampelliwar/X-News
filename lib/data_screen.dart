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
    await provider.getNews("tech");
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

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    NewsProvider provider = Provider.of<NewsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                text: "Kuku",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Colors.black,
                ),
              ),
              TextSpan(
                text: "App",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  fontSize: 22,
                ),
              ),
            ],
          ),
        ),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: ((context) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        TextField(
                          textInputAction: TextInputAction.search,
                          onSubmitted: (value) {
                            provider.getNews(controller.text);
                            controller.text = "";
                            Navigator.pop(context);
                          },
                          controller: controller,
                          decoration: InputDecoration(
                            hintText: "Enter Topic",
                            suffixIcon: IconButton(
                              onPressed: () {
                                provider.getNews(controller.text);
                                controller.text = "";
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.search,
                                color: Colors.black,
                              ),
                            ),
                            border: const OutlineInputBorder(),
                          ),
                        )
                      ],
                    ),
                  );
                }),
              );
            },
            icon: const Icon(Icons.search, color: Colors.black),
          ),
        ],
      ),
      body: provider.isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            )
          : ListView.builder(
              itemCount: provider.articles.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: const EdgeInsets.only(left: 5, right: 5, bottom: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey.shade200,
                  ),
                  child: Card(
                    child: Column(
                      children: [
                        Card(
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                    height: 150,
                                    width: 150,
                                    child: Image.network(
                                      provider.articles[index].urlToImage ?? "",
                                      fit: BoxFit.cover,
                                    )),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Text(
                                          "${provider.articles[index].title}.",
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22,
                                          ),
                                          maxLines: 3,
                                          overflow: TextOverflow.fade,
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            const Text(
                                              "Source: ",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(provider.articles[index].source
                                                    .name ??
                                                ""),
                                          ],
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "${months[provider.articles[index].publishedAt.month - 1]} ${provider.articles[index].publishedAt.day}",
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            provider.articles[index].description ?? "",
                            style: const TextStyle(fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     getData(provider);
      //   },
      // ),
    );
  }
}

// class CustomSearchDelegate extends SearchDelegate {
//   @override
//   List<Widget>? buildActions(BuildContext context) {}

//   @override
//   Widget? buildLeading(BuildContext context) {}

//   @override
//   Widget buildResults(BuildContext context) {
//     List<String> matched_query = [];
//     return Container();
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     return Container();
//   }
// }
