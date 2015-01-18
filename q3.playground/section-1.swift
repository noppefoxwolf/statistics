 // Playground - noun: a place where people can play
import Foundation

 //---init----
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
 
 var xArray:[Int]=[];
 var yArray:[Int]=[];
 var zArray:[Int]=[];
 
 for i in 0...numbers.count-1 {
    if i%3==0 {
        xArray.append(numbers[i])
    }else if i%3==1 {
        yArray.append(numbers[i])
    }else if i%3==2 {
        zArray.append(numbers[i])
    }
 }
 
 //---method---
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
    let ave:Double = average(data)
    for num in data {
        result += pow(Double(num)-ave, Double(2))
    }
    return result
 }
 
 //分散
 func variance(data:[Int])->Double{
    return sumOfSquares(data)/Double(data.count-1)
 }
 
 //共分散
 func covariance(data1:[Int],data2:[Int])->Double{
    return sumOfProducts(data1, data2)/Double(data1.count-1)
 }
 
 //積和
 func sumOfProducts (data1:[Int],data2:[Int])->Double{
    var result:Double = 0.0;
    let ave1:Double = average(data1)
    let ave2:Double = average(data2)
    for i in 0...data1.count-1 {
        let num1:Double = Double(data1[i])
        let num2:Double = Double(data2[i])
        result += (num1-ave1)*(num2-ave2)
    }
    return result;
 }
 
 //標準偏差
 func standardDeviation(data:[Int])->Double{
    return sqrt(variance(data))
 }
 
 //----answer---
 
 //問1
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
 
 //問2
 let b:Double = covariance(xArray,zArray)/variance(xArray)
 print("問3.2 b = \(b)")
 print("問3.2 a = \(average(zArray) - (b * average(xArray)))")
 
 //問3
 let n = Double(xArray.count);
 let Sxx = sumOfSquares(xArray) - (n * pow(average(xArray), Double(2)))
 let Syy = sumOfSquares(yArray) - (n * pow(average(yArray), Double(2)))
 let Sxy = sumOfProducts(xArray, yArray) - (n * average(xArray) * average(yArray))
 let Szz = sumOfSquares(zArray) - (n * pow(average(zArray), Double(2)))
 let Sxz = sumOfProducts(xArray, zArray) - (n * average(xArray) * average(zArray))
 let Syz = sumOfProducts(yArray, zArray) - (n * average(yArray) * average(zArray))
 

 let b1 = ((Sxz*Syy) - (Syz * Sxy))/((Sxx * Syy) - pow(Sxy, Double(2)))
 let b2 = ((Syz*Sxx) - (Sxz * Sxy))/((Sxx * Syy) - pow(Sxy, Double(2)))
 let b0 = average(zArray) - b1 * average(xArray) - b2 * average(yArray)
 
 print("問3.3 b0 = \(b0)")
 print("問3.3 b1 = \(b1)")
 print("問3.3 b2 = \(b2)")
 
