

/*
  - Variable Declaration
  - Functions
  - Lists
  - Class
  - Exceptions
*/

/*

void main(){
  print("========== Variable Declaration =========");

  // Mutable (Implicit)
  var tmp1 = "CodeMobiles";
  var tmp2 = 123;
  var tmp3 = true;

  // Mutable (Explicit)
  String tmp4 = "Flutter";
  int tmp5 = 456;
  bool tmp6 = true;
  tmp6 = false;

  print("$tmp1, $tmp2, $tmp3");
  print("$tmp4, $tmp5, $tmp6");

  // Immutable - Final and const Variable Declaration
  final tmp7 = 1234;
  //tmp7 = 555; // Error: a final variable can only be set once.
  const tmp8 = 1234;
  //tmp8 = 555; // Error: a final variable can only be set once.

  final tmp9 = tmp7;
  //const tmp10 = tmp7; // Error: Const variables must be initialized with a constant value.

  // Object and dynamic
  dynamic fName = "Tanakorn"; // Object
  print("$fName is ${fName.runtimeType}");
  fName = 5555;
  print("$fName is ${fName.runtimeType}");

  Object lName = "Ngam";
  print("$lName is ${lName.runtimeType}");

  fName = "Mr. Tanakorn";
  print(fName.length); // no warning
  //print(fName.codemobiles); // no warning but error at runtime
  //print(lName.length); // warning: The getter 'length' is not defined for the class 'Object'

  // case study
  dynamic x = 1; // is int
  x = x + 2;
  //x = x + "2"; // Invalid argument: "2" error at runtime

  // Uninitialized variables have an initial value of null.
  int age;
  bool isSmart;

  print("$age, $isSmart");
}*/

/*
void main() {
  print("========== Functions =========");

  normalFun();
  argumentFun("CM", "Dev");
  print("sum1 = ${sum1(5, 5)}");
  print("sum2 = ${sum2(5, 5)}");
  print("sum3 = ${sum3(5, 5)}");
  print("sum4 = ${sum4(5, 5)}");

  // Optional named, positional, default value parameters
  mul1(x2: 2, x1: 5); // named
  mul2(x2: 7, x1: 5); // named + default value
  mul3(3, 5); // positional + default value

  printName(fName: "Yai", lName: "Lek"); //named
  printName(fName: "Yai"); // optional + named
  printAge(123);// optional + without named
}

void normalFun() {
  print("normalFunction");
}

void argumentFun(String fName, String lName) {
  print("fName: $fName, lName: $lName");
}

int sum1(int x1, int x2) {
  return x1 + x2;
}

sum2(x1, x2) {
  return x1 + x2;
}

int sum3(int x1, int x2) => x1 + x2;

sum4(x1, x2) => x1 + x2;

void mul1({int x1, int x2}) {
  print("mul1 = $x1, $x2");
  var result = x1 * x2;
  print("mul1 = $result");
}

void mul2({int x1, int x2, int x3 = 1}) {
  var result = x1 * x2 * x3;
  print("mul2 = $result");
}

void mul3([int x1, int x2, int x3 = 1]) {
  var result = x1 * x2 * x3;
  print("mul3 = $result");
}


void printName({String fName, String lName}){
  print(fName + lName);
}

void printAge([int age = 555]){
  print(age);
}
*/

/*

void main(){
  print("========== Lists =========");

  List<int> list1 = List(3); // Fixed-length
  list1[0] = 11;
  list1[1] = 12;
  list1[2] = 13;
  //list1.add(14); // Unsupported operation: add
  //list1.remove(11);  //Unsupported operation: remove
  print("list1: $list1");

  list1[0] = 999;
  print("list1: ${list1[0]}");
  list1[0] = null;
  print("list1: $list1");

  List<int> list2 = List(); // Growable List
  list2.add(555);
  list2.add(222);
  print("list2: $list2");
  list2.remove(222); // removeAt(0), clear()
  print("list2: $list2");

  List<int> list3 = [1, 2, 3]; // Growable List
  list3.add(4);
  print("list3: $list3");

  List<int> list4 = const [3, 4, 5]; // const + Fixed-length
  //list4[0] = 777; // Unsupported operation: indexed set
  //list4[0] = null; // Unsupported operation: indexed set
  //list4.add(9); // Unsupported operation: add
  //list4.remove(3); // // Unsupported operation: add
  print("list4: $list4");

  List<String> list5 = ["Aaa", "bbb", "cccc"];
  List<String> list6 = ["111", "222"];
  List<String> list7 = ["!!!!", "@@@@", "####", "%%%%"];

  // old
  list5.addAll(list6);
  list5.addAll(list7);

  // new
  //var temp1 = list5..removeAt(5)..addAll(list6)..addAll(list7);

  var temp2 = [...list5];  //["Aaa", "bbb", "cccc"];

  print(list5
    ..addAll(list6)
    ..removeAt(0)
    ..addAll(list7));

  var mergeList = [
    ...list5,
    ...list6,
    if (false) ...list7,
    for (int i = 0; i < 2; i++) "i:${i}"
  ];
  print(mergeList);
}
*/



import 'package:meta/meta.dart';

void main(){
  print("========== Class =========");

  // const is both an immutable binding and an immutable object
  const user = {'name': 'iblur blur'};

  // Static error: "Constant variables cannot be assigned a value".
  // user = {};

  // Unsupported operation: Cannot modify unmodifiable Map
  //user['name'] = 'cat';

  var obj1 = PersonV1(fName: "fasfasf");
  obj1.fName = "iblur blur";
  obj1.display();

  var obj2 = PersonV2();
  obj2.fName = "test";
  obj2.display();

  var obj3 = PersonV2.setData("codemobiles", "flutter");
  obj3.display();

  // Getter and Setter
  var obj4 = PersonV3();
  obj4.male = "tanakorn";
  obj4.lName = "Ngam";
  obj4.display();
  print(obj4.vip);

  // Callable
  var obj5 = PersonV3();
  print(obj5("Android", "iOS"));

  // const object
  const obj6 = Person4("tanakorn", "ngam");
  //obj6.fName = "test";
}

class PersonV1 {
  String fName;
  String lName;


  PersonV1({this.fName, this.lName});


  //PersonV1(){}
  // error: The default constructor is already defined.
//  PersonV1(String fName, String lName){
//    this.fName = fName;
//    this.lName = lName;
//  }

  void display() {
    print("PersonV1 : $fName, $lName");
  }
}

class PersonV2 {
  String fName;
  String lName;

  PersonV2() {
    fName = "none";
    lName = "none";
  }

  // Use a named constructor to implement multiple constructors
  PersonV2.setData(String fName, String lName) {
    this.fName = fName;
    this.lName = lName;
  }

  //PersonV2.setData(this.fName, this.lName);

  void display() {
    print("PersonV2 : $fName, $lName");
  }
}

class PersonV3 {
  String fName;
  String lName;

  set male(String fName) {
    this.fName = "Mr. $fName";
  }

  set female(String fName) {
    this.fName = "Mrs. $fName";
  }

  String get vip => "[VIP] $fName, $lName";

  void display() {
    print("PersonV3 : $fName, $lName");
  }

//    call() {
//       print("PersonV3 : $fName  $lName \n");
//    }


  // var xxx = PersonV3("fsafasf","Fasfasf);

  String call(String fName, String lName) {
    return "PersonV3 : $fName  $lName";
  }
}

// const aaa = Person4("fasfasf", "Fasfasf);
//aaa.fName

class Person4 {
  final String fName;
  final String lName;

  const Person4(this.fName, this.lName);
}

// Error: This class inherits from a class marked as @immutable, and therefore
// should be immutable (all instance fields must be final).
@immutable
class Person5 {
  String fName;
  String lName;

  Person5(this.fName, this.lName);
}
