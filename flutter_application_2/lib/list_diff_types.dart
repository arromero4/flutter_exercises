import 'package:flutter/material.dart';

void main() {
  runApp(
    MyApp(
      items: List<ListItem>.generate(
        100,
        (index) => index % 6 == 0
            ? HeadingItem('Heading $index')
            : MessageItem('Sender $index', 'Message body $index'),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final List<ListItem> items;
  const MyApp({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    const title = 'Mixed List';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];

            return ListTile(
              title: item.buildTitle(context),
              subtitle: item.buildSubtitle(context),
            );
          },
        ),
      ),
    );
  }
}

//the base class for the different types of items the list can contain
abstract class ListItem {
  ///the title line to show in a list item
  Widget buildTitle(BuildContext context);

  ///the subtitle line, if any, to show in a list item
  Widget buildSubtitle(BuildContext context);
}

///A listItem that contains data to display a heading
class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);

  @override
  Widget buildTitle(BuildContext context) {
    return Text(
      heading,
      style: Theme.of(context).textTheme.headlineSmall,
    );
  }

  @override
  Widget buildSubtitle(BuildContext context) {
    return const SizedBox.shrink();
  }
}

/// A ListItem that contains data to display a message.
class MessageItem implements ListItem {
  final String sender;
  final String body;

  MessageItem(
    this.sender,
    this.body,
  );

  @override
  Widget buildTitle(BuildContext context) {
    return Text(sender);
  }

  @override
  Widget buildSubtitle(BuildContext context) {
    return Text(body);
  }
}
