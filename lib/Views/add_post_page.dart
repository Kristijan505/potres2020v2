import 'package:flutter/material.dart';
import 'package:potres2020v2/Models/tag.dart';
import 'package:potres2020v2/Widgets/my_scaffold.dart';

class AddPostPage extends StatefulWidget {
  @override
  _AddPostPageState createState() => _AddPostPageState();
}

class _AddPostPageState extends State<AddPostPage> {
  final _formKey = GlobalKey<FormState>();
  final _helpTypeController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _longDescriptionController = TextEditingController();
  final _contactController = TextEditingController();
  List<Tag> tags = <Tag>[];
  final _conclusionController = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      bottomNavBarCurrentIndex: 1,
      title: 'Unos posta',
      children: <Widget>[],
    );
  }
}
