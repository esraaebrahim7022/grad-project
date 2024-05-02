import 'package:flutter/material.dart';

import '../../../models/issue_model.dart';

class IssueDetails extends StatelessWidget {
  final IssueData issue;

  IssueDetails({required this.issue});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Issue Details'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Name:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(issue.name),
              SizedBox(height: 10),
              Text(
                'Description:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(issue.description),
              SizedBox(height: 10),
              Text(
                'Description Short:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(issue.descriptionShort),
              SizedBox(height: 10),
              Text(
                'Medical Condition:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(issue.medicalCondition),
              SizedBox(height: 10),
              
              Text(
                'Possible Symptoms:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(issue.possibleSymptoms),
              SizedBox(height: 10),
              Text(
                'Professional Name:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(issue.profName),
              SizedBox(height: 10),
              Text(
                'Synonyms:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(issue.synonyms),
              SizedBox(height: 10),
              Text(
                'Treatment Description:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(issue.treatmentDescription),
            ],
          ),
        ),
      ),
    );
  }
}