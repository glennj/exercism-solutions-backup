class ArmstrongNumbers {
  bool isArmstrongNumber(String number) {
    var len = number.length;

    /*
    var sum = BigInt.from(0);
    for (final digit in number.split('')) { 
      var d = BigInt.from(int.parse(digit));
      sum += d.pow(len);
    }
    */

    var sum = number.split('')
                    .map((digit) => BigInt.from(int.parse(digit)))
                    .fold(BigInt.from(0), (sum, num) => sum + num.pow(len));

    return sum.toString() == number;
  }
}
