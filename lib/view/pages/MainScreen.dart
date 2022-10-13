import 'package:flutter/material.dart';
import 'package:salon_owner/uidata.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../viewModel/getx_controller/main_screen/main_screen_cubit.dart';
import '../../viewModel/getx_controller/main_screen/main_screen_state.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
        create: (BuildContext context) {
          return MainScreenCubit();
        },
        child: BlocConsumer<MainScreenCubit,MainState>(listener: (BuildContext context, state) {  }, builder: (BuildContext context, Object? state) { return Scaffold(
          body: MainScreenCubit.get(context).screenList[MainScreenCubit.get(context).index],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.shifting,
backgroundColor: Colors.black,
            currentIndex: MainScreenCubit.get(context).index,
            items: [
              buildBottomNavigationBarItem(

                  const Icon(Icons.home,color: UIData.mainColor,), Text('My Salon',style: TextStyle(fontSize: 17,color: UIData.mainColor,fontWeight: FontWeight.bold),)),
              buildBottomNavigationBarItem(
                  const Icon(Icons.safety_divider,color: UIData.mainColor,), Text('Specialists',style: TextStyle(fontSize: 17,color: UIData.mainColor,fontWeight: FontWeight.bold))),
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
