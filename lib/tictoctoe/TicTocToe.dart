import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

class TicTocToe extends StatefulWidget {
  const TicTocToe({Key? key}) : super(key: key);

  @override
  State<TicTocToe> createState() => _TicTocToeState();
}

class _TicTocToeState extends State<TicTocToe> {
  List<String> myList = List.generate(9, (index) => "");
  List<int> myPosition = List.generate(9, (index) => index);
  var isYourTurn = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      color: Colors.white,
      child: GridView.builder(
         // shrinkWrap: true,
          itemCount: myList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 2,
            mainAxisSpacing: 2,
            crossAxisCount: 3,
          ),
          itemBuilder: (context, index) {
            return _gridSingleTile(myList[index],index);
          }),
    ));
  }

  Widget _gridSingleTile(String name, int index) {
    return GestureDetector(
      onTap: (){
        setState(() {
          if(isYourTurn && name.isEmpty)
            {
              myList[index] = "0";
              myPosition.remove(index);

              if(myPosition.length > 1)
                {
                  var random = (myPosition..shuffle()).first;
                  print("random Number $random");
                  print("myPosition List ${myPosition.toString()}");
                  //var random = myPosition.elementAt(Random().nextInt(myPosition.length));
                  myList[random] = "x";
                  myPosition.remove(random);
                }
              if(getIsWon().item1)
                {
                  isYourTurn = false;
                  if(getIsWon().item2 == "0")
                    {
                      print("You Won the game");
                    }
                  else{
                    print("Opponent Won the game");
                  }

                }
            }
        });
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black54,
            width: 0.3,
          ),
        ),
        child: Center(
          child: Text(
            name,
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  Tuple2<bool,String> getIsWon()
  {

    if(myList[0].isNotEmpty && myList[1].isNotEmpty && myList[2].isNotEmpty && myList[0] == myList[1] && myList[1] == myList[2])
      {
        return Tuple2(true,myList[0]);
      }
    else if(myList[3].isNotEmpty && myList[4].isNotEmpty && myList[5].isNotEmpty && myList[3] == myList[4] && myList[4] == myList[5])
    {
      return Tuple2(true,myList[3]);
    }
    else if(myList[6].isNotEmpty && myList[7].isNotEmpty && myList[8].isNotEmpty && myList[6] == myList[7] && myList[7] == myList[8])
    {
      return Tuple2(true,myList[6]);
    }
    else if(myList[0].isNotEmpty && myList[3].isNotEmpty && myList[6].isNotEmpty && myList[0] == myList[3] && myList[3] == myList[6])
    {
      return Tuple2(true,myList[0]);
    }
    else if(myList[1].isNotEmpty && myList[4].isNotEmpty && myList[7].isNotEmpty && myList[1] == myList[4] && myList[4] == myList[7])
    {
      return Tuple2(true,myList[1]);
    }
    else if(myList[2].isNotEmpty && myList[5].isNotEmpty && myList[8].isNotEmpty && myList[2] == myList[5] && myList[5] == myList[8])
    {
      return Tuple2(true,myList[2]);
    }
    else if(myList[0].isNotEmpty && myList[4].isNotEmpty && myList[8].isNotEmpty && myList[0] == myList[4] && myList[4] == myList[8])
    {
      return Tuple2(true,myList[0]);
    }
    else if(myList[2].isNotEmpty && myList[4].isNotEmpty && myList[6].isNotEmpty && myList[2] == myList[4] && myList[4] == myList[6])
    {
      return Tuple2(true,myList[2]);
    }
    else{
      return const Tuple2(false,'');
    }
  }
}
