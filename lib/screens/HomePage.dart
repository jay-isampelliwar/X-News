import 'package:flutter/material.dart';
import 'package:news_app/provider/category.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Category category = Provider.of<Category>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
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
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Choose a topic to",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            const Text(
              "start reading",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemCount: category.getCategoryList.length,
                itemBuilder: (BuildContext context, int index) {
                  bool selected = category.selectedItem.contains(index);
                  return GestureDetector(
                    onTap: () {
                      if (!category.selectedItem.contains(index)) {
                        category.itemSelected(index);
                      } else {
                        category.removeSelected(index);
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      alignment: Alignment.center,
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: selected
                            ? Border.all(
                                width: 2,
                                color: Colors.blue,
                              )
                            : Border.all(
                                width: 2,
                                color: Colors.grey.withOpacity(.3),
                              ),
                        color: selected
                            ? Colors.blue.withOpacity(.2)
                            : Colors.transparent,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            category.getCategoryList[index].split(" ").first,
                            style: const TextStyle(fontSize: 33),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Text(
                            category.getCategoryList[index].split(" ").last,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30), color: Colors.blue),
              child: const Align(
                  child: Text(
                "Continue",
                style: TextStyle(color: Colors.white, fontSize: 18),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
