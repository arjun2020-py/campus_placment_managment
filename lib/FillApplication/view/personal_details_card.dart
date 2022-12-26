import 'package:flutter/material.dart';

import '../../personalDetails/view/personal_details.dart';

class PersonalDetailsCard extends StatelessWidget {
  const PersonalDetailsCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title:
            const Center(child: Text('Personal Details')),
        trailing: IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => PersonalDetails(),
              ),
            );
          },
          icon: const Icon(Icons.navigate_next),
        ),
      ),
    );
  }
}
