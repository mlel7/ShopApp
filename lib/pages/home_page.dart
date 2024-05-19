import 'package:flutter/material.dart';
import 'package:myapp/db.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  
  @override
  void dispose() {
    setState(() {
      currentIndex = 0;
    });
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          iconSize: 34,
          backgroundColor: Colors.grey[200],
          selectedItemColor: Colors.orange,
          type: BottomNavigationBarType.fixed,
          unselectedFontSize: 18,
          selectedFontSize: 18,
          items: const<BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined),label: "*"),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined),label: "*"),
            BottomNavigationBarItem(icon: Icon(Icons.person_2_outlined),label: "*",),
          ],
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: ListView(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: "Search",
                          hintStyle: TextStyle(fontSize: 20),
                          alignLabelWithHint: true,
                          prefixIcon: Icon(Icons.search),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.menu, size: 30),
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 30),
              const Text("Categories",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 110,
                child: ListView.builder(
                  itemCount: categoris.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                currentIndex = index;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.only(
                                top: 10,
                                right: 10,
                              ),
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  color: currentIndex == index
                                      ? const Color.fromARGB(255, 251, 175, 60)
                                      : Colors.grey[200],
                                  shape: BoxShape.circle),
                              child: Icon(
                                categoris[index]['iconname'],
                                color: Colors.black,
                                size: 50,
                              ),
                            ),
                          ),
                          Text(
                            categoris[index]['title'],
                            style: TextStyle(
                                color: Colors.grey[800],
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  "Best Selling",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, mainAxisExtent: 240),
                itemCount: items.length,
                itemBuilder: (context, index) => Card(
                  child: InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, "details",arguments: index);
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          color: Colors.grey[200],
                          padding: const EdgeInsets.all(20),
                          width: 300,
                          child: Image.asset(items[index]['image'],
                              height: 100, fit: BoxFit.fill),
                        ),
                        Text(
                          items[index]['title'],
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                        Text(
                          items[index]['subtitle'],
                          style: const TextStyle(color: Colors.grey),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          child: Text(
                            items[index]['price'],
                            style: const TextStyle(
                                color: Colors.orange,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
