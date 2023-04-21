import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_x_state/database/monster.dart';
import 'package:get_x_state/pages/hero_created/hero_view_model.dart';

class HeroCreatePage extends StatefulWidget {
  const HeroCreatePage({Key? key}) : super(key: key);

  @override
  State<HeroCreatePage> createState() => _HeroCreatePageState();
}

class _HeroCreatePageState extends State<HeroCreatePage> {

  final HeroViewModel vm = HeroViewModel();
// late Monster actualMonster;

  @override
  void initState() {
    super.initState();
  // actualMonster = vm.getRandomMonstrum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: Text("vyber hrdinu"),),
      body: Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
         InkWell(
           onTap:() => vm.setButton(),
          child: Obx( () =>
             Container(
              height: 53,
              color: Colors.lightBlueAccent.shade100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Spacer(flex: 2,),
                  Text("akce"),
                  Spacer(
                    flex: 30,
                  ),
                  if ( vm.button == 1) ...[
                    Text("Ano")
                  ] else ... [
                    Text("ne")],
                  Spacer(flex: 10,),
                ],
              ),
            ),
          )
         )
          ],
        ),
      ),
    );
  }
}
