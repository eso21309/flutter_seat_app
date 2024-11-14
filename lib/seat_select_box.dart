import 'package:flutter/material.dart';

//메인의 자식위젯이라고 생각하면 됨

class SeatSelectBox extends StatelessWidget {
  SeatSelectBox(this.selectedRow, this.selectedCol, this.onSelected);
  //SeatSelectBox 함수를 사용할때는 위의 저 값을 넘겨주도록 생성자를 정의한다.
  //생성자에서 변수를 가져올때 필요한것만 가져오면 됨. 현재는 3개다 필요하니까 다 가져온것임.

  int? selectedCol;
  int? selectedRow;
  void Function(int row, int col) onSelected;
  //Funcion은 키워드임

  //메인에서 정의한 생성자의 구조와 변수, 동작(기능)을 쓰려면
  //위젯 파일에서 그걸 가져와서 복제해서 쓰겠다는 의미로 다시 선언해줘야함
  //각 위젯은 독립적이기 때문

  @override
  Widget build(BuildContext context) {
    return Expanded(
      //이 영역은 유동적으로 늘어나야 하기 때문에 Expanded를 사용
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Screen",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          row(1),
          SizedBox(height: 8),
          row(2),
          SizedBox(height: 8),
          row(3),
          SizedBox(height: 8),
          row(4),
          SizedBox(height: 8),
          row(5),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              lable("Available", Colors.grey),
              SizedBox(width: 16),
              lable("Selected", Colors.amber)
            ],
          )
        ],
      ),
    );
  }

  Row lable(String text, Color color) {
    return Row(
      children: [
        Text(text),
        SizedBox(width: 6),
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(8)),
        )
      ],
    );
  }

  Widget row(int rowNum) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: Center(
              child: Text(
                "$rowNum",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          seat(rowNum, 1),
          seat(rowNum, 2),
          seat(rowNum, 3),
          seat(rowNum, 4),
          seat(rowNum, 5),
          seat(rowNum, 6),
          seat(rowNum, 7),
          seat(rowNum, 8),
          seat(rowNum, 9),
          seat(rowNum, 10),
        ],
      ),
    );
  }

  Widget seat(int rowNum, int colNum) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: GestureDetector(
        onTap: () {
          onSelected(rowNum, colNum);
        },
        child: AspectRatio(
          aspectRatio: 1,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: rowNum == selectedRow && colNum == selectedCol
                  ? Colors.amber
                  : Colors.grey,
            ),
          ),
        ),
      ),
    ));
  }
}
