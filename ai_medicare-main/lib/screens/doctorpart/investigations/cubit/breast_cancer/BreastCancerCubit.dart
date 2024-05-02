import 'package:ai_medicare/DataLocal/Cache_Helper.dart';
import 'package:ai_medicare/Network/dio.Helper.dart';
import 'package:ai_medicare/models/BreastCancerModel.dart';
import 'package:ai_medicare/screens/doctorpart/investigations/cubit/breast_cancer/BreastCancerState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BreastCancerCubit extends Cubit<BreastCancerState>{
  BreastCancerCubit(): super(InitialBreastCancerState());

  static BreastCancerCubit get(context) => BlocProvider.of(context);

  Future<void> postBreastCancerData(BreastCancerModel breastCancerModel) async{
    emit(LoadingBreastCancerState());

    try{
      final response = await DioHelper.postData(
        url: 'https://ai-medicare-2.onrender.com/api/doctors/breast', 
        data: breastCancerModel.toJson(),
        token: CacheHelper.getData(key: 'token')
      );

      if(response.statusCode == 200){
        return emit(SuccessLoadedBreastCancerState(response.data['prediction']));
      }else{
        return emit(FailedLoadingBreastCancerState('Failed to get breast cancer result'));
      }
    }catch(error){
      emit(FailedLoadingBreastCancerState(error.toString()));
    }
  }

}