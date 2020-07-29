import 'package:flutter/material.dart';
import 'package:padak_starter/model/data/dummys_repository.dart';
import 'model/response/movies_response.dart';
// 1-3. Grid 리스트 화면 (임포트)

class GridPage extends StatelessWidget {
  // 1-4. Grid 리스트 화면 (동적 데이터 추가)
  final List<Movie> movies = DummysRepository.loadDummyMovies();

  @override
  Widget build(BuildContext context) {
    // 1-4. Grid 리스트 화면 (GridView 구축)
    return GridView.builder( //builder를 쓰면 뭐가달라지는거지? context가 추가되는거?

      //GridView 내에서 설정이 필요한 내용들을 설정할 수 있습니다.
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //한 줄에 보여줄 아이템 수를 정의합니다.
        crossAxisCount: 2,

        //종횡비를 설정합니다. (int1, int2) int1은 가로길이, int2는 세로길이
        childAspectRatio: (9 / 16),
      ),

      //리스트를 나열하는 방법을 정의.
      scrollDirection: Axis.vertical, //수직
      itemCount: movies.length,
      itemBuilder: (context, index)
      => _buildGridItem(context, index: index),
    );
  }

// 1-4. Grid 리스트 화면 (Grid 아이템 화면 구축)
  Widget _buildGridItem(BuildContext context, {@required int index}) {
    Movie movie = movies[index];

    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        children: <Widget>[
          //남은 여백만큼 크기를 늘려줌. 공백을 없앰
          Expanded(
              child: Stack(
                alignment: Alignment.topRight,
                children: <Widget>[
                  Image.network(
                    movie.thumb,
                    fit: BoxFit.fill,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    child: _buildGradeImage(movie.grade),
                  )
                ],
              )
          ),
            SizedBox(height: 8,),

          //부모 위젯에 맞추어 자식 위젯의 위치와 높이/너비 값을 수정하고 싶을 때 사용.
          FittedBox(
            child: Text(
              movie.title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 8,),
          Text(
            '${movie.reservationGrade}위(${movie.userRating}) /'
                '${movie.reservationRate}%'
          ),
          SizedBox(height: 8,),
          Text('${movie.date}')
        ],
      ),
    );
  }

// 1-4. Grid 리스트 화면 (관람 등급 이미지 버튼 함수 생성)
  Widget _buildGradeImage(int grade) {
    switch (grade) {
      case 0:
        return Image.asset(("assets/ic_allages.png"));
      case 12:
        return Image.asset(("assets/ic_12.png"));
      case 15:
        return Image.asset(("assets/ic_15.png"));
      case 19:
        return Image.asset(("assets/ic_19.png"));
      default:
        return null;
    }
  }
}
