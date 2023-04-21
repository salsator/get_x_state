import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_state/constant/function.dart';
import 'package:get_x_state/model/monsterClass.dart';
import 'package:get_x_state/view_model.dart';
import 'package:get_x_state/widget.dart';


class fightPage extends StatefulWidget {
  const fightPage({Key? key}) : super(key: key);

  @override
  State<fightPage> createState() => _fightPageState();
}

class _fightPageState extends State<fightPage> {
 final ViewModel vm = Get.put(ViewModel());

 @override
  void initState() {
    tryFunction("ahoj", neco: 1,);
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 70, bottom: 20, left: 20, right: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children:  [
                    const Text("životy"),
                   Obx(() => Text(vm.zivoty.toString()))
                  ],
                ),
                Column(
                  children:  [
                    const Text("jmeno"),
                    Obx(() => Text(vm.jmeno.toString()))
                  ],
                ),
                Column(
                  children:  [
                    const Text("mana"),
                    Obx(() => Text(vm.mana.toString()))
                  ],
                ),
              ],
            ),

            FutureBuilder(
                builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {

                  return Image.network(vm.mod.monstra[0].image);

                },
            ),
           widget(color: Colors.red,),
            widget(color: Colors.blue),
            widget(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(onPressed: () => vm.fastStrike()
                , child: Text(ahoj()) ),
                TextButton(onPressed: () => vm.heavyStrike()
                    , child: Text("silný úder") ),
                TextButton(onPressed: () => vm.defenceStrike()
                    , child: Text("obranný úder") ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

tryFunction(String hondnota, { int cislo1 = 3, int? neco})
{
  print(" hodnota: $hondnota \n cislo1: $cislo1 \n cislo2: $neco");
}