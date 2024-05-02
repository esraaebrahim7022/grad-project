import 'package:ai_medicare/DataLocal/Cache_Helper.dart';
import 'package:ai_medicare/Network/endPoints.dart';
import 'package:ai_medicare/models/SymptomsModel.dart';
import 'package:ai_medicare/models/diagnosis_model.dart';
import 'package:ai_medicare/screens/patientpart/systemCheckers/cubit/SymptomsCubit.dart';
import 'package:ai_medicare/screens/patientpart/systemCheckers/cubit/SymptomsStates.dart';
import 'package:ai_medicare/screens/patientpart/systemCheckers/symptoms_diagnosis.dart';
import 'package:ai_medicare/widgets/textt2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_select_flutter/dialog/mult_select_dialog.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class SymptomsCheckerPage extends StatefulWidget {
  static String id = 'SymptomsCheckerPage';

  SymptomsCheckerPage({super.key});

  @override
  State<SymptomsCheckerPage> createState() => _SymptomsCheckerPageState();
}

class _SymptomsCheckerPageState extends State<SymptomsCheckerPage> {
  var ageContoller = TextEditingController();

  String? genderController;

  var formKey = GlobalKey<FormState>();

  List<String> items = ['male', 'female'];

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SyptomsCubit>(
      create: (context) =>
          SyptomsCubit()..getSymptoms(CacheHelper.getData(key: 'token')),
      child: BlocConsumer<SyptomsCubit, SyptomsStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                actions: [
                  IconButton(
                      onPressed: () async {
                        CacheHelper.clearData().then((value) {
                          Navigator.pushReplacementNamed(
                              context, 'Welcome Page');
                        });
                        print(token);
                        print(role);
                        print('loggedout');
                      },
                      icon: Icon(Icons.logout))
                ],
                backgroundColor: Colors.lightBlue,
                title: const Center(
                  child: Text(
                    'SymptomsChecker',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                ),
              ),
              body: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Container(
                        padding:
                            const EdgeInsets.only(left: 16, right: 16, top: 10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black45,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: DropdownButton(
                          hint: Text('gender'),
                          dropdownColor: Colors.white,
                          icon: const Icon(Icons.arrow_drop_down),
                          iconSize: 36,
                          isExpanded: true,
                          underline: const SizedBox(),
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                          items: items
                              .map((e) => DropdownMenuItem(
                                    value: e,
                                    child: Text(e),
                                  ))
                              .toList(),
                          onChanged: (val) {
                            genderController = val as String?;
                          },
                          value: genderController,
                        ),
                      ),
                    ),
                    smallTextField(
                      hinttext: 'Birth Year (eg. 2005, 2000)',
                      controller: ageContoller,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a age';
                        }
                        if (int.tryParse(value) == null) {
                          return 'Please enter a valid number';
                        }
                        return null;
                      },
                    ),
                    Container(
                      width: 350,
                      child: Center(
                        child: MultiSelectDialogField(
                          items: [
                            ...SyptomsCubit.get(context).allSymptoms.map((e){
                              return MultiSelectItem(
                                e, 
                                e.name.toString()
                              );
                            })
                          ],
              
                          onConfirm: (List<Symptoms> selected_symptoms){
                            SyptomsCubit.get(context).selectedSymptoms = selected_symptoms;
                          },
                        ),
                      ),
                    ),
              
                    showDialgButton(
                      buttonText: 'CHECK',
                      title: 'THE RESULT',
                      context: context,
                      content: '',
                      onPressed: () async{
                        DiagnosisModel? model = await SyptomsCubit.get(context).postAndGetSymptomsDiagnosis(
                          gender: genderController!, 
                          birthYear: ageContoller.text, 
                          symptomsIdentifiers: SyptomsCubit.get(context).selectedSymptoms.map((e) => e.iD!).toList()
                        );
                        
                        Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context){
                                  return SymptomsDiagnosis(
                                    diagnosis: model?.diagnosis ?? []
                                  );
                                }
                              )
                            );
                      }
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
