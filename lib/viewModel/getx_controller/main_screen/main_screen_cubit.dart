import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salon_owner/view/pages/SalonOwner.dart';
import 'package:salon_owner/view/pages/specialists.dart';
import 'package:salon_owner/viewModel/database_local/CacheHelper.dart';

import '../../../salonSpecialist/salonSpecialist.dart';
import '../../../view/pages/addOffer.dart';
import '../../../view/pages/add_category.dart';
import '../../../view/pages/profile/profileSalon.dart';
import '../../../view/pages/profile/profileScreen.dart';
import 'main_screen_state.dart';

class MainScreenCubit extends Cubit<MainState> {
  MainScreenCubit() : super(MainInitialState());

  static MainScreenCubit get(context) => BlocProvider.of(context);
  List<Widget> screenList1 =  [const SalonSpecialist(), UserProfileScreen()];
  List<Widget> screenList2 =
      [const SalonOwner(), Specialists(), Offers(),AddCategory(),UserProfileScreen2()];
  int index = 0;

  change(int i) {
    index = i;
    emit(ChangeNavState());
  }
}
