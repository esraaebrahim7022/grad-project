import 'package:ai_medicare/models/diagnosis_model.dart';
import 'package:ai_medicare/models/issue_model.dart';
import 'package:ai_medicare/screens/patientpart/systemCheckers/cubit/SymptomsCubit.dart';
import 'package:ai_medicare/screens/patientpart/systemCheckers/issue_details.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

class SymptomsDiagnosis extends StatefulWidget {
  static const String id = 'SymptomsDiagnosis';
  final List<Diagnosis> diagnosis;
  const SymptomsDiagnosis({super.key, required this.diagnosis});

  @override
  State<SymptomsDiagnosis> createState() => _SymptomsDiagnosisState();
}

class _SymptomsDiagnosisState extends State<SymptomsDiagnosis> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Diagnosis',style: TextStyle(
                      fontSize: 24
                    ),),
        ),
        body: Container(
          padding: EdgeInsets.all(12.0),
          child: ConditionalBuilder(
          condition: widget.diagnosis.isNotEmpty,
           fallback: (context) => const Text('No Diagnosis Found',style: TextStyle(
            fontSize: 20
           ),), 
           builder: (context){
            return ListView.builder(
             itemCount: widget.diagnosis.length,
             itemBuilder: (context, index){
              return Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.diagnosis[index].issue.name,style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500
                    ),),

                    Text(widget.diagnosis[index].issue.accuracy.toStringAsFixed(2) + '%')
                  ],
                ),
                SizedBox(height: 4,),
                Text(widget.diagnosis[index].issue.icd),
                Text(widget.diagnosis[index].issue.profName),
                Text(widget.diagnosis[index].issue.icdName),
                SizedBox(height: 4,),
                Text("Ranking: ${widget.diagnosis[index].issue.ranking}"),
                SizedBox(height: 4,),

                Text("Specialists",style: TextStyle(
                  fontSize: 20
                ),),

                ListView.builder(
                  itemCount: widget.diagnosis[index].specialisation.length,
                  itemBuilder: (context, i){
                    return Text(widget.diagnosis[index].specialisation[i].name);
                  },
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                ),

                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: ()async{
                      IssueModel? model = await SyptomsCubit.get(context).getIssueData(
                        widget.diagnosis[index].issue.id
                      );

                      if(model == null){
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('No Issye Details was found'),
                          )
                        );
                        return;
                      }

                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context){
                            return IssueDetails(issue: model.issue,);
                          }
                        )
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      padding: EdgeInsets.all(8.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero
                      )
                    ),
                    child: Text('Read More About Issue',style: TextStyle(
                      color: Colors.black,
                    ),)),
                ),

                Divider(),
                SizedBox(height: 20,)

              ],
            ),
              );
             },
           );
           }
          ),
        ),
      ),
    );
  }
}