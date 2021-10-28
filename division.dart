import 'dart:math';

List wordList = [];
List wordListNum = [];
List wordListKey = [];
List wordListVal = [];
List<int> yDown = [];
List<int> yUp = [];
Map<String, Set> wordKV = {};

void main() {
  setData();
  maxMinList();
  divisionList();
  makingKV();


  wordKV.entries.forEach((entry) { 
    final key = entry.key;
    final value = entry.value;

    print('$key : $value');
  });

// setData 확인
  // int i = 0;
  // print("\n 단어 번호 출력");
  // while (true) {
  //   print(wordListNum[i].word);
  //   if (i >= wordListNum.length - 1) {
  //     break;
  //   }
  //   i++;
  // }
  // print("\n 단어 출력");
  // int j = 0;
  // while (true) {
  //   print(wordListKey[j].word);

  //   if (j >= wordListKey.length - 1) {
  //     break;
  //   }
  //   j++;
  // }
  // print("\n 뜻 출력");
  // int k = 0;
  // while (true) {
  //   print(wordListVal[k].word);

  //   if (k >= wordListVal.length - 1) {
  //     break;
  //   }
  //   k++;
  // }
}

//단어 속성 클래스
class StructWord {
  String word;
  int x1, x2, x3, x4;
  int y1, y2, y3, y4;

  StructWord(this.word, this.x1, this.y1, this.x2, this.y2, this.x3, this.y3,
      this.x4, this.y4);
}


//OCR데이터 X축 기준으로 구분
setData() {
  wordList.addAll([
    // StructWord('ø선반', 225, 53, 281, 50, 283, 69, 227, 72),
    // StructWord('The_sneakers were organized on the shelves according to', 226,
    //     78, 800, 99, 799, 122, 226, 102),
    // StructWord('-3% shelf', 27, 95, 118, 63, 127, 87, 36, 119),
    // StructWord('12', 840, 97, 855, 97, 855, 112, 840, 112),
    // StructWord('T', 31, 660, 62, 654, 44, 672, 49, 642),
    // StructWord('ø 호화, 사치(품)', 225, 622, 367, 622, 367, 645, 225, 645),
    // StructWord('Aextravagance', 375, 627, 537, 627, 537, 645, 375, 645),
    // StructWord('@ 사치(품)의', 545, 625, 657, 625, 657, 647, 545, 647),
    // StructWord('luxury', 61, 640, 132, 635, 133, 657, 62, 662),
    // StructWord("lielf", 64, 112, 93, 104, 98, 122, 69, 130),
    // StructWord("their size", 225, 115, 312, 115, 312, 132, 225, 132),
    // StructWord(
    //     "운동화가 사이즈에 따라 선반에 정돈되어 있었다.", 224, 138, 567, 144, 567, 168, 224, 161),
    // StructWord("집어넣다", 242, 212, 320, 212, 320, 232, 242, 232),
    // StructWord("2", 227, 217, 237, 217, 237, 232, 227, 232),
    // StructWord("If_you.wanttouse.a.shopping.cart,you.sometimes.have.to", 224,
    //     240, 800, 256, 799, 279, 224, 263),
    // StructWord("37 insert", 34, 249, 128, 223, 134, 246, 39, 271),
    // StructWord("linss:t", 64, 271, 114, 258, 118, 275, 68, 288),
    // StructWord("pay a small.deposit.by inserting.a coin.기술", 224, 270, 634, 279,
    //     634, 302, 223, 294),
    // StructWord("쇼핑 카트를 사용하고 싶다면 동전을 집어넣어 약간의보증금을 내야 한다.", 224, 297, 740, 309,
    //     739, 333, 223, 321),
    // StructWord("+ insertion @주입", 225, 332, 400, 332, 400, 352, 225, 352),
    // StructWord("@1, 필요(성) 2. 필수품 øessential øluxury 사치품", 222, 400, 710, 412,
    //     709, 436, 221, 424),
    // StructWord("7378necessity", 26, 432, 166, 410, 170, 435, 30, 458),
    // StructWord("Shopping is no longerjusta necessity,a way to get the", 222,
    //     435, 800, 446, 799, 469, 221, 458),
    // StructWord("[nasøsati]", 65, 455, 126, 445, 129, 465, 68, 475),
    // StructWord("things we must have to survive.기출", 222, 467, 555, 467, 555,
    //     487, 222, 487),
    // StructWord("쇼핑은 더 이상ø필수, 즉ø우리가 생존하기 위해 꼭 가져야 하는 것들을 얻는 방법이", 224, 491, 800,
    //     500, 799, 522, 224, 514),
    // StructWord("아니다", 222, 525, 272, 525, 272, 542, 222, 542),
    // StructWord("tnecessary@필수적인", 222, 555, 439, 555, 439, 572, 222, 572),
    // StructWord("Aextravagance", 375, 627, 537, 627, 537, 645, 375, 645),
    // StructWord("Parents might send the wrong signal to their children that",
    //     222, 657, 799, 657, 799, 677, 222, 677),
    // StructWord("[LikGri]", 65, 672, 113, 665, 115, 680, 68, 688),
    // StructWord("celebrating a special.day.requires money.and.luxury.기출", 222,
    //     687, 757, 687, 757, 707, 222, 707),
    // StructWord("부모들은 특별한 날을 축하하는 데 돈과 사치가 필요하다는 잘못된 신호를 아이들", 224, 714, 797,
    //     714, 797, 734, 224, 734),
    // StructWord("에게 보내는 지도 모른다.", 221, 742, 399, 737, 400, 757, 222, 762),
    // StructWord("fluxurious", 222, 774, 337, 774, 337, 792, 222, 792),
    // StructWord("@사치스러운", 341, 774, 448, 774, 448, 789, 341, 789),
    // StructWord("경매에서 팔다.@경매", 242, 845, 442, 845, 442, 865, 242, 865),
    // StructWord("auction", 60, 854, 141, 849, 142, 870, 61, 875),
    // StructWord("V", 225, 850, 237, 850, 237, 865, 225, 865),
    // StructWord("7380", 30, 860, 57, 860, 57, 875, 30, 875),
    // StructWord("In 2006, one of Picasso's_portraits ofher,Dora Maar au", 221,
    //     877, 799, 872, 800, 892, 221, 897),
    // StructWord("[5:k(on", 67, 885, 107, 885, 107, 900, 67, 900),
    // StructWord("Chat was auctioned at Sotheby's at a closing price of", 222,
    //     904, 799, 904, 799, 924, 222, 924),
    // StructWord("\$95,216,000.기출", 220, 937, 380, 937, 380, 955, 220, 955),
    // StructWord("피카소가 그린 그녀의 초상화 중ø하나인 '도라 마르의 초상'이 2006년에 소더비즈", 221, 965, 799,
    //     957, 800, 977, 222, 985),
    // StructWord("에서 낙찰가 95,216,000 달러에 경매되었다.", 219, 992, 546, 992, 546, 1010,
    //     219, 1010),
    // StructWord("sum", 65, 1067, 107, 1067, 107, 1085, 65, 1085),
    // StructWord("@1.합계.øtotal.2.금액 .3amount", 221, 1062, 564, 1057, 565, 1078,
    //     222, 1083),
    // StructWord("13F", 37, 1070, 52, 1070, 52, 1080, 37, 1080),
    // StructWord("SAM", 70, 1097, 97, 1097, 97, 1110, 70, 1110),
    // StructWord("The sum of two numbers is 14", 221, 1096, 514, 1091, 515, 1111,
    //     221, 1116),
    // StructWord("두 수의 합은 14이다", 220, 1125, 372, 1125, 372, 1142, 220, 1142),
    // StructWord("+summation_@요약", 219, 1157, 419, 1152, 420, 1172, 219, 1176),
    // StructWord("Day 13 . 133", 700, 1185, 805, 1185, 805, 1202, 700, 1202),
    StructWord("@1.번역,번역서_2.각색,개작", 192, 175, 430, 175, 430, 192, 192, 192),
    StructWord("version", 50, 194, 122, 183, 124, 199, 53, 209),
    StructWord("1.", 730, 195, 750, 195, 750, 207, 730, 207),
    StructWord("InaversionfromthePhilippines,aforestspirithelpsthe", 191, 205,
        697, 198, 697, 218, 192, 225),
    StructWord("7A54", 16, 209, 45, 201, 48, 211, 20, 220),
    StructWord("v6:r3an", 47, 220, 103, 212, 105, 226, 49, 234),
    StructWord(
        "Cinderella.character.기출", 192, 232, 392, 232, 392, 245, 192, 245),
    StructWord(
        "필리핀의번역서에서는숲의정령이신데렐라라는인물을돕는디", 194, 255, 587, 255, 587, 272, 194, 272),
    StructWord("ø판권,저작권", 192, 347, 305, 347, 305, 365, 192, 365),
    StructWord("@저작권이있는", 317, 347, 445, 347, 445, 365, 317, 365),
    StructWord("ø저작권을취득하다", 454, 348, 612, 344, 612, 363, 454, 367),
    StructWord("coPxright", 44, 366, 141, 352, 147, 393, 50, 407),
    StructWord("0457", 18, 378, 44, 367, 49, 380, 23, 390),
    StructWord("cCopyrightsprotecttheauthorsinthesamewaythatpatents", 191, 376,
        699, 373, 700, 391, 192, 394),
    StructWord("protectinventors", 192, 407, 329, 400, 330, 419, 192, 425),
    StructWord("특허권이발명가들을보호하는것과같이저작권은저자들을보호한다.", 191, 428, 619, 424, 620, 442,
        192, 446),
    StructWord("+hold(own)acopyright", 189, 458, 397, 455, 397, 472, 189, 475),
    StructWord("저작권을소유하다", 402, 457, 520, 457, 520, 472, 402, 472),
    StructWord(
        "copyrightvs.plagiarism", 123, 510, 302, 505, 302, 520, 124, 525),
    StructWord("Culturetip", 20, 522, 101, 514, 103, 533, 22, 541),
    StructWord("범일영서(행자아리(SCCAR일이)는따마호우활엘생권일제부ø협격하게ø체험화니다.시립ø병주저행위", 29, 554,
        676, 530, 678, 592, 31, 617),
    StructWord("@1.어조.2.음색,음조ø.souno", 189, 704, 454, 704, 454, 724, 189, 724),
    StructWord("Z458tone", 16, 717, 92, 713, 92, 728, 16, 732),
    StructWord("By.using.a.conversationaltoneinyourletters,youcanadda", 189,
        737, 702, 729, 702, 748, 189, 756),
    StructWord("Ttoun", 47, 742, 87, 742, 87, 752, 47, 752),
    StructWord(
        "friendlytouchtovourmessage", 189, 765, 447, 761, 447, 776, 189, 780),
    StructWord("편지에대화하는어조를사용하면메시지에친근한분위기를더할수있다", 189, 790, 639, 780, 640, 798,
        189, 807),
    StructWord("@귀족", 563, 878, 622, 874, 623, 891, 565, 896),
    StructWord("ø459noble", 17, 885, 102, 885, 102, 905, 17, 905),
    StructWord(
        "@1.고귀한,고상한_2.귀족의øignoble천한", 189, 884, 557, 876, 557, 897, 189, 905),
    StructWord("Inoubl", 50, 915, 90, 915, 90, 927, 50, 927),
    StructWord("The-cellistplayswithlongsingingphrasesandnobletone", 191, 915,
        677, 904, 677, 921, 192, 933),
    StructWord(
        "그첼로연주자는긴노래하는악구와고상한음조로연주한다.", 191, 938, 574, 930, 575, 948, 192, 956),
    StructWord("t.nobility_@고귀함,귀족", 188, 967, 376, 967, 376, 985, 188, 985),
    StructWord("@지휘,행동", 485, 1054, 582, 1054, 582, 1074, 485, 1074),
    StructWord("Z460conduct", 14, 1061, 125, 1064, 124, 1085, 13, 1081),
    StructWord("ø1.지휘하다_2.행동하다.", 190, 1060, 397, 1060, 397, 1082, 190, 1082),
    StructWord("실시하다", 402, 1060, 475, 1060, 475, 1077, 402, 1077),
    StructWord("O(kendikt", 47, 1092, 125, 1092, 125, 1107, 47, 1107),
    StructWord("Heisamusicteacherandvolunteerstimeafterschooltc", 189, 1095,
        707, 1082, 707, 1101, 189, 1114),
    StructWord(
      "økøndakt",
      46,
      1110,
      125,
      1115,
      124,
      1131,
      46,
      1127,
    ),
    StructWord(
        "conduct.chorusrehearsals", 188, 1125, 421, 1117, 422, 1134, 189, 1142),
    StructWord("그는음악교사이고방과후에자원하여합창단연습을지휘한다", 188, 1150, 589, 1136, 590, 1155,
        189, 1168),
    StructWord("+.conductor@지휘자", 189, 1178, 369, 1173, 370, 1191, 189, 1197),
    StructWord("Day16", 617, 1207, 675, 1207, 675, 1222, 617, 1222),
    StructWord("16", 685, 1207, 712, 1207, 712, 1222, 685, 1222)
  ]);
}

// 영단어 번호의 y좌표 최대,최소 산출
maxMinList() {
  for (int listNum = 0; listNum < wordList.length; listNum++) {
    if (wordList[listNum].x1 <= 40) {
      List<int> y = [
        wordList[listNum].y1,
        wordList[listNum].y2,
        wordList[listNum].y3,
        wordList[listNum].y4
      ];
      yDown.add(y.reduce(max));
      yUp.add(y.reduce(min));
    }
  }
}

// 단어번호, 영단어, 뜻으로 구분
divisionList() {
  for (int i = 0; i < yDown.length; i++) {
    //yDown - yUp 범위에 해당하는 리스트를 영단어, 뜻으로 구분하여 저장
    for (int j = 0; j < wordList.length; j++) {
      List<int> y = [
        wordList[j].y1,
        wordList[j].y2,
        wordList[j].y3,
        wordList[j].y4
      ];
      if ((y[0] <= yDown[i] + 10 || y[1] <= yDown[i] + 10) &&
          (y[2] >= yUp[i] - 10 || y[3] >= yUp[i] - 10)) {
//영단어 번호 저장
        if (wordList[j].x1 <= 40) {
          wordListNum.add(StructWord(
              wordList[j].word.replaceAll(RegExp('[a-zA-Z가-힣() .ø]'), ''),
              wordList[j].x1,
              wordList[j].y1,
              wordList[j].x2,
              wordList[j].y2,
              wordList[j].x3,
              wordList[j].y3,
              wordList[j].x4,
              wordList[j].y4));
        }

        //영단어 리스트 저장
        if (wordList[j].x1 <= 80 &&
            wordList[j].x2 >= 80 &&
            wordList[j].word[0] != '[') {
          wordListKey.add(StructWord(
              wordList[j].word.replaceAll(RegExp('[^a-zA-Z]'), '#'),
              wordList[j].x1,
              wordList[j].y1,
              wordList[j].x2,
              wordList[j].y2,
              wordList[j].x3,
              wordList[j].y3,
              wordList[j].x4,
              wordList[j].y4));
        }

        // 영어 뜻 저장
        else if (wordList[j].x1 >= 120) {
          String saveListValWord = '';
          for (int delEng = 0; delEng < wordList[j].word.length; delEng++) {
            if (delEng > 3) {
              if (validateString(wordList[j].word[delEng - 2] +
                      wordList[j].word[delEng - 1] +
                      wordList[j].word[delEng]) ==
                  'english') {
                break;
              }
            }
            saveListValWord += wordList[j].word[delEng];
          }
          wordList[j].word = saveListValWord;
          
          if (wordList[j].word.replaceAll(RegExp('[a-zA-Z@_ø 0-9,]'), '') !=
              '') {
            wordListVal.add(StructWord(
                wordList[j].word.replaceAll(RegExp('[a-zA-Z@_ø0-9,-.\']'), '#'),
                wordList[j].x1,
                wordList[j].y1,
                wordList[j].x2,
                wordList[j].y2,
                wordList[j].x3,
                wordList[j].y3,
                wordList[j].x4,
                wordList[j].y4));
          }
        }
      }
    }
  }
  ;
  wordListNum.sort((a, b) => a.y1.compareTo(b.y1));
  wordListKey.sort((a, b) => a.y1.compareTo(b.y1));
  wordListVal.sort((a, b) => a.y1.compareTo(b.y1));
}

makingKV() {
  for (int i = 0; i < wordListKey.length; i++) {
    String save = '';
    Set<String> saveListVal = {};

    double keyYAvr = (wordListKey[i].y1 +
            wordListKey[i].y2 +
            wordListKey[i].y3 +
            wordListKey[i].y4) /
        4;

    double KeyYerr = ((wordListKey[i].y3 - wordListKey[i].y1) +
            (wordListKey[i].y4 - wordListKey[i].y2)) /
        2;

    List saveKey = wordListKey[i].word.split('#');

    for (int j = 0; j < wordListVal.length; j++) {
      double ValYAvr = (wordListVal[j].y1 +
              wordListVal[j].y2 +
              wordListVal[j].y3 +
              wordListVal[j].y4) /
          4;
      if (keyYAvr + KeyYerr + 10 > ValYAvr &&
          keyYAvr - KeyYerr - 10 < ValYAvr) {
        save += wordListVal[j].word;
      }
    }

    for (String reSave2 in save.split('#')) {
      if (reSave2 != '') {
        saveListVal.add(reSave2);
      }
    }
    if (saveListVal.isNotEmpty) {
      wordKV.addAll({saveKey[saveKey.length-1].toLowerCase(): saveListVal});
    }
  }
}

//문자열이 숫자일때 number 리턴
String validateNumber(String value) {
  // String patttern = r'(^[a-zA-Z ]*$)';
  RegExp regExp = new RegExp(r'^[+-]?([0-9]+([.][0-9]*)?|[.][0-9]+)$');
  if (value.length == 0) {
    return "Store Number  is Required";
  } else if (!regExp.hasMatch(value)) {
    return "Store Number must be only have numbers";
  }
  return "number";
}

//문자열이 영어일때 english 리턴
String validateString(String value) {
  String patttern = r'(^[a-zA-Z ]*$)';
  RegExp regExp = new RegExp(patttern);
  if (value.length == 0) {
    return "Rep Name is Required";
  } else if (!regExp.hasMatch(value)) {
    return "Name must be a-z and A-Z";
  }
  return "english";
}
