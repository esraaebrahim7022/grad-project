import 'package:ai_medicare/DataLocal/Cache_Helper.dart';
import 'package:ai_medicare/Network/endPoints.dart';
import 'package:ai_medicare/models/BreastCancerModel.dart';
import 'package:ai_medicare/screens/doctorpart/investigations/cubit/breast_cancer/BreastCancerCubit.dart';
import 'package:ai_medicare/screens/doctorpart/investigations/cubit/breast_cancer/BreastCancerState.dart';
import 'package:ai_medicare/widgets/textt2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BreastCancerPage extends StatelessWidget {
  static String id = 'BreastCancerPage';

  final TextEditingController radiusMeanController = TextEditingController();
  final TextEditingController textureMeanController = TextEditingController();
  final TextEditingController compactnessMeanController =
      TextEditingController();
  final TextEditingController concavityController = TextEditingController();
  final TextEditingController perimeterMeanController = TextEditingController();
  final TextEditingController areaMeanController = TextEditingController();
  final TextEditingController smoothnessMeanController =
      TextEditingController();
  final TextEditingController concavePointMeanController =
      TextEditingController();
  final TextEditingController symmetryMeanController = TextEditingController();
  final TextEditingController fractalDimensionController =
      TextEditingController();

  // Additional fields for worse data
  final TextEditingController radiusWorstController = TextEditingController();
  final TextEditingController textureWorstController = TextEditingController();
  final TextEditingController perimeterWorstController =
      TextEditingController();
  final TextEditingController areaWorstController = TextEditingController();
  final TextEditingController smoothnessWorstController =
      TextEditingController();
  final TextEditingController compactnessWorstController =
      TextEditingController();
  final TextEditingController concavityWorstController =
      TextEditingController();
  final TextEditingController concavePointWorstController =
      TextEditingController();
  final TextEditingController symmetryWorstController = TextEditingController();
  final TextEditingController fractalDimensionWorstController =
      TextEditingController();

  // Additional fields for se data
  final TextEditingController radiusSeController = TextEditingController();
  final TextEditingController textureSeController = TextEditingController();
  final TextEditingController perimeterSeController = TextEditingController();
  final TextEditingController areaSeController = TextEditingController();
  final TextEditingController smoothnessSeController = TextEditingController();
  final TextEditingController compactnessSeController = TextEditingController();
  final TextEditingController concavitySeController = TextEditingController();
  final TextEditingController concavePointSeController =
      TextEditingController();
  final TextEditingController symmetrySeController = TextEditingController();
  final TextEditingController fractalDimensionSeController =
      TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  BreastCancerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BreastCancerCubit, BreastCancerState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () async {
                    CacheHelper.clearData().then((value) {
                      Navigator.pushReplacementNamed(context, 'Welcome Page');
                    });

                    print(token);
                    print(role);
                    print('loggedout');
                  },
                  icon: const Icon(Icons.logout))
            ],
            backgroundColor: Colors.blue,
            centerTitle: true,
            title: const Center(
              child: Text(
                'Breast Cancer Prediction',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Text('Fill below form to predict breast cancer :'),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      smallTextField(
                          hinttext: 'Radius Mean (eg.14.02,11.13,etc)',
                          controller: radiusMeanController),
                      smallTextField(
                          hinttext: 'Texture Mean (eg.20.35,16.32,etc)',
                          controller: textureMeanController),
                      smallTextField(
                          hinttext: 'compactness Mean (eg.0.11260,0.11361,etc)',
                          controller: compactnessMeanController),
                      smallTextField(
                          hinttext: 'Concavity Mean (eg.0.111400,0.09961,etc)',
                          controller: concavityController),
                      smallTextField(
                          hinttext: 'Perimeter Mean (eg.91.34,127.35,etc)',
                          controller: perimeterMeanController),
                      smallTextField(
                          hinttext: 'Area Mean (eg.500.23,2010.21,etc)',
                          controller: areaMeanController),
                      smallTextField(
                          hinttext: 'Smoothnees Mean (eg.0.08151,0.12254,etc)',
                          controller: smoothnessMeanController),
                      smallTextField(
                          hinttext: 'Concave Point Mean (eg.0.043040,etc)',
                          controller: concavePointMeanController),
                      smallTextField(
                          hinttext: 'Symmetry Mean(eg.0.1537,0.2251,etc)',
                          controller: symmetryMeanController),
                      smallTextField(
                          hinttext: 'Fractal Dimension (eg.0.06171,etc)',
                          controller: fractalDimensionController),

                      // Widgets for worse data
                      smallTextField(
                          hinttext: 'Radius Worst (eg.14.02,11.13,etc)',
                          controller: radiusWorstController),
                      smallTextField(
                          hinttext: 'Texture Worst (eg.20.35,16.32,etc)',
                          controller: textureWorstController),
                      smallTextField(
                          hinttext: 'Perimeter Worst (eg.91.34,127.35,etc)',
                          controller: perimeterWorstController),
                      smallTextField(
                          hinttext: 'Area Worst (eg.500.23,2010.21,etc)',
                          controller: areaWorstController),
                      smallTextField(
                          hinttext: 'Smoothnees Worst (eg.0.08151,0.12254,etc)',
                          controller: smoothnessWorstController),
                      smallTextField(
                          hinttext:
                              'Compactness Worst (eg.0.08151,0.12254,etc)',
                          controller: compactnessWorstController),
                      smallTextField(
                          hinttext: 'Concavity Worst (eg.0.111400,0.09961,etc)',
                          controller: concavityWorstController),
                      smallTextField(
                          hinttext: 'Concave Point Worst (eg.0.043040,etc)',
                          controller: concavePointWorstController),
                      smallTextField(
                          hinttext: 'Symmetry Worst(eg.0.1537,0.2251,etc)',
                          controller: symmetryWorstController),
                      smallTextField(
                          hinttext: 'Fractal Dimension Worst (eg.0.06171,etc)',
                          controller: fractalDimensionWorstController),

                      // Widgets for se data
                      smallTextField(
                          hinttext: 'Radius Se (eg.14.02,11.13,etc)',
                          controller: radiusSeController),
                      // Widgets for se data
                      smallTextField(
                          hinttext: 'Texture Se (eg.14.02,11.13,etc)',
                          controller: textureSeController),
                      smallTextField(
                          hinttext: 'Perimeter Se (eg.91.34,127.35,etc)',
                          controller: perimeterSeController),
                      smallTextField(
                          hinttext: 'Area Se (eg.500.23,2010.21,etc)',
                          controller: areaSeController),
                      smallTextField(
                          hinttext: 'Smoothnees Se (eg.0.08151,0.12254,etc)',
                          controller: smoothnessSeController),
                      smallTextField(
                          hinttext: 'Compactness Se (eg.0.08151,0.12254,etc)',
                          controller: compactnessSeController),
                      smallTextField(
                          hinttext: 'Concavity Se (eg.0.111400,0.09961,etc)',
                          controller: concavitySeController),
                      smallTextField(
                          hinttext: 'Concave Point Se (eg.0.043040,etc)',
                          controller: concavePointSeController),
                      smallTextField(
                          hinttext: 'Symmetry Se(eg.0.1537,0.2251,etc)',
                          controller: symmetrySeController),
                      smallTextField(
                          hinttext: 'Fractal Dimension Se (eg.0.06171,etc)',
                          controller: fractalDimensionSeController),
                    ],
                  ),
                ),
                showDialgButton(
                    buttonText: 'PREDICT',
                    title: 'THE RESULT',
                    context: context,
                    content: '',
                    onPressed: () async {
                      if (_formKey.currentState?.validate() ?? false) {
                        BreastCancerModel breastCancerModel = BreastCancerModel(
                          radiusMean: 0.0,
                          textureMean: 0.0,
                          perimeterMean: 0.0,
                          areaMean: 0.0,
                          smoothnessMean: 0.0,
                          compactnessMean: 0.0,
                          concavityMean: 0.0,
                          concavePointsMean: 0.0,
                          symmetryMean: 0.0,
                          fractalDimensionMean: 0.0,
                          radius_se: 0.0,
                          texture_se: 0.0,
                          perimeter_se: 0.0,
                          area_se: 0.0,
                          smoothness_se: 0.0,
                          compactness_se: 0.0,
                          concavity_se: 0.0,
                          concave_points_se: 0.0,
                          symmetry_se: 0.0,
                          fractal_dimension_se: 0.0,
                          radius_worst: 0.0,
                          texture_worst: 0.0,
                          perimeter_worst: 0.0,
                          area_worst: 0.0,
                          smoothness_worst: 0.0,
                          compactness_worst: 0.0,
                          concavity_worst: 0.0,
                          concave_points_worst: 0.0,
                          symmetry_worst: 0.0,
                          fractal_dimension_worst: 0.0,
                        );
                        await BreastCancerCubit.get(context)
                            .postBreastCancerData(breastCancerModel)
                            .then((value) {
                          if (BreastCancerCubit.get(context).state
                              is SuccessLoadedBreastCancerState) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Result'),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        (BreastCancerCubit.get(context).state
                                                as SuccessLoadedBreastCancerState)
                                            .value,
                                        style: const TextStyle(fontSize: 18),
                                      ),
                                      const Divider(
                                        color: Colors.grey,
                                        height: 20,
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('Done'),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text((BreastCancerCubit.get(context)
                                      .state as FailedLoadingBreastCancerState)
                                  .errorMessage),
                            ));
                          }
                        });
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Fill Form Field First')));
                      }
                    }),
              ],
            ),
          ),
        );
      },
    );
  }
}
