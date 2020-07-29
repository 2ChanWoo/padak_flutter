import 'package:flutter/material.dart';
import 'package:padak_starter/model/data/dummys_repository.dart';

import 'model/response/movies_response.dart';

// 1-3. 리스트 화면 (임포트)
class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 1-3. 리스트 화면 (동적 데이터 추가)

    // 1-3. 리스트 화면 (초기 리스트 구현)
    return ListView.separated(
        itemBuilder: (context, index){
          return _buildDummyItem(movies[index]);
        },
        separatorBuilder: (_, index) => Divider(color: Colors.grey,),
        itemCount: movies.length,
    );
  }


  /////////////////////////////////////////////////////////////////////////////


// 1-3. 리스트 화면 (고정 더미 데이터)
  Widget _buildDummyItem(Movie movie) {
    return Container(
      padding: EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.network(
            movie.thumb,
            height: 120,
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      movie.title,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(width: 8,),
                    _buildGradeImage(movie.grade)
                  ],
                ),
                SizedBox(width: 10,),
                Row(
                  children: <Widget>[
                    Text('평점 : ${movie.userRating}'),
                    SizedBox(width: 10,),
                    Text('예매순위 : ${movie.reservationGrade}'),
                    SizedBox(width: 10,),
                    Text('예매율 : ${movie.userRating}'),
                  ],
                ),
                SizedBox(width: 10,),
                Text('개봉일 : ${movie.date}'),
              ],
            ),
          )
        ],
      ),
    );
  }
// 1-3. 리스트 화면 (동적 데이터 호출1)
  final List<Movie> movies = DummysRepository.loadDummyMovies();

// 1-3. 리스트 화면 (관람 등급 이미지 버튼 함수 생성)
Widget _buildGradeImage(int grade){
    switch (grade) {
      case 0:
        return Image.asset(("assets/ic_allages.png"));
      case 12:
        return Image.asset(("assets/ic_12.png"));
      case 15:
        return Image.asset(("assets/ic_15.png"));
      case 19:
        return Image.asset(("assets/ic_19.png"));
      default :
        return null;
    }
}
}
