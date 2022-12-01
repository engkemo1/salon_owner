import 'package:flutter/material.dart';
import 'package:salon_owner/uidata.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salon_owner/viewModel/database_local/CacheHelper.dart';

import '../../viewModel/getx_controller/main_screen/main_screen_cubit.dart';
import '../../viewModel/getx_controller/main_screen/main_screen_state.dart';

class MainScreen2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
        create: (BuildContext context) {
          return MainScreenCubit();
        },
        child: BlocConsumer<MainScreenCubit,MainState>(listener: (BuildContext context, state) {  }, builder: (BuildContext context, Object? state) { return Scaffold(
          body: MainScreenCubit.get(context).screenList2[MainScreenCubit.get(context).index],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.shifting,
            backgroundColor: Colors.black,
            currentIndex: MainScreenCubit.get(context).index,
            items: [

              buildBottomNavigationBarItem(

                  const Icon(Icons.home,color: UIData.mainColor,), Text('Oppoiments',style: TextStyle(fontSize: 17,color: UIData.mainColor,fontWeight: FontWeight.bold),)),
              buildBottomNavigationBarItem(

                  const Icon(Icons.spoke_outlined,color: UIData.mainColor,), const Text('Specialists',style: TextStyle(fontSize: 17,color: UIData.mainColor,fontWeight: FontWeight.bold),)),
              buildBottomNavigationBarItem(
                  const Icon(Icons.local_offer,color: UIData.mainColor,), Text('Add offer',style: TextStyle(fontSize: 17,color: UIData.mainColor,fontWeight: FontWeight.bold))),
              buildBottomNavigationBarItem(
                  const Icon(Icons.control_point_duplicate,color: UIData.mainColor,), Text('Add Category',style: TextStyle(fontSize: 17,color: UIData.mainColor,fontWeight: FontWeight.bold))),

              buildBottomNavigationBarItem(
                  const Icon(Icons.person,color: UIData.mainColor,), Text('Profile',style: TextStyle(fontSize: 17,color: UIData.mainColor,fontWeight: FontWeight.bold))),

            ],
            onTap: (index) {
              MainScreenCubit.get(context).change(index);
            },
          ),
        ); },)
    );
  }
}

BottomNavigationBarItem buildBottomNavigationBarItem(
    Widget icon,
    Widget activeIcon,
    ) {
  return BottomNavigationBarItem(
    backgroundColor:UIData.darkColor,
    activeIcon: activeIcon,
    icon: icon,
    label: "",
  );
}
