
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salon_owner/view/pages/SalonOwner.dart';
import 'package:salon_owner/view/pages/specialists.dart';

import '../../../view/pages/profile/profileScreen.dart';
import 'main_screen_state.dart';



class MainScreenCubit extends Cubit<MainState>{
  MainScreenCubit():super(MainInitialState());

  static MainScreenCubit get(context)=>BlocProvider.of(context);
  List<Widget> screenList=[SalonOwner(),Specialists(),UserProfileScreen()];
  int index=0;
  change(int i){
    index=i;
    emit(ChangeNavState());
  }

}