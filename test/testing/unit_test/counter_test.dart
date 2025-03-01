import 'package:firebase_series/testing/unit_test/counter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // given when then

  // pretest
  // setup  ---> set up is called before every test
  // setupall --- setupall is called before all the tests

  // diagram setUp
  // setup --> test --> setup --> test --> setup --> test

  // diagram setupall
  // setupall --? test --> test -- test

  // postTest
  // teardown  ---> teardown is called after every test
  // teardownall ----> teardownall is called after all the tests

  // diagram tearDown
  // test --> teardown --> test --> teardown --> test --> teardown

// test --> tearDownAll
// test --> test --> test --> tearDownAll

// Testing

  group('Counter class -', () {
    late Counter counter;

    setUp(() {
      counter = Counter();
    });

    test('given counter class when counter is intantiated then counter is 0',
        () {
      // Arrange

      // Act
      int val = counter.count;
      // assert
      expect(val, 0);
    });

    test('given counter class when counter is incremented then counter is 1',
        () {
      // arrange
      //   final Counter counter = Counter();
      // Act
      counter.incrementCounter();
      final val = counter.count;
      // Assert
      expect(val, 1);
    });

    test('given Counter class when decremnted then counter is -1', () {
      //Arrange

      // Act
      counter.decrementCounter();
      final val = counter.count;
      // Assert
      expect(val, -1);
    });

    test('given counter class when reset is called then counter is 0', () {
      //act 
      counter.reset();
      final val = counter.count;

      // Assert
      expect(val,0);
    });
  });
}
