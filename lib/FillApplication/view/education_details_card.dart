import 'package:flutter/material.dart';

import '../../educationForm/view/education_from.dart';

class EducationDeatilsCard extends StatelessWidget {
  const EducationDeatilsCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: const Center(child: Text('Education Details')),
        trailing: IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const EducationFrom(),
              ),
            );
          },
          icon: const Icon(Icons.navigate_next),
        ),
      ),
    );
  }
}
