import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meals_project/widgets/upload_photo.dart';
import '../dummy_data.dart';
import 'package:flutter/material.dart';
import '../widgets/category_item.dart';
import '../widgets/main_drawer.dart';

class IdeasScreen extends StatelessWidget {
  static const routeName = './ideas-screen';
  const IdeasScreen({super.key});

  Widget buildListTile(
      String title, IconData iconData, VoidCallback tapHandler) {
    return ListTile(
      leading: Icon(
        iconData,
        size: 26,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ideas',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      drawer: const MainDrawer(),
      body: GridView(
        padding: const EdgeInsets.all(25),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: DUMMY_CATEGORIES
            .map((catData) =>
                CategoryItem(catData.id, catData.title, catData.color))
            .toList(),
      ),
      // a button to add a photo
      // floatingActionButton: FloatingActionButton(
      //   child: const Icon(
      //     Icons.add,
      //   ),
      //   onPressed: () {
      //     buildListTile('Upload Photo', Icons.score, () {
      //       Navigator.of(context).pushReplacementNamed(UploadPhoto.routeName);
      //     });
      //     print("HERE");
      //   },
      // ),
    );
  }
}
