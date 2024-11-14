import 'package:flutter/material.dart';
import 'package:flutter_seat_app/seat_bottom.dart';
import 'package:flutter_seat_app/seat_select_box.dart';

// 앱을 시작하는 부분
void main() {
  runApp(const MyApp());
}

//앱 기본설정
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override //부모 메서드를 자식이 재정의하겠다는 뜻
  Widget build(BuildContext context) {
    return MaterialApp(
      //머터리얼앱의 기능과 디자인을 하위 페이지에서 쓸수 있다는 뜻
      home: SeatPage(), //앱이 시작될 때 보여질 첫 화면을 지정 //아래에 만든 SeatPage 클래스를 넣으면 됨

      //home: 속성을 정의하는 (내장된!)네임드 파라미터
      //SeatPage > 위젯(Widget)을 반환하는 클래스명 또는 함수명
      //() > 이 함수/클래스를 호출하겠다는 뜻
    );
  }
}

class SeatPage extends StatefulWidget {
  @override
  State<SeatPage> createState() => _SeatPageState();
  // 1. State<SeatPage>: "SeatPage의 상태를 관리할 거야"
  // 2. createState(): "자, 상태 관리자를 만들자"
  // 3. => _SeatPageState(): "이제 SeatPageState가 상태 관리를 담당할거야!"
}

// 그래서 아래에서 실제 상태 관리를 하는 SeatPageState 클래스를 만드는 것임
class _SeatPageState extends State<SeatPage> {
  // 여기서 실제로 상태 변수들을 정의하고 관리한다.

  //줄번호가 처음에는 선택되지 않았을테니 우선 null로 선언한다.
  //null이므로 초기값을 넣어주지 않아도 되는 것이다.
  int? selectedRow;
  int? selectedCol;

  //좌석 선택시 호출되는 함수
  //위의 selectedRow, selectedCol 파라미터를 받아서
  //사용할때 쓸 임시 변수명을 정의하는거고 나중에 이 변수명에 데이터가 들어가는 것임
  void onSelected(int row, int col) {
    setState(() {
      selectedRow = row;
      selectedCol = col;
    });
  }

  @override
  Widget build(BuildContext context) {
    //StatelessWidget의 build 메소드를 가져와서 재정의 하는 것임
    return Scaffold(
      appBar: AppBar(
        title: const Text("Seats"),
      ),
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [
          SeatSelectBox(selectedRow, selectedCol, onSelected),
          SeatBottom(selectedRow, selectedCol),
        ],
      ),
    );
  }
}
