// 计算变量

String calculationCount(num count) {
  int countTotal = count.round();
  String countString = countTotal.toString();
  int length = countString.length;
  if (length >= 100000000) {
    return countString.substring(0, length - 8) + "亿";
  } else if (length >= 10000) {
    return countString.substring(0, length - 4) + "万";
  } else {
    return countString.toString();
  }
}
