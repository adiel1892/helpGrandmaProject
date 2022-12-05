import 'package:flutter/material.dart';
import 'package:meals_project/dummy_data.dart';

class ActivityDetailScreen extends StatelessWidget {
  static const routeName = '/activity-detail';
  final Function toggleFavorite;
  final Function isFavorite;

  ActivityDetailScreen(this.toggleFavorite, this.isFavorite);

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(20),
      height: 200,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final activityId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedActivity =
        DUMMY_ACTIVITIES.firstWhere((meal) => meal.id == activityId);
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedActivity.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedActivity.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, 'Requierd'),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Text(selectedActivity.requierd[index])),
                ),
                itemCount: selectedActivity.requierd.length,
              ),
            ),
            buildSectionTitle(context, 'Importance of the Activity'),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${(index + 1)}'),
                      ),
                      title: Text(
                        selectedActivity.importance[index],
                      ),
                    ),
                    Divider(),
                  ],
                ),
                itemCount: selectedActivity.importance.length,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isFavorite(activityId) ? Icons.star : Icons.star_border,
        ),
        onPressed: () => toggleFavorite(activityId),
      ),
    );
  }
}
