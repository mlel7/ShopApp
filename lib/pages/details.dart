import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myapp/db.dart';

class ItemsDetails extends StatelessWidget {
  ItemsDetails({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    int arg = int.parse(ModalRoute.of(context)!.settings.arguments.toString());
    return Scaffold(
      endDrawer: const Drawer(),
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.shop_outlined, color: Colors.black),
            SizedBox(width: 5),
            Text("Art ", style: TextStyle(color: Colors.black)),
            Text(
              "Store",
              style: TextStyle(color: Colors.orange),
            )
          ],
        ),
        backgroundColor: Colors.grey[200],
        iconTheme: const IconThemeData(color: Colors.grey),
        elevation: 0,
      ),
      body: ListView(
        children: <Widget>[
          const SizedBox(height: 10),
          Image.asset(
            items[arg]['image'],
            height: 300,
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: Text(
              items[arg]['title'],
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: Text(
              items[arg]['subtitle'],
              style: const TextStyle(fontSize: 15, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: Text(
              items[arg]['price'],
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                  fontSize: 23),
              textAlign: TextAlign.center,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text("Color: ", style: TextStyle(color: Colors.grey)),
              const SizedBox(width: 5),
              Row(
                children: [
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.orange),
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text("Grey")
                ],
              ),
              const SizedBox(width: 18),
              Row(
                children: [
                  Container(
                    height: 20,
                    width: 20,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text("Black")
                ],
              )
            ],
          ),
          const SizedBox(height: 10),
          const Text("Size:  39  40  41  42  43",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 20),
            child: ElevatedButton(
              onPressed: () {},
              style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.black),
                foregroundColor: WidgetStatePropertyAll(Colors.white),
                padding: WidgetStatePropertyAll(EdgeInsets.all(15)),
                shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                )),
                textStyle: WidgetStatePropertyAll(TextStyle(fontSize: 20))
              ),
              child: const Text("Add to Cart"),
            ),
          ),
        ],
      ),
    );
  }
}
