import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> xOrOList = ['', '', '', '', '', '', '', '', ''];
  bool isTurnx = true;
  String winnerTitle = "";
  int countOfFiilBox = 0;
  bool hasResult = false;
  int numberOfWinnerOfx = 0;
  int numberOfWinnerOfO = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TicTacToe"),
        backgroundColor: Colors.grey[800],
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  xOrOList = ['', '', '', '', '', '', '', '', ''];
                  winnerTitle = "";
                  hasResult = false;
                  isTurnx = true;
                  countOfFiilBox = 0;
                });
              },
              icon: Icon(Icons.refresh))
        ],
      ),
      backgroundColor: Colors.grey[800],
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            returnScoabord(),
            SizedBox(
              height: 10,
            ),
            getResultButton(),
            SizedBox(
              height: 15,
            ),
            getBoardGame(),
            SizedBox(
              height: 20,
            ),
            getTurn()
          ],
        ),
      ),
    );
  }

  Widget returnScoabord() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Text(
              "player x",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              numberOfWinnerOfx.toString(),
              style: TextStyle(fontSize: 20, color: Colors.white),
            )
          ],
        ),
        Column(
          children: [
            Text(
              "player O",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              numberOfWinnerOfO.toString(),
              style: TextStyle(fontSize: 20, color: Colors.white),
            )
          ],
        )
      ],
    );
  }

  Widget getResultButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 200,
          child: OutlinedButton(
            onPressed: () {},
            child: Text(
              winnerTitle,
              style: TextStyle(fontSize: 17),
            ),
            style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                side: BorderSide(
                  color: Colors.white,
                )),
          ),
        )
      ],
    );
  }

  Widget getBoardGame() {
    return Container(
        height: 400,
        child: Expanded(
            child: GridView.builder(
                itemCount: 9,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (BuildContext context, int Index) {
                  return GestureDetector(
                    onTap: () {
                      onTappedP(Index);
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 1)),
                      child: Center(
                        child: Text(
                          xOrOList[Index],
                          style: TextStyle(
                            color: Colors.amber,
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ),
                  );
                })));
  }

  Widget getTurn() {
    if (isTurnx == true) {
      return Text(
        "Turn x",
        style: TextStyle(color: Colors.amber, fontSize: 30),
      );
    } else {
      return Text(
        "Turn 0",
        style: TextStyle(color: Colors.amber, fontSize: 30),
      );
    }
  }

  void onTappedP(int index) {
    if (hasResult == true) {
      return;
    }
    setState(() {
      if (xOrOList[index] != '') {
        return;
      }
      countOfFiilBox = countOfFiilBox + 1;
      if (isTurnx == true) {
        xOrOList[index] = "x";
      } else {
        xOrOList[index] = "o";
      }
      isTurnx = !isTurnx;
      checkWiner();
    });
  }

  void checkWiner() {
    if (xOrOList[0] == xOrOList[1] &&
        xOrOList[0] == xOrOList[2] &&
        xOrOList[0] != '') {
      setResult(xOrOList[0]);
    }
    if (xOrOList[0] == xOrOList[3] &&
        xOrOList[0] == xOrOList[6] &&
        xOrOList[0] != '') {
      setResult(xOrOList[0]);
    }
    if (xOrOList[1] == xOrOList[4] &&
        xOrOList[1] == xOrOList[7] &&
        xOrOList[1] != '') {
      setResult(xOrOList[1]);
    }
    if (xOrOList[2] == xOrOList[5] &&
        xOrOList[2] == xOrOList[8] &&
        xOrOList[2] != '') {
      setResult(xOrOList[2]);
    }
    if (xOrOList[3] == xOrOList[4] &&
        xOrOList[5] == xOrOList[3] &&
        xOrOList[3] != '') {
      setResult(xOrOList[3]);
    }
    if (xOrOList[6] == xOrOList[7] &&
        xOrOList[6] == xOrOList[8] &&
        xOrOList[6] != '') {
      setResult(xOrOList[6]);
    }
    if (xOrOList[0] == xOrOList[4] &&
        xOrOList[0] == xOrOList[8] &&
        xOrOList[0] != '') {
      setResult(xOrOList[0]);
    }
    if (xOrOList[2] == xOrOList[4] &&
        xOrOList[2] == xOrOList[6] &&
        xOrOList[2] != '') {
      setResult(xOrOList[2]);
    }
    if (countOfFiilBox == 9 && winnerTitle == "") {
      setResult("equle");
    }
  }

  void setResult(String winner) {
    setState(() {
      if (winner == "equle") {
        winnerTitle = "equle";
        return;
      } else if (winner == "x") {
        numberOfWinnerOfx = numberOfWinnerOfx + 1;
      } else if (winner == "O") {
        numberOfWinnerOfO = numberOfWinnerOfO + 1;
      }
      winnerTitle = winner + "win ,please play again";
      hasResult = true;
    });
  }
}
