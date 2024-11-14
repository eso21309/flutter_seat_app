import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SeatBottom extends StatelessWidget {
  SeatBottom(this.selectedCol, this.selectedRow);

  int? selectedCol;
  int? selectedRow;

  @override
  Widget build(BuildContext context) {
    return Container(
      //이영역은 고정되어야 하므로 (Expanded 위젯을 사용하지 않고) 높이갚을 지정해줌
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(24),
          )),
      child: Column(
        children: [
          SizedBox(height: 24),
          Text(
            selectedRow == null && selectedCol == null
                ? '선택된 좌석 없음'
                : "$selectedRow - $selectedCol"
                    "선택된 좌석 없음",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 24),
          SizedBox(
            width: 200,
            height: 56,
            child: ElevatedButton(
              onPressed: () {
                showCupertinoDialog(
                    context: context,
                    builder: (context) {
                      return CupertinoAlertDialog(
                        title: Text("예약확인"),
                        content: Text("예약하시겠습니까?"),
                        actions: [
                          CupertinoDialogAction(
                              isDefaultAction: true,
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("취소")),
                          CupertinoDialogAction(
                              isDestructiveAction: true,
                              onPressed: () {},
                              child: Text("확인")),
                        ],
                      );
                    });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
              ),
              child: Text("Book now"),
            ),
          )
        ],
      ),
    );
  }
}
