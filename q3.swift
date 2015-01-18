 // Playground - noun: a place where people can play
 
 import UIKit
 
 //csvデータの定義
 let numbers : [ Int ] =
    [148,78,41,
    160,86,49,
    159,86,45,
    153,83,43,
    151,80,42,
    140,74,29,
    158,83,49,
    137,73,31,
    149,79,47,
    160,87,47,
    151,82,42,
    157,82,39,
    157,88,48,
    144,76,36,
    139,73,32,
    139,76,34,
    149,79,26,
    142,76,31,
    150,79,43,
    139,74,31]
 
 //各変数の定義
 var xArray:[Int]=[];
 var yArray:[Int]=[];
 var zArray:[Int]=[];
 //各変数配列への代入
 for i in 0...numbers.count-1 {
    if i%3==0 {
        xArray.append(numbers[i])
    }else if i%3==1 {
        yArray.append(numbers[i])
    }else if i%3==2 {
        zArray.append(numbers[i])
    }
 }
 
 //平均
 func average(data:[Int])->Double{
    var result:Double = 0.0;
    for num in data{
        result += Double(num)
    }
    return result/Double(data.count)
 }
 
 //平方和
 func sumOfSquares(data:[Int])->Double{
    var result:Double = 0.0;
    var ave:Double = average(data)
    for num in data {
        result += pow(Double(num)-ave, Double(2))
    }
    return result
 }
 
 //分散
 func variance(data:[Int])->Double{
    return sumOfSquares(data)/Double(data.count-1)
 }
 
 //標準偏差
 func standardDeviation(data:[Int])->Double{
    return sqrt(variance(data))
 }
 
 //各変数の平均
 print("問3.1.1.x = >\(average(xArray))")
 print("問3.1.1.y = >\(average(yArray))")
 print("問3.1.1.z = >\(average(zArray))")
 //各変数の分散
 print("問3.1.2.x = >\(variance(xArray))")
 print("問3.1.2.y = >\(variance(yArray))")
 print("問3.1.2.z = >\(variance(zArray))")
 //各変数の標準偏差
 print("問3.1.3.x = >\(standardDeviation(xArray))")
 print("問3.1.3.y = >\(standardDeviation(yArray))")
 print("問3.1.3.z = >\(standardDeviation(zArray))")
 
  