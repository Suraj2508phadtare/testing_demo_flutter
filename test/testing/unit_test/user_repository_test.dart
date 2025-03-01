import 'dart:io';
import 'package:firebase_series/testing/unit_test/user_model.dart';
import 'package:firebase_series/testing/unit_test/user_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';

class MockHttpClient extends Mock implements Client {}

void main() {
  //given
  // when
  // then
  late Repository repository;
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    repository = Repository(mockHttpClient);
  });

  group('User Reporsitory - ', () {
    group('get user Function -', () {
      test(
          'given repository class when getUserData is called and status code is 200 then user model will return',
          () async {
        // given

        when(() => mockHttpClient
                .get(Uri.parse('https://jsonplaceholder.typicode.com/users/1')))
            .thenAnswer(
          (invocation) async {
            return Response('''
                {
                    "id": 1,
                    "name": "Leanne Graham",
                    "username": "Bret",
                    "email": "Sincere@april.biz",
                    "address": {
                        "street": "Kulas Light",
                        "suite": "Apt. 556",
                        "city": "Gwenborough",
                        "zipcode": "92998-3874",
                        "geo": {
                            "lat": "-37.3159",
                            "lng": "81.1496"
                        }
                    },
                    "phone": "1-770-736-8031 x56442",
                    "website": "hildegard.org",
                    "company": {
                        "name": "Romaguera-Crona",
                        "catchPhrase": "Multi-layered client-server neural-net",
                        "bs": "harness real-time e-markets"
                    }
                }''', 200);
          },
        );

        // Act
        final user = await repository.getUserData();
        // Assert
        expect(user, isA<User>());
      });

      test(
          'given repository class when getUserData is called and status code is not equal to 200 then exception will be thrown',
          () {
        // given

        when(() => mockHttpClient
                .get(Uri.parse('https://jsonplaceholder.typicode.com/users/1')))
            .thenAnswer ((invocation) async {
              return Response('{}',500);
            },);
            
        // act
        final user = repository.getUserData();

        // assert
        expect(user, throwsException);
      });
    });
  });
}
